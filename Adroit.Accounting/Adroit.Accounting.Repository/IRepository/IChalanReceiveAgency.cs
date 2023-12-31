using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IChalanReceiveAgency
    {
        public bool Delete(int id, string connectionString, int loginId);
        int Save(ChalanReceiveAgencyViewModel value, string connectionString);
        public ChalanReceiveAgencyViewModel Get(int id, string connectionString, int loginId, int branchId);
        public List<ChalanReceiveAgencyGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<ChalanReceiveAgencyDetailViewModel> GetDetailListByMasterId(string connectionString, int masterId, int loginId, int branchId, int firmId);
    }
}
