using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmRepository : ICustomerFirm
    {
        public void Delete(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            QueryHelper.Save("sp_CustomerFirmDelete", connectionString, parameters);
        }
        public CustomerFirmViewModel Get(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Get<CustomerFirmViewModel>("sp_CustomerFirmGet", connectionString, parameters);
        }
        public List<CustomerFirmGridViewModel> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder, int userId)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@UserId", userId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<CustomerFirmGridViewModel>("sp_CustomerFirmList", connectionString, param);
        }
        public int Save(CustomerFirm value, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BusinessId", value.BusinessId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@OwnerName ", value.OwnerName);
            parameters.Add("@TAN ", value.TAN);
            parameters.Add("@IECCode ", value.IECCode);
            parameters.Add("@IsLutBond ", value.IsLutBond);
            parameters.Add("@LutBondNumber", value.LutBondNumber);
            parameters.Add("@IsGTA ", value.IsGTA);
            parameters.Add("@FirmTypeId ", value.FirmTypeId);
            parameters.Add("@GstFirmTypeId ", value.GstFirmTypeId);
            parameters.Add("@SoftwareId ", value.SoftwareId);
            parameters.Add("@BranchLimit ", value.BranchLimit);
            parameters.Add("@Active", value.Active);
            parameters.Add("@OrderNumber ", value.OrderNumber);
            parameters.Add("@AdharUID", value.AdharUID);
            parameters.Add("@LRResetOnYearEnd", value.LRResetOnYearEnd);
            parameters.Add("@CessRequired", value.CessRequired);

            return QueryHelper.Save("sp_CustomerFirmSave", connectionString, parameters);
        }
        
    }
}