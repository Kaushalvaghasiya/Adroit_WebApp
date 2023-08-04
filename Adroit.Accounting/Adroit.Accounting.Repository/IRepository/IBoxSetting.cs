using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBoxSetting
    {
        List<BoxSettingGridViewModel> List(string connectionString, int loginId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(BoxSetting value, string connectionString);
        void Delete(int id, string connectionString);
        BoxSettingViewModel Get(int id, string connectionString);
        BoxSettingViewModel GetBySoftware(int softwareId, string connectionString);
        BoxSettingViewModel GetByCustomer(int customerId, string connectionString);
        BoxSettingViewModel GetByFirm(int firmId, string connectionString);
    }
}
