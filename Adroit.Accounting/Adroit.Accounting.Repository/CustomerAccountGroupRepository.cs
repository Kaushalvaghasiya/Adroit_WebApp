using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerAccountGroupRepository : ICustomerAccountGroup
    {
        public int Save(CustomerAccountGroup value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@UserId", userId);
            parameters.Add("@Title", value.Title);
            parameters.Add("@Code", value.Code);
            parameters.Add("@TypeId", value.TypeId);
            parameters.Add("@AccountGroupHeaderId", value.AccountGroupHeaderId);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            return QueryHelper.Save("sp_CustomerAccountGroupSave", connectionString, parameters);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_CustomerAccountGroupDelete", connectionString, parameters);
        }
        public CustomerAccountGroupViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<CustomerAccountGroupViewModel>("sp_CustomerAccountGroupGet", connectionString, parameters);
        }
        public List<CustomerAccountGroupGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerAccountGroupGridViewModel>("sp_CustomerAccountGroupList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountGroupList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountGroupList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountGroupList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> CustomerAccountGroupByFirmIdList_Select(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerAccountGroupByFirmIdList_Select", connectionString, parameters);
        }
    }
}
