﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AdminCustomerFirmBranchRepository : IAdminCustomerFirmBranch
    {
        public void Delete(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            QueryHelper.Save("sp_AdminCustomerFirmBranchDelete", connectionString, parameters);
        }
        public CustomerFirmBranchViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerFirmBranchViewModel>("sp_AdminCustomerFirmBranchGet", connectionString, parameters);
        }
        public List<CustomerFirmBranchGridViewModel> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<CustomerFirmBranchGridViewModel>("sp_AdminCustomerFirmBranchList", connectionString, param);
        }
        public int Save(CustomerFirmBranch value, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@Id", value.Id);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@PrintTitle", value.PrintTitle);
            parameters.Add("@ShortTitle", value.ShortTitle);
            parameters.Add("@FirmBranchTypeId", value.FirmBranchTypeId);
            parameters.Add("@Address1", value.Address1);
            parameters.Add("@Address2", value.Address2);
            parameters.Add("@Address3", value.Address3);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@PinCode", value.Pincode);
            parameters.Add("@Phone", value.Phone);
            parameters.Add("@ContactPersonName", value.ContactPersonName);
            parameters.Add("@Mobile", value.Mobile);
            parameters.Add("@MobileAlternate", value.MobileAlternate);
            parameters.Add("@Email", value.Email);
            parameters.Add("@GSTNumber", value.GSTNumber);
            parameters.Add("@PAN", value.PAN);
            parameters.Add("@EWBAddress1", value.EWBAddress1);
            parameters.Add("@EWBAddress2", value.EWBAddress2);
            parameters.Add("@RenewalDate", value.RenewalDate);
            parameters.Add("@SetupPrice", value.SetupPrice);
            parameters.Add("@RenewalPrice", value.RenewalPrice);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            parameters.Add("@Active", value.Active);
            parameters.Add("@SoftwarePlanId", value.SoftwarePlanId);

            return QueryHelper.Save("sp_AdminCustomerFirmBranchSave", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(int customerId, bool withFirmName = false, string connectionString = "")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerId", customerId);
            return QueryHelper.GetList<DropdownViewModel>(withFirmName ? "sp_AdminCustomerFirmBranchWithFirmListByCustomer_Select" : "sp_AdminCustomerFirmBranchListByCustomer_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(int firmId, string connectionString = "")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_AdminCustomerFirmBranchList_Select", connectionString, parameters);
        }
    }
}