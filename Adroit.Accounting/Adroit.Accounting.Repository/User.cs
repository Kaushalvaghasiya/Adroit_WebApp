using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class User : IUser
    {
        public int Save(UserDetail userDetail, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userDetail.UserId);
            parameters.Add("@ID", userDetail.ID);
            parameters.Add("@FirstName", userDetail.FirstName);
            parameters.Add("@LastName", userDetail.LastName);
            return QueryHelper.Save("usp_AddUserDetail", connectionString, parameters);
        }
        public string SaveMembershipUser(MembershipUserDetail userDetail, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserName", userDetail.UserName);
            parameters.Add("@Email", userDetail.Email);

            return QueryHelper.SaveMembership("usp_AddMembershipUserDetail", connectionString, parameters);
        }
        public UserDetail GetUserDetail(string email, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", email);
            return QueryHelper.GetTableDetail<UserDetail>("usp_GetUserDetailByEmail", connectionString, parameters);
        }
        public UserDetail GetUserDetail(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ID", id);
            return QueryHelper.GetTableDetail<UserDetail>("usp_GetUserDetail", connectionString, parameters);
        }
        public List<UserDetail> GetUsersByAccount(int accountId, string connectionString)
        {
            var param = new DynamicParameters();
            param.Add("@AccountID", accountId);
            return QueryHelper.GetList<UserDetail>("usp_GetUsers", connectionString, param);
        }
        public void Delete(int ID, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ID", ID);
            QueryHelper.Save("usp_DeleteUserDetail", connectionString, parameters);
        }
        public void Active(int ID, bool isActive, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@ID", ID);
            parameters.Add("@IsActive", isActive);
            QueryHelper.Save("usp_ActiveUserDetail", connectionString, parameters);
        }
    }
}