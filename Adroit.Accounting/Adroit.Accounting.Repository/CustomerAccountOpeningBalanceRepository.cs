using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountOpeningBalanceRepository : ICustomerAccountOpeningBalance
    {
        public int Save(CustomerAccountOpeningBalanceViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@OpeningDate", value.OpeningDate);
            parameters.Add("@Credit", value.Credit);
            parameters.Add("@Amount", value.Amount);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            return QueryHelper.Save("sp_CustomerAccountOpeningBalanceSave", connectionString, parameters);
        }
        public CustomerAccountOpeningBalanceViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerAccountOpeningBalanceViewModel>("sp_CustomerAccountOpeningBalanceGet", connectionString, parameters);
        }
        public List<CustomerAccountOpeningBalanceGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerAccountOpeningBalanceGridViewModel>("sp_CustomerAccountOpeningBalanceList", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@Id", id);
            return QueryHelper.Delete("sp_CustomerAccountOpeningBalanceDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountOpeningBalanceList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountOpeningBalanceList_Select", connectionString, parameters);
        }
    }
}
