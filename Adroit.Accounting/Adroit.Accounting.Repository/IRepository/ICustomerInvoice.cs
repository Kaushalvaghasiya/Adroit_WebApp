using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerInvoice
    {
        public List<SalesBillMasterGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId);
        int Save(SalesBillMasterViewModel value, string connectionString, int firmId, int branchId, int loginId);
        public SalesBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId);
    }
}