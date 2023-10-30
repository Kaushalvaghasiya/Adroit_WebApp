using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerUsers
    {
        List<CustomerUserGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int DeletedById, int loginId, string connectionString);
        int Save(CustomerUser value, string connectionString, int loginId);
        CustomerUserViewModel Get(int id, string connectionString, int loginId);
    }
}