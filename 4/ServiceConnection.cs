using System;
using System.Data;
using System.Data.SqlClient; 

public class ConexionBaseDatos
{
    private string cadenaConexion;
    
    public ConexionBaseDatos(string connectionString)
    {
        this.cadenaConexion = connectionString;
    }

    public DataSet EjecutarConsultaSelect(string consulta)
    {
        using (SqlConnection conexion = new SqlConnection(cadenaConexion))
        {
            DataSet dataSet = new DataSet();
            try
            {
                conexion.Open();
                SqlDataAdapter adaptador = new SqlDataAdapter(consulta, conexion);
                adaptador.Fill(dataSet);
            }
            catch (Exception ex)
            {
                
                Console.WriteLine("Error al ejecutar SELECT: " + ex.Message);
            }
            return dataSet;
        }
    }

    public int EjecutarNonQuery(string consulta)
    {
        using (SqlConnection conexion = new SqlConnection(cadenaConexion))
        {
            int filasAfectadas = 0;
            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                filasAfectadas = comando.ExecuteNonQuery();
            }
            catch (Exception ex)
            {
               
                Console.WriteLine("Error al ejecutar consulta: " + ex.Message);
            }
            return filasAfectadas;
        }
    }

    public int ObtenerNumeroFilasSelect(string consulta)
    {
        using (SqlConnection conexion = new SqlConnection(cadenaConexion))
        {
            int numeroFilas = 0;
            try
            {
                conexion.Open();
                SqlCommand comando = new SqlCommand(consulta, conexion);
                SqlDataReader reader = comando.ExecuteReader();
                while (reader.Read())
                {
                    numeroFilas++;
                }
                reader.Close();
            }
            catch (Exception ex)
            {
                
                Console.WriteLine("Error al obtener número de filas: " + ex.Message);
            }
            return numeroFilas;
        }
    }
}
