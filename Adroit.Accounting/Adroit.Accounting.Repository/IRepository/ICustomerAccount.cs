using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccount
    {
        public int Save(CustomerAccountViewModel value, string connectionString);
        public CustomerAccountViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<CustomerAccountGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<DropdownViewModel> GetCustomerAccountList(string connectionString, int loginId = 0, int firmId = 0);
        public List<string> GetTransporterGSTNumberList(string transporterName, string connectionString);
        public List<DropdownViewModel> GetCustomerAccountListByBranchMapping(int userId, int branchId, string connectionString);
        List<DropdownViewModel> GetCustomerAccountListWithAccountGroup(string connectionString, int loginId = 0, int firmId = 0);
    }
}
