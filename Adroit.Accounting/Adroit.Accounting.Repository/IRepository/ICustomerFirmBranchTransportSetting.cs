using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranchTransportSetting
    {
        int Save(CustomerFirmBranchTransportSettingViewModel value, string connectionString);
        CustomerFirmBranchTransportSettingViewModel Get(int id, string connectionString);
        List<CustomerFirmBranchTransportSettingGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSettingListForLabel_Total(string lrNumberId, string connectionString, int loginId, int branchId);
    }
}