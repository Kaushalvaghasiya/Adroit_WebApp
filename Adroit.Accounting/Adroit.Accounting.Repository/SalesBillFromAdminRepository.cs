using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class SalesBillFromAdminRepository : ISalesBillFromAdmin
    {
        public int Save(SalesBillFromAdmin value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_SalesBillFromAdminSave", connectionString, parameters);
        }
        public void Delete(string id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_SalesBillFromAdminDelete", connectionString, parameters);
        }
        public SalesBillFromAdminViewModel Get(string id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<SalesBillFromAdminViewModel>("sp_SalesBillFromAdminGet", connectionString, parameters);
        }
        public List<SalesBillFromAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SalesBillFromAdminGridViewModel>("sp_SalesBillFromAdminList", connectionString, param);
        }
        public List<DropdownViewModel> SalesBillFromAdminList(string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_SalesBillFromAdminList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SalesBillFromIdsList(string Ids,string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Ids", Ids);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_SalesBillFromIdsList_Select", connectionString, parameters);
        }
    }
}
