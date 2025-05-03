using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using Sistema_Facturacion;

namespace Facturacion.Login
{
    public partial class FrmLogin : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            TextUsuario.Focus();
        }

        protected void BtnAceptar_Click(object sender, EventArgs e)
        {
            try
            {
                using (SqlConnection SqlCon = (SqlConnection)ConexionDB.getInstancia())
                {
                    using (SqlCommand cmd = new SqlCommand("sp_CheckLogin", SqlCon))
                    {
                        cmd.Parameters.Add(new SqlParameter("@usuario", TextUsuario.Text.Trim()));
                        cmd.Parameters.Add(new SqlParameter("@clave", TextClave.Text.Trim()));
                        cmd.CommandType = CommandType.StoredProcedure;
                        if (string.IsNullOrWhiteSpace(TextUsuario.Text) || string.IsNullOrWhiteSpace(TextClave.Text))
                        {
                            LblMensaje.Text = "Usuario y contraseña son obligatorios.";
                            return;
                        }

                        SqlCon.Open();
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                // Variables de sesión
                                Session["Log_Status"] = dr["Log_Status"].ToString();
                                Session["Log_Nombre"] = dr["Log_Nombre"].ToString();
                                Session["Log_Apellido"] = dr["Log_Apellido"].ToString();

                                if (Session["Log_Status"].ToString() == "Activo")
                                {
                                    LblMensaje.Text = "Mensaje: Login correcto";
                                    TextUsuario.Enabled = false;
                                    TextClave.Enabled = false;
                                    BtnAceptar.Enabled = false;
                                    ImgCerradura.ImageUrl = "~/imagenes/cerraduraVerde.png";
                                    Timer1.Enabled = true;
                                }
                                else if (Session["Log_Status"].ToString() == "Inhabilitado")
                                {
                                    LblMensaje.Text = "Mensaje: Usuario Inhabilitado";
                                    Timer1.Enabled = true;
                                }
                                else
                                {
                                    LblMensaje.Text = "Mensaje: Login incorrecto";
                                    Timer1.Enabled = true;
                                }
                            }
                            else
                            {
                                LblMensaje.Text = "Mensaje: Credenciales incorrectas";
                                Timer1.Enabled = true;
                            }
                        }
                    }
                }
            }
            finally 
            {
                // Guardar el error en un sistema de registro
                System.Diagnostics.Debug.WriteLine("Error en login: " + ex.Message);
                LblMensaje.Text = "Hubo un problema al conectar con la base de datos.";
            }
            }
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            // Acceder al menú de la aplicación y quitar mensajes
            if (LblMensaje.Text == "Mensaje: Login correcto")
            {
                Session["Log_Usuario"] = Session["Log_Nombre"];
                Response.Redirect("~/Login/Default.aspx");
            }
            else
            {
                LblMensaje.Text = "Mensaje:.";
            }
            Timer1.Enabled = false;
        }
    }
}