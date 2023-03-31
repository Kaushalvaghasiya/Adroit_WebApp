using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class UserRepository : IUser
    {
        public int Save(UserDetail value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", value.UserId);
            parameters.Add("@Id", value.ID);
            parameters.Add("@CustomerId", value.CustomerId);
            parameters.Add("@FirstName", value.FirstName);
            parameters.Add("@LastName", value.LastName);
            parameters.Add("@IsActive", value.IsActive);
            parameters.Add("@IsLocked", value.IsLock);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@ModifiedById", value.ModifiedById);
            return QueryHelper.Save("sp_CustomerUserSave", connectionString, parameters);
        }
        public UserDetail Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<UserDetail>("sp_UserGet", connectionString, parameters);
        }
        public UserDetail Get(Guid userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.GetTableDetail<UserDetail>("sp_UserGet", connectionString, parameters);
        }
        public UserDetail Get(string username, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", username);
            return QueryHelper.GetTableDetail<UserDetail>("sp_UserGet", connectionString, parameters);
        }
        public List<UserDetail> List(int customerId, string connectionString)
        {
            var param = new DynamicParameters();
            param.Add("@CustomerId", customerId);
            return QueryHelper.GetList<UserDetail>("sp_UserList", connectionString, param);
        }
        public void Delete(int id, int deletedById, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@DeletedBy", deletedById);
            QueryHelper.Save("sp_UserDelete", connectionString, parameters);
        }
        public void Active(int id, int activatedByUserId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@ModifiedById", activatedByUserId);
            QueryHelper.Save("sp_UserActivate", connectionString, parameters);
        }
        public void Deactive(int id, int deactivatedByUserId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@ModifiedById", deactivatedByUserId);
            QueryHelper.Save("sp_UserDeactivate", connectionString, parameters);
        }
    }
}