using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IMenuSetting
    {
        List<MenuSettingGridViewModel> List(string connectionString, int loginId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(MenuSetting value, string connectionString);
        void Delete(int id, string connectionString);
        MenuSettingViewModel Get(int id, string connectionString);
        MenuSettingViewModel GetBySoftware(int softwareId, string connectionString);
        MenuSettingViewModel GetBySoftwarePlan(int softwarePlanId, string connectionString);
        MenuSettingViewModel GetByCustomer(int customerId, string connectionString);
        MenuSettingViewModel GetByFirm(int firmId, string connectionString);
        MenuSettingViewModel GetByBranch(int branchId, string connectionString);
        MenuSettingViewModel GetByUser(int branchId, int userId, string connectionString);
    }
}
