using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class SoftwareRepository : ISoftware
    {
        public int Save(Software software, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", software.Id);
            parameters.Add("@Title", software.Title);
            parameters.Add("@OrderNumber", software.OrderNumber);
            parameters.Add("@Active", software.Active);
            return QueryHelper.Save("sp_SoftwareSave", connectionString, parameters);
        }
        public Software Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<Software>("sp_SoftwareGet", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_SoftwareDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_SoftwareList_Select", connectionString, parameters);
        }
        public List<SoftwareGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SoftwareGridViewModel>("sp_SoftwareList", connectionString, param);
        }
    }
}
