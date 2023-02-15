using Dapper;
using System.Data;
using System.Data.SqlClient;

namespace Adroit.Accounting.SQL
{
    public class CommonDataOperations
    {
        public static SqlConnection GetConnection(string connectionString = "")
        {
            return new SqlConnection(connectionString);
        }
        public static int Execute(string query, string connectionString = "")
        {
            using (var conn = GetConnection(connectionString))
            {
                return conn.Execute(query);
            }
        }

        public static DataSet Query(string query, List<SqlParameter> args = null, CommandType cmdType = CommandType.Text, string connectionString = "")
        {
            DataSet ds = new DataSet();

            using (var conn = GetConnection(connectionString))
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.CommandType = cmdType;
                if (args != null && args.Count > 0)
                {
                    cmd.Parameters.AddRange(args.ToArray());
                }
                if (conn.State != ConnectionState.Open)
                {
                    conn.Open();
                }
                using (SqlDataAdapter adp = new SqlDataAdapter(cmd))
                {
                    adp.Fill(ds);
                }
            }
            return ds;
        }
        public static IEnumerable<T> Query<T>(string query, object args = null, string connectionString = "")
        {
            using (var conn = GetConnection(connectionString))
            {
                return conn.Query<T>(query, args).ToList();
            }
        }
    }
}
