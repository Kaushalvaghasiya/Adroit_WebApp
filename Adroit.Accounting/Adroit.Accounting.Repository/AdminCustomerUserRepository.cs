using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AdminCustomerUserRepository : IAdminCustomerUser
    {
        public void Delete(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            QueryHelper.Save("sp_AdminCustomerUserDelete", connectionString, parameters);
        }
        public CustomerUserViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@userId", id);
            return QueryHelper.Get<CustomerUserViewModel>("sp_AdminCustomerUserGet", connectionString, parameters);
        }
        public CustomerUserViewModel Get(string username, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Username", username);
            return QueryHelper.Get<CustomerUserViewModel>("sp_CustomerUserGetByEmail", connectionString, parameters);
        }
        public List<CustomerUserGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0)
        {
            var param = new DynamicParameters();
            param.Add("@CustomerId", CustomerId);
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerUserGridViewModel>("sp_AdminCustomerUserList", connectionString, param);
        }
        public int Save(CustomerUser value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@CustomerId", value.CustomerId);
            parameters.Add("@UserId", value.UserId);
            parameters.Add("@Active", value.Active);
            parameters.Add("@FirstName", value.FirstName);
            parameters.Add("@LastName", value.LastName);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@AllowUpdateUserMenuSettingToCustomer", value.AllowUpdateUserMenuSettingToCustomer);
            parameters.Add("@CustomerUserBranchIds", value.CustomerUserBranchIds);

            return QueryHelper.Save("sp_AdminCustomerUserSave", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(int customerId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerId", customerId);
            return QueryHelper.GetList<DropdownViewModel>("sp_AdminCustomerUserList_Select", connectionString, parameters);
        }
    }
}