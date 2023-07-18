using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerUserRepository : ICustomerUser
    {
        public void Delete(int id, int DeletedById, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@DeletedById", DeletedById);
            QueryHelper.Save("sp_CustomerUserDelete", connectionString, parameters);
        }

        public CustomerUser Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@userId", id);
            return QueryHelper.Get<CustomerUser>("sp_CustomerUserGet", connectionString, parameters);
        }

        public List<DropdownViewModel> GetBranchWIthFirmName(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@customerId", id);
            return QueryHelper.GetList<DropdownViewModel>("sp_BranchWithFirmList_Select", connectionString, parameters);
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
            return QueryHelper.GetList<CustomerUserGridViewModel>("sp_CustomerUserList", connectionString, param);
        }

        public int Save(CustomerUser value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@FirstName", value.FirstName);
            parameters.Add("@LastName", value.LastName);
            parameters.Add("@UserId", value.UserId);
            parameters.Add("@CustomerId", value.CustomerId);
            parameters.Add("@IsActive", value.IsActive);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@BranchCSV", value.BranchCSV);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);

            return QueryHelper.Save("sp_CustomerUserBranchSave", connectionString, parameters);
        }
    }
}