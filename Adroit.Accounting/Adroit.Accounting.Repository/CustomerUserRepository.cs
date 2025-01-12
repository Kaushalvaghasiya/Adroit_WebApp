﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerUserRepository : ICustomerUser
    {
        public void Delete(int id, int loginId, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            QueryHelper.Save("sp_CustomerUserDelete", connectionString, parameters);
        }
        public CustomerUserViewModel Get(int id, int loginId, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", id);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<CustomerUserViewModel>("sp_CustomerUserGet", connectionString, parameters);
        }
        public List<CustomerUserGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerUserGridViewModel>("sp_CustomerUserList", connectionString, param);
        }
        public int Save(CustomerUser value, int loginId, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@UserId", value.UserId);
            parameters.Add("@Active", value.Active);
            parameters.Add("@FirstName", value.FirstName);
            parameters.Add("@LastName", value.LastName);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@AllowUpdateUserMenuSettingToCustomer", value.AllowUpdateUserMenuSettingToCustomer);
            parameters.Add("@CustomerUserBranchIds", value.CustomerUserBranchIds);
            parameters.Add("@FirmId", firmId);

            return QueryHelper.Save("sp_CustomerUserSave", connectionString, parameters);
        }
        public int UpdateUserLoggedInBranch(int loginId, int branchId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            
            return QueryHelper.Save("sp_CustomerUserLoggedInBranchSave", connectionString, parameters);
        }
        public int UpdateUserLoggedInYear(int loginId, int yearId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@YearId", yearId);
            return QueryHelper.Save("sp_CustomerUserLoggedInYearSave", connectionString, parameters);
        }
    }
}