using Dapper;
using System.Data;

namespace Adroit.Accounting.SQL
{
    public class QueryHelper
    {
        public static int Save(string query, string connectionString, DynamicParameters param)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                return conn.Query<int>(query, param, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }

        public static string SaveMembership(string query, string connectionString, DynamicParameters param)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                return conn.Query<string>(query, param, commandType: CommandType.StoredProcedure).FirstOrDefault();
            }
        }


        public static List<T> GetList<T>(string query, string connectionString, DynamicParameters param)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                return conn.Query<T>(query, param, commandType: CommandType.StoredProcedure).ToList();
            }
        }

        public static T GetTableDetail<T>(string query, string connectionString, DynamicParameters param, CommandType commandType = CommandType.StoredProcedure)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                return conn.Query<T>(query, param, commandType: commandType).FirstOrDefault();
            }
        }

        public static List<T> GetList<T>(string query, string connectionString)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                return conn.Query<T>(query, commandType: CommandType.Text).ToList();
            }
        }

        public static bool Delete(string query, string connectionString, DynamicParameters param)
        {
            using (var conn = CommonDataOperations.GetConnection(connectionString))
            {
                var result = conn.Query(query, param, commandType: CommandType.StoredProcedure);
                return true;
            }
        }
    }
}