using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IChalan
    {
        public bool Delete(int id, string connectionString, int loginId);
        int Save(PurchaseBillMasterViewModel value, string connectionString);
        public PurchaseBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public CustomerFirmBranchTransportSettingViewModel GetChalanLabelList(string connectionString, int loginId, int branchId);
        public CustomerFirmBranchTransportSettingViewModel GetChalanToPayAccountValueList(string lrNumberIds, string connectionString, int branchId);
        public List<LRBookingGridViewModel> GetListByLRNumberId(string connectionString, int lrNumberId, int loginId, int branchId, int firmId = 0);
        public List<DropdownViewModel> GetCustomerAccountBranchMappingList_Select(int loginId, int firmId, int branchId, int vehicleId, string connectionString);
    }
}
