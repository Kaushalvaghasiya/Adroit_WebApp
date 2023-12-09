using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerUser
    {
        List<CustomerUserGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int loginId, int firmId, string connectionString);
        int Save(CustomerUser value, int loginId, int firmId, string connectionString);
        CustomerUserViewModel Get(int id, int loginId, int firmId, string connectionString);
    }
}