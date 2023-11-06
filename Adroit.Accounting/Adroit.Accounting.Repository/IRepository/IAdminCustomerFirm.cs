using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAdminCustomerFirm
    {
        int Save(CustomerFirm value, string connectionString);
        CustomerFirmViewModel Get(int id, string connectionString);
        List<CustomerFirmGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0);
        void Delete(int id, int deletedById, string connectionString);
        List<DropdownViewModel> SelectList(int customerId, string connectionString);
    }
}