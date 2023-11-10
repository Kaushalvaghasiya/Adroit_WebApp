using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranchLRRate
    {
        int Save(CustomerFirmBranchLRRate value, string connectionString);
        CustomerFirmBranchLRRateViewModel Get(int id, string connectionString);
        List<CustomerFirmBranchLRRateGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}