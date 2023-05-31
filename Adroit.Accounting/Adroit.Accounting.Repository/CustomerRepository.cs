using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerRepository : ICustomer
    {
        public int Save(Model.Customer customer, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", customer.Id);
            parameters.Add("@Name", customer.Name);
            parameters.Add("@BusinessName", customer.BusinessName);
            parameters.Add("@Address1", customer.Address1 ?? "");
            parameters.Add("@Address2", customer.Address2 ?? "");
            parameters.Add("@Address3", customer.Address3 ?? "");
            parameters.Add("@CityId", customer.CityId);
            parameters.Add("@StateId", customer.StateId);
            parameters.Add("@PinCode", customer.Pincode);
            parameters.Add("@ContactPersonName", customer.ContactPersonName ?? customer.Name);
            parameters.Add("@Mobile", customer.Mobile);
            parameters.Add("@MobileAlternate", customer.MobileAlternate ?? "");
            parameters.Add("@Phone", customer.Phone ?? "");
            parameters.Add("@Email", customer.Email);
            parameters.Add("@BusinessId", customer.BusinessId);
            parameters.Add("@Requirement", customer.Requirement ?? "");
            parameters.Add("@TotalFirm", customer.TotalFirm);
            parameters.Add("@CustomerType", $"{(short)customer.CustomerType}");
            parameters.Add("@IsDeleted", customer.IsDeleted);
            parameters.Add("@AdharUID", customer.AdharUID ?? "");
            parameters.Add("@TotalUsers", customer.TotalUsers);
            parameters.Add("@IsActive", customer.IsActive);
            parameters.Add("@EmailOtp", customer.EmailOtp);
            parameters.Add("@MobileOtp", customer.MobileOtp);
            parameters.Add("@StatusId", $"{(short)customer.StatusId}");
            parameters.Add("@BusinessName", $"{customer.BusinessName}");
            parameters.Add("@AgreeTerms", customer.AgreeTerms);

            return QueryHelper.Save("sp_CustomerSave", connectionString, parameters);
        }

        public int Register(Model.Customer customer, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", customer.Id);
            parameters.Add("@Name", customer.Name);
            parameters.Add("@BusinessName", customer.BusinessName);
            parameters.Add("@Address1", customer.Address1 ?? "");
            parameters.Add("@Address2", customer.Address2 ?? "");
            parameters.Add("@Address3", customer.Address3 ?? "");
            parameters.Add("@CityId", customer.CityId);
            parameters.Add("@StateId", customer.StateId);
            parameters.Add("@EmailOtp", customer.EmailOtp);
            parameters.Add("@MobileOtp", customer.MobileOtp);
            parameters.Add("@ContactPersonName", customer.ContactPersonName ?? customer.Name);
            parameters.Add("@Mobile", customer.Mobile);
            parameters.Add("@MobileAlternate", customer.MobileAlternate ?? "");
            parameters.Add("@Phone", customer.Phone ?? "");
            parameters.Add("@Email", customer.Email);
            parameters.Add("@BusinessId", customer.BusinessId);
            parameters.Add("@Requirement", customer.Requirement ?? "");
            parameters.Add("@TotalFirm", customer.TotalFirm);
            parameters.Add("@CustomerType", $"{(short)customer.CustomerType}");
            parameters.Add("@AdharUID", customer.AdharUID ?? "");
            parameters.Add("@StatusId", $"{(short)customer.StatusId}");
            parameters.Add("@TotalUsers", customer.TotalUsers);
            parameters.Add("@AgreeTerms", customer.AgreeTerms);
            parameters.Add("@DefaultUserId", customer.DefaultUserId);

            return QueryHelper.Save("sp_CustomerRegistration", connectionString, parameters);
        }

        public Model.Customer Get(string email, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", email);
            return QueryHelper.GetTableDetail<Model.Customer>("sp_CustomerGetByEmail", connectionString, parameters);
        }

        public Model.Customer Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<Model.Customer>("sp_CustomerGet", connectionString, parameters);
        }

        public List<Model.Customer> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<Model.Customer>("sp_CustomerList", connectionString, param);
        }

        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_CustomerDelete", connectionString, parameters);
        }

        public List<Customer> GetCustomerList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<Model.Customer>("sp_CustomerList_Select", connectionString, parameters);
        }
    }
}