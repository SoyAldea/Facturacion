
using System;
using System.Data.SqlClient;
using System.Runtime.Remoting.Channels;
using System.Web.UI;

namespace Sistema_Facturacion
{
    public class ConexionDB
    {
        // Atributos
        private string Base;
        private string Servidor;
        private string Usuario;
        private string Clave;
        private bool seguridad;
        private static ConexionDB Con = null;

        // Métodos de conexión
        private ConexionDB()
        {
            this.Base = "Facturacion";
            this.Servidor = "DESKTOP-O1UG8FD";
            this.Usuario = "sa";
            this.Clave = "123456";
            this.seguridad = true;
        }

        // Método de conexión efectivo
        public SqlConnection CrearConexion()
        {
            SqlConnection Cadena = new SqlConnection();
            try
            {
                // Construcción base de la cadena de conexión
                Cadena.ConnectionString = "Server=" + this.Servidor + ";Database=" + this.Base + ";";

                // Validar tipo de autenticación
                if (this.seguridad)
                {
                    Cadena.ConnectionString += "Integrated Security=SSPI;";
                }
                else
                {
                    Cadena.ConnectionString += "User ID=" + this.Usuario + ";Password=" + this.Clave + ";";
                }
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error en la conexión: " + ex.Message);
            }
            return Cadena;
        }

        // Método para obtener la instancia de la conexión
        public static ConexionDB Getinstancia()
        {
            if (Con == null)
            {
                Con = new ConexionDB();
            }
            return Con;
        }

        internal static object getInstancia()
        {
            throw new NotImplementedException();
        }
    } // <- Se agregó este cierre de llave para corregir el error CS1513
    }