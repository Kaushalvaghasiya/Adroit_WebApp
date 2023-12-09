using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerBrokerBranchMappingRepository : ICustomerBrokerBranchMapping
    {
        public List<DropdownViewModel> SelectList(int branchId, string connectionString, int loginId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerBrokerBranchMappingList_Select", connectionString, parameters);
        }
    }
}
