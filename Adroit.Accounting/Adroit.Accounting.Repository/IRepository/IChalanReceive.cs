using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IChalanReceive
    {
        public bool Delete(int id, string connectionString, int loginId);
        int Save(ChalanReceiveViewModel value, string connectionString);
        public ChalanReceiveViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<ChalanReceiveGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public ChalanReceiveViewModel GetChalanMasterListByChalanNumber(string connectionString, int ChalanNumber, int loginId, int branchId, int firmId = 0);
        public List<ChalanReceiveGridViewModel> GetChalanDetailListByChalanNumber(string connectionString, int ChalanNumber, int loginId, int branchId, int firmId = 0);
    }
}
