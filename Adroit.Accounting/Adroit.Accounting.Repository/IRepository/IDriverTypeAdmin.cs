using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IDriverTypeAdmin
    {
        int Save(DriverTypeAdmin value, int userId, string connectionString);
        DriverTypeAdminViewModel Get(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        void Delete(int id, int userId, string connectionString);
        List<DriverTypeAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}