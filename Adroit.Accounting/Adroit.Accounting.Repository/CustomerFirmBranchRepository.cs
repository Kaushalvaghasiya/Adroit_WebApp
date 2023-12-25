using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmBranchRepository : ICustomerFirmBranch
    {
        public void Delete(int id, int loginId, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            QueryHelper.Save("sp_CustomerFirmBranchDelete", connectionString, parameters);
        }
        public CustomerFirmBranchViewModel Get(int id, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<CustomerFirmBranchViewModel>("sp_CustomerFirmBranchGet", connectionString, parameters);
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

            return QueryHelper.GetList<CustomerFirmBranchGridViewModel>("sp_CustomerFirmBranchList", connectionString, param);
        }
        public int Save(CustomerFirmBranch value, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@PrintTitle", value.PrintTitle);
            parameters.Add("@ShortTitle", value.ShortTitle);
            parameters.Add("@FirmBranchTypeId", value.FirmBranchTypeId);
            parameters.Add("@Address1", value.Address1);
            parameters.Add("@Address2", value.Address2);
            parameters.Add("@Address3", value.Address3);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@CountryId", value.CountryId);
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
            parameters.Add("@Active", value.Active);
            parameters.Add("@SoftwarePlanId", value.SoftwarePlanId);

            return QueryHelper.Save("sp_CustomerFirmBranchSave", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectListByLoginId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerFirmBranchListByLoginId_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> LoginCustomerSelectList(string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_LoginCustomerBranchListWithFirm_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectListByFirmId(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerFirmBranchListByFirmId_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectListWithFirmByFirmId(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerFirmBranchList_Select", connectionString, parameters);
        }
    }
}