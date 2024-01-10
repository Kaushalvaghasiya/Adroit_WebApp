using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranch
    {
        int Save(CustomerFirmBranch value, int loginId, string connectionString);
        CustomerFirmBranchViewModel Get(int id, int firmId, string connectionString);
        List<CustomerFirmBranchGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int loginId, int firmId, string connectionString);
        List<DropdownViewModel> SelectListByLoginId(int userId, string connectionString);
        List<DropdownViewModel> SelectListByFirmId(int firmId, string connectionString);
        List<DropdownViewModel> SelectListByCustomerId(int firmId, string connectionString);
        List<DropdownViewModel> LoginCustomerSelectList(string connectionString, int loginId);
        List<DropdownViewModel> SelectListWithFirmByFirmId(int firmId, string connectionString);
        List<DropdownViewModel> SelectListForPendingChalan(int userId, string connectionString);
    }
}