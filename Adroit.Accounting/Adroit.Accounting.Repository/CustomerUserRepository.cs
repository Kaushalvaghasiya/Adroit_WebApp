using Adroit.Accounting.Model;
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
            return QueryHelper.GetTableDetail<Model.CustomerUser>("sp_CustomerUserGet", connectionString, parameters);
        }

        public List<CustomerUser> GetBranchWIthFirmName(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@customerId", id);
            return QueryHelper.GetList<Model.CustomerUser>("sp_BranchWithFirmList_Select", connectionString, parameters);
        }

        public List<CustomerUser> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0)
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
            return QueryHelper.GetList<Model.CustomerUser>("sp_CustomerUserList", connectionString, param);
        }

        public int Save(Model.CustomerUser customerUser, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", customerUser.Id);
            parameters.Add("@FirstName", customerUser.FirstName);
            parameters.Add("@LastName", customerUser.LastName);
            parameters.Add("@UserId", customerUser.UserId);
            parameters.Add("@CustomerId", customerUser.CustomerId);
            parameters.Add("@IsActive", customerUser.IsActive);
            parameters.Add("@OwnerBranchId", customerUser.OwnerBranchId);
            parameters.Add("@BranchCSV", customerUser.BranchCSV);
            parameters.Add("@AddedById", customerUser.AddedById);
            parameters.Add("@ModifiedById", customerUser.ModifiedById);

            return QueryHelper.Save("sp_CustomerUserBranchSave", connectionString, parameters);
        }
    }
}