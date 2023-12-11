using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerInvoice
    {
        //List<DropdownViewModel> GetProductList(string connectionString, int loginId = 0, int firmId = 0);
        public List<SalesBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId);
        //int Save(CustomerInvoiceViewModel value, string connectionString, int firmId = 0);
        //CustomerInvoiceViewModel Get(int id, string connectionString, int loginId, int firmId = 0);
    }
}