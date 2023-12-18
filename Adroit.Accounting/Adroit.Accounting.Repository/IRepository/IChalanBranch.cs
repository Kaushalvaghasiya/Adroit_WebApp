using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IChalanBranch
    {
        public bool Delete(int id, string connectionString, int loginId);
        int Save(PurchaseBillMasterReceiveViewModel value, string connectionString);
        public PurchaseBillMasterReceiveViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<PurchaseBillMasterReceiveGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<PurchaseBillMasterReceiveGridViewModel> GetChalanDetailListByChalanNumber(string connectionString, int ChalanNumber, int loginId, int branchId, int firmId = 0);
    }
}
