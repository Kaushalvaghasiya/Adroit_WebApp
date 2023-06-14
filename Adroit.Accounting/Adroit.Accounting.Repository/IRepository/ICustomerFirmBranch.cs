using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranch
    {
        int Save(CustomerFirmBranch customerFirmBranch, string connectionString);

        CustomerFirmBranch Get(int id, string connectionString);

        List<CustomerFirmBranchGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");

        void Delete(int id, int deletedById, string connectionString);
    }
}