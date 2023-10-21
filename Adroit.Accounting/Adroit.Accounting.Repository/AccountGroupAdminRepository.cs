using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AccountGroupAdminRepository : IAccountGroupAdmin
    {
        public int Save(AccountGroupAdmin value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            //parameters.Add("@SoftwareId", value.SoftwareId);
            //parameters.Add("@bussiness", value.Business);
            //parameters.Add("@Code", value.Code);
            //parameters.Add("@Cost", value.Cost);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_AccountGroupAdminSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_AccountGroupAdminDelete", connectionString, parameters);
        }
        public AccountGroupAdminViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<AccountGroupAdminViewModel>("sp_AccountGroupAdminGet", connectionString, parameters);
        }
        public List<AccountGroupAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<AccountGroupAdminGridViewModel>("sp_AccountGroupAdminList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(byte softwareId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@softwareId", softwareId);
            return QueryHelper.GetList<DropdownViewModel>("sp_AccountGroupAdminList_Select", connectionString, parameters);
        }
    }
}
