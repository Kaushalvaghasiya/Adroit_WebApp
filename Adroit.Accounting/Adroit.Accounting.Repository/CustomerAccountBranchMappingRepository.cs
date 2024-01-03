using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountBranchMappingRepository : ICustomerAccountBranchMapping
    {
        public List<DropdownViewModel> GetCustomerAccountBranchMappingList(int firmId, int branchId, string connectionString, int loginId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Code", "");
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountBranchMappingList_Select", connectionString, parameters);
        }
    }
}
