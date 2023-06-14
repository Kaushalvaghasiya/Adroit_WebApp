using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class CommonRepository : ICommon
    {
        public List<string> GetList(string connectionString, string tableName, string columnName)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@tablename", tableName);
            parameters.Add("@columnname", columnName);
            return QueryHelper.GetList<string>("sp_GetColumnData", connectionString, parameters);
        }

        public List<DropdownViewModel> GetDropdownList(string connectionString, string tableName, string columnName)
        {
            return (from item in GetList(connectionString, tableName, columnName).ToList()
                    select new DropdownViewModel() { Text = item, Value = item }).ToList();
        }
    }
}
