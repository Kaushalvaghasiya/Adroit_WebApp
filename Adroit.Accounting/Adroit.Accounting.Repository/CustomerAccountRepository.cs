using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountRepository : ICustomerAccountRepository
    {
        public int Save(CustomerAccount customerAccount, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", customerAccount.Id);
            parameters.Add("@Name", customerAccount.Name);
            parameters.Add("@PrintName", customerAccount.PrintName);
            parameters.Add("@AccountGroupId", customerAccount.AccountGroupId);
            parameters.Add("@Address1", customerAccount.Address1);
            parameters.Add("@Address2", customerAccount.Address2);
            parameters.Add("@Address3", customerAccount.Address3);
            parameters.Add("@CityId", customerAccount.CityId);
            parameters.Add("@StateId", customerAccount.StateId);
            parameters.Add("@CountryId", customerAccount.CountryId);
            parameters.Add("@Pincode", customerAccount.Pincode);
            parameters.Add("@KM", customerAccount.KM);
            parameters.Add("@ContactPersonName", customerAccount.ContactPersonName);
            parameters.Add("@Mobile", customerAccount.Mobile);
            parameters.Add("@MobileAlternate", customerAccount.MobileAlternate);
            parameters.Add("@Email", customerAccount.Email);
            parameters.Add("@GSTNumber", customerAccount.GSTNumber);
            parameters.Add("@PAN", customerAccount.PAN);
            parameters.Add("@AreaName", customerAccount.AreaName);
            parameters.Add("@RateWithGST", customerAccount.RateWithGST);
            parameters.Add("@GSTInvoiceTypeId", customerAccount.GSTInvoiceTypeId);
            parameters.Add("@EximCode", customerAccount.EximCode);
            parameters.Add("@IsIGST", customerAccount.IsIGST);
            parameters.Add("@GSTNumberTransport", customerAccount.GSTNumberTransport);
            parameters.Add("@TransportName", customerAccount.TransportName);
            parameters.Add("@VehicleNumber", customerAccount.VehicleNumber);
            parameters.Add("@DeliveryAccountBranchMappingId", customerAccount.DeliveryAccountBranchMappingId);
            parameters.Add("@ShippingAccountBranchMappingId", customerAccount.ShippingAccountBranchMappingId);
            parameters.Add("@BrokerMappingId", customerAccount.BrokerMappingId);
            parameters.Add("@CreditDays", customerAccount.CreditDays);
            parameters.Add("@Discount", customerAccount.Discount);
            parameters.Add("@TDS", customerAccount.TDS);
            parameters.Add("@TCS", customerAccount.TCS);
            parameters.Add("@CreditLimit", customerAccount.CreditLimit);
            parameters.Add("@InterestRate", customerAccount.InterestRate);
            parameters.Add("@Commission", customerAccount.Commission);
            parameters.Add("@IsEcommerce", customerAccount.IsEcommerce);
            parameters.Add("@AdharUID", customerAccount.AdharUID);
            parameters.Add("@TAN", customerAccount.TAN);
            parameters.Add("@CompositParty", customerAccount.CompositParty);
            parameters.Add("@RCMParty", customerAccount.RCMParty);
            parameters.Add("@CapitalPercentage", customerAccount.CapitalPercentage);
            parameters.Add("@OwnerBranchId", customerAccount.OwnerBranchId);
            parameters.Add("@IsDeleted", customerAccount.IsDeleted);
            parameters.Add("@IsActive", customerAccount.IsActive);

            return QueryHelper.Save("sp_CustomerAccountSave", connectionString, parameters);
        }
        public CustomerAccount Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<CustomerAccount>("sp_CustomerAccountGet", connectionString, parameters);
        }
        public List<CustomerAccount> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerAccount>("sp_CustomerAccountList", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Id", id);
            return QueryHelper.Delete("sp_CustomerAccountDelete", connectionString, parameters);
        }

        public List<CustomerAccount> GetCustomerAccountList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<CustomerAccount>("sp_CustomerAccountList_Select", connectionString, parameters);
        }
    }
}
