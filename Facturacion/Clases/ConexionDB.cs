using System;
using System.Data.SqlClient;

namespace Sistema_Facturacion {
    public class ConexionDB {
        // Atributos
        private string Base;
        private string Servidor;
        private string Usuario;
        private string Clave;
        private bool seguridad;
        private static ConexionDB Con = null;

        // Constructor privado
        private ConexionDB() {
            this.Base = "Facturacion"; // nombre de la base de datos
            this.Servidor = "DESKTOP-O1UG8FD"; // nombre del servidor
            this.Usuario = "sa";
            this.Clave = "123456";
            this.seguridad = false; // cambia a true si usarás Windows Authentication
        }

        // Método que crea la conexión
        public SqlConnection CrearConexion() {
            SqlConnection cadena = new SqlConnection();

            try {
                cadena.ConnectionString = $"Server={this.Servidor};Database={this.Base};";

                if (this.seguridad) {
                    cadena.ConnectionString += "Integrated Security=SSPI;";
                } else {
                    cadena.ConnectionString += $"User ID={this.Usuario};Password={this.Clave};";
                }
            } catch (Exception ex) {
                Console.WriteLine("Error en la conexión: " + ex.Message);
            }

            return cadena;
        }

        // Singleton para la clase
        public static ConexionDB Getinstancia() {
            if (Con == null) {
                Con = new ConexionDB();
            }
            return Con;
        }

        // Método estático que devuelve directamente una conexión
        public static SqlConnection getInstancia() {
            return Getinstancia().CrearConexion();
        }
    }
}
