using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IChalan
    {
        public bool Delete(int id, string connectionString, int loginId);
        int Save(PurchaseBillMaster value, string connectionString, int firmId, int branchId, int loginId);
        public PurchaseBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}
