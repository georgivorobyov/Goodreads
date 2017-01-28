using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Poetry.Data
{
    public sealed class SqlConnector : IDisposable
    {
        private SqlConnection connection;
        private List<SqlDataReader> readers;

        public SqlConnector()
        {
            readers = new List<SqlDataReader>();
            string connectionString = ConfigurationManager.ConnectionStrings["MySqlConnection"].ConnectionString;
            connection = new SqlConnection(connectionString);
            connection.Open();
        }

        public T ExecuteCommand<T>(string insertStatement, Dictionary<string, object> parameters = null)
        {
            SqlCommand myCommand = CreateCommand(insertStatement, parameters);
            return (T)myCommand.ExecuteScalar();
        }

        public SqlDataReader Read(string queryStatement, Dictionary<string, object> parameters = null)
        {
            SqlCommand myCommand = CreateCommand(queryStatement, parameters);
            SqlDataReader reader = myCommand.ExecuteReader();
            readers.Add(reader);
            return reader;
        }

        private SqlCommand CreateCommand(string statement, Dictionary<string, object> parameters)
        {
            SqlCommand myCommand = new SqlCommand(statement, connection);
            if (parameters != null)
                foreach (KeyValuePair<string, object> parameter in parameters)
                    myCommand.Parameters.AddWithValue(parameter.Key, parameter.Value);
            return myCommand;
        }

        public void Dispose()
        {
            foreach (SqlDataReader reader in readers)
                if (reader != null)
                {
                    if (reader.IsClosed == false) reader.Close();
                    reader.Dispose();
                }
            this.connection.Dispose();
        }
    }
}