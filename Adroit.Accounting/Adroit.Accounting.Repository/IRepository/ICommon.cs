using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICommon
    {
        List<string> GetList(string connectionString, string tableName, string columnName);
        List<DropdownViewModel> GetDropdownList(string connectionString, string tableName, string columnName);
    }
}
