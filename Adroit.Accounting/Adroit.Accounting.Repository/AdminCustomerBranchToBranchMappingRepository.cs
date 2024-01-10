using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AdminCustomerBranchToBranchMappingRepository : IAdminCustomerBranchToBranchMapping
    {
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_AdminCustomerBranchToBranchMappingDelete", connectionString, parameters);
        }
        public List<CustomerBranchToBranchMappingGridViewModel> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<CustomerBranchToBranchMappingGridViewModel>("sp_AdminCustomerBranchToBranchMappingList", connectionString, param);
        }
        public int Save(CustomerBranchToBranchMappingViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Branch", value.Branch);
            parameters.Add("@SharedBranch", value.SharedBranch);

            return QueryHelper.Save("sp_AdminCustomerBranchToBranchMappingSave", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString = "")
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_AdminCustomerBranchToBranchMappingList_Select", connectionString, parameters);
        }
    }
}