﻿using Adroit.Accounting.Model;
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
            parameters.Add("@Active", value.Active);
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
            return QueryHelper.Get<UserDetail>("sp_UserGet", connectionString, parameters);
        }
        public UserDetail Get(Guid userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<UserDetail>("sp_UserGet", connectionString, parameters);
        }
        public UserDetail Get(string username, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", username);
            return QueryHelper.Get<UserDetail>("sp_UserGet", connectionString, parameters);
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
        public List<DropdownViewModel> SelectList(int customerId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerId", customerId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerUserList_Select", connectionString, parameters);
        }
        public int GetLoggedInBranchId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Get<int>("sp_GetLoggedInBranchId", connectionString, parameters);
        }
        public int GetLoggedInFirmId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Get<int>("sp_GetLoggedInFirmId", connectionString, parameters);
        }
        public int? GetLoggedInYearId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Get<int?>("sp_GetLoggedInYearId", connectionString, parameters);
        }
    }
}