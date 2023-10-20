using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IDriver
    {
        int Save(Driver value, int userId, string connectionString);
        DriverViewModel Get(string email, int userId, string connectionString);
        DriverViewModel Get(int id, int userId, string connectionString);
        List<DriverGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        List<DropdownViewModel> SelectListBySoftware(byte softwareId, string connectionString);
        List<DropdownViewModel> SelectListBySoftwarePlan(byte softwarePlanId, string connectionString);
    }
}