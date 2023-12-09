using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerAccountOpeningBalance
    {
        public int Save(CustomerAccountOpeningBalanceViewModel value, string connectionString);
        public CustomerAccountOpeningBalanceViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<CustomerAccountOpeningBalanceGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<DropdownViewModel> GetCustomerAccountOpeningBalanceList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
