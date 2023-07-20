
using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerRepository : ICustomer
    {
        public int Save(Customer value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Name", value.Name);
            parameters.Add("@BusinessName", value.BusinessName);
            parameters.Add("@Address1", value.Address1 ?? "");
            parameters.Add("@Address2", value.Address2 ?? "");
            parameters.Add("@Address3", value.Address3 ?? "");
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@PinCode", value.Pincode ?? "");
            parameters.Add("@ContactPersonName", value.ContactPersonName ?? "");
            parameters.Add("@Mobile", value.Mobile ?? "");
            parameters.Add("@MobileAlternate", value.MobileAlternate ?? "");
            parameters.Add("@Phone", value.Phone ?? "");
            parameters.Add("@Email", value.Email);
            parameters.Add("@BusinessId", value.BusinessId);
            parameters.Add("@Requirement", value.Requirement ?? "");
            parameters.Add("@TotalFirm", value.TotalFirm);
            parameters.Add("@CustomerType", $"{(short)value.CustomerType}");
            parameters.Add("@AdharUID", value.AdharUID ?? "");
            parameters.Add("@TotalUsers", value.TotalUsers);
            parameters.Add("@IsActive", value.IsActive);
            parameters.Add("@EmailOtp", value.EmailOtp ?? "");
            parameters.Add("@MobileOtp", value.MobileOtp ?? "");
            parameters.Add("@StatusId", $"{(short)value.StatusId}");
            parameters.Add("@AgreeTerms", value.AgreeTerms);
            //parameters.Add("@DefaultUserId", value.DefaultUserId);

            return QueryHelper.Save("sp_CustomerSave", connectionString, parameters);
        }

        public int Register(Customer value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Name", value.Name);
            parameters.Add("@BusinessName", value.BusinessName);
            parameters.Add("@Address1", value.Address1 ?? "");
            parameters.Add("@Address2", value.Address2 ?? "");
            parameters.Add("@Address3", value.Address3 ?? "");
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@PinCode", value.Pincode);
            parameters.Add("@ContactPersonName", value.ContactPersonName ?? "");
            parameters.Add("@Mobile", value.Mobile ?? "");
            parameters.Add("@MobileAlternate", value.MobileAlternate ?? "");
            parameters.Add("@Phone", value.Phone ?? "");
            parameters.Add("@Email", value.Email);
            parameters.Add("@BusinessId", value.BusinessId);
            parameters.Add("@Requirement", value.Requirement ?? "");
            parameters.Add("@TotalFirm", value.TotalFirm);
            parameters.Add("@CustomerType", $"{(short)value.CustomerType}");
            parameters.Add("@AdharUID", value.AdharUID ?? "");
            parameters.Add("@StatusId", $"{(short)value.StatusId}");
            parameters.Add("@TotalUsers", value.TotalUsers);
            parameters.Add("@AgreeTerms", value.AgreeTerms);
            parameters.Add("@EmailOtp", value.EmailOtp ?? ""    );
            parameters.Add("@MobileOtp", value.MobileOtp ?? "");
            parameters.Add("@IsActive", value.IsActive);
            parameters.Add("@DefaultUserId", value.DefaultUserId);

            return QueryHelper.Save("sp_CustomerRegistration", connectionString, parameters);
        }

        public CustomerViewModel Get(string email, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", email);
            return QueryHelper.Get<CustomerViewModel>("sp_CustomerGetByEmail", connectionString, parameters);
        }

        public CustomerViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerViewModel>("sp_CustomerGet", connectionString, parameters);
        }

        public List<CustomerGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerGridViewModel>("sp_CustomerList", connectionString, param);
        }

        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_CustomerDelete", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerList_Select", connectionString, parameters);
        }
    }
}