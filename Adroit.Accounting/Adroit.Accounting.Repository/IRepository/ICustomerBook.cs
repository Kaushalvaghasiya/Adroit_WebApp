using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerBook
    {
        public int Save(CustomerBook value, string connectionString, int loginId, int branchId, int firmId = 0);
        public CustomerBook Get(int id, string connectionString, int loginId);
        public List<CustomerBookGridViewModel> List(string connectionString, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId);
    }
}
