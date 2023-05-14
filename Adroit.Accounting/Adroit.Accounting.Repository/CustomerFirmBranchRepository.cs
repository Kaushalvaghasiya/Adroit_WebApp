using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmBranchRepository : ICustomerFirmBranch
    {
        public void Delete(int id, int deletedById, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@@DeletedById", deletedById);
            QueryHelper.Save("sp_CustomerFirmBranchDelete", connectionString, parameters);
        }

        public CustomerFirmBranch Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<Model.CustomerFirmBranch>("sp_CustomerFirmBranchGet", connectionString, parameters);
        }

        public List<CustomerFirmBranch> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<Model.CustomerFirmBranch>("sp_CustomerFirmBranchList", connectionString, param);
        }

        public int Save(CustomerFirmBranch customerFirmBranch, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@Id", customerFirmBranch.Id);
            parameters.Add("@FirmId", $"{(short)customerFirmBranch.FirmId}");
            parameters.Add("@Title", customerFirmBranch.Title);
            parameters.Add("@PrintTitle", customerFirmBranch.PrintTitle);
            parameters.Add("@ShortTitle", customerFirmBranch.ShortTitle);
            parameters.Add("@FirmBranchTypeId", $"{(short)customerFirmBranch.FirmBranchTypeId}");
            parameters.Add("@Address1", customerFirmBranch.Address1);
            parameters.Add("@Address2", customerFirmBranch.Address2);
            parameters.Add("@Address3", customerFirmBranch.Address3);
            parameters.Add("@CityId", customerFirmBranch.CityId == null ? $"{(short)customerFirmBranch.CityId}" : null);
            parameters.Add("@StateId", customerFirmBranch.StateId == null ? $"{(short)customerFirmBranch.StateId}" : null);
            parameters.Add("@CountryId", $"{(short)customerFirmBranch.CountryId}");
            parameters.Add("@PinCode", customerFirmBranch.Pincode ?? "");
            parameters.Add("@Phone", customerFirmBranch.Phone ?? "");
            parameters.Add("@ContactPersonName", customerFirmBranch.ContactPersonName ?? null);
            parameters.Add("@Mobile", customerFirmBranch.Mobile ?? null);
            parameters.Add("@MobileAlternate", customerFirmBranch.MobileAlternate ?? null);
            parameters.Add("@Email", customerFirmBranch.Email ?? null);
            parameters.Add("@GSTNumber", customerFirmBranch.GSTNumber ?? null);
            parameters.Add("@PAN", customerFirmBranch.PAN ?? null);
            parameters.Add("@EWBAddress1", customerFirmBranch.EWBAddress1 ?? null);
            parameters.Add("@EWBAddress2", customerFirmBranch.EWBAddress2 ?? null);
            parameters.Add("@RenewalDate", customerFirmBranch.RenewalDate);
            parameters.Add("@SetupPrice", customerFirmBranch.SetupPrice);
            parameters.Add("@RenewalPrice", customerFirmBranch.RenewalPrice);
            parameters.Add("@OrderNumber", customerFirmBranch.OrderNumber == null ? $"{(short)customerFirmBranch.OrderNumber}" : null);
            parameters.Add("@AddedById", customerFirmBranch.AddedById);
            parameters.Add("@ModifiedById", customerFirmBranch.ModifiedById);
            parameters.Add("@IsActive", customerFirmBranch.IsActive);

            return QueryHelper.Save("sp_CustomerFirmBranchSave", connectionString, parameters);
        }

    }
}