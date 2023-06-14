using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerUser
    {
        List<DropdownViewModel> GetBranchWIthFirmName(int id, string connectionString);

        List<CustomerUserGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0);

        void Delete(int id, int DeletedById, string connectionString);

        int Save(CustomerUser customerUser, string connectionString);

        CustomerUser Get(int id, string connectionString);
    }
}