using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountRepository : ICustomerAccount
    {
        public int Save(CustomerAccountViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@Id", value.Id);
            parameters.Add("@Name", value.Name);
            parameters.Add("@PrintName", value.PrintName);
            parameters.Add("@AccountGroupId", value.AccountGroupId);
            parameters.Add("@Address1", value.Address1);
            parameters.Add("@Address2", value.Address2);
            parameters.Add("@Address3", value.Address3);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@CountryId", value.CountryId);
            parameters.Add("@Pincode", value.Pincode);
            parameters.Add("@KM", value.KM);
            parameters.Add("@ContactPersonName", value.ContactPersonName);
            parameters.Add("@Mobile", value.Mobile);
            parameters.Add("@MobileAlternate", value.MobileAlternate);
            parameters.Add("@Email", value.Email);
            parameters.Add("@GSTNumber", value.GSTNumber);
            parameters.Add("@PAN", value.PAN);
            parameters.Add("@AreaName", value.AreaName);
            parameters.Add("@RateWithGST", value.RateWithGST);
            parameters.Add("@GSTInvoiceTypeId", value.GSTInvoiceTypeId);
            parameters.Add("@EximCode", value.EximCode);
            parameters.Add("@IsIGST", value.IsIGST);
            parameters.Add("@GSTNumberTransport", value.GSTNumberTransport);
            parameters.Add("@TransportName", value.TransportName);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@DeliveryAccountBranchMappingId", value.DeliveryAccountBranchMappingId);
            parameters.Add("@ShippingAccountBranchMappingId", value.ShippingAccountBranchMappingId);
            parameters.Add("@BrokerMappingId", value.BrokerMappingId);
            parameters.Add("@CreditDays", value.CreditDays);
            parameters.Add("@Discount", value.Discount);
            parameters.Add("@TDS", value.TDS);
            parameters.Add("@TCS", value.TCS);
            parameters.Add("@CreditLimit", value.CreditLimit);
            parameters.Add("@InterestRate", value.InterestRate);
            parameters.Add("@Commission", value.Commission);
            parameters.Add("@IsEcommerce", value.IsEcommerce);
            parameters.Add("@AdharUID", value.AdharUID);
            parameters.Add("@TAN", value.TAN);
            parameters.Add("@CompositParty", value.CompositParty);
            parameters.Add("@RCMParty", value.RCMParty);
            parameters.Add("@CapitalPercentage", value.CapitalPercentage);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@Active", value.Active);
            parameters.Add("@City", value.City);
            parameters.Add("@DistrictId ", value.DistrictId);
            parameters.Add("@District", value.District);
            parameters.Add("@TalukaId", value.TalukaId);
            parameters.Add("@Taluka", value.Taluka);
            parameters.Add("@Remarks", value.Remarks);
            parameters.Add("@CustomerAccountBranchIds", value.CustomerAccountBranchIds);

            return QueryHelper.Save("sp_CustomerAccountSave", connectionString, parameters);
        }
        public CustomerAccountViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerAccountViewModel>("sp_CustomerAccountGet", connectionString, parameters);
        }
        public List<CustomerAccountGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerAccountGridViewModel>("sp_CustomerAccountList", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.Delete("sp_CustomerAccountDelete", connectionString, parameters);
        }

        public List<DropdownViewModel> GetCustomerAccountList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountList_Select", connectionString, parameters);
        }
        public List<string> GetTransporterGSTNumberList(string transporterName, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@SearchName", transporterName);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<string>("sp_GetAllGSTNoByTransportName", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountListWithAccountGroup(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountWithAccountGroupList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountBranchMappingList_Select(int firmId, int branchId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccounBranchMappingList_Select", connectionString, parameters);
        }
    }
}
