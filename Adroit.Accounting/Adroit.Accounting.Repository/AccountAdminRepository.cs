using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AccountAdminRepository : IAccountAdmin
    {
        public List<DropdownViewModel> GetAccountAdminList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_AccountAdminList_Select", connectionString, parameters);
        }
        public int Save(AccountAdmin value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Name", value.Name);
            parameters.Add("@PrintName", value.PrintName);
            parameters.Add("@AccountGroupId", value.AccountGroupId);
            parameters.Add("@Address1", value.Address1);
            parameters.Add("@Address2", value.Address2);
            parameters.Add("@Address3", value.Address3);
            parameters.Add("@CityId", value.CityId);
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
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_AccountAdminSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_AccountAdminDelete", connectionString, parameters);
        }

        public AccountAdminViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<AccountAdminViewModel>("sp_AccountAdminGet", connectionString, parameters);
        }

        public List<AccountAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<AccountAdminGridViewModel>("sp_AccountAdminList", connectionString, param);
        }
    }
}
