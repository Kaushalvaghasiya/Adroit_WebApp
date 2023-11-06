using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirm
    {
        int Save(CustomerFirm value, int userId, string connectionString);
        CustomerFirmViewModel Get(int id, int userId, string connectionString);
        List<CustomerFirmGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int userId = 0);
        void Delete(int id, int userId, string connectionString);
    }
}