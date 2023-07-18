using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class BusinessRepository : IBusiness
    {
        public int Save(Business value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            parameters.Add("@SoftwareIds", value.SoftwareIds);
            
            return QueryHelper.Save("sp_BusinessSave", connectionString, parameters);
        }
        public BusinessViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<BusinessViewModel>("sp_BusinessGet", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_BusinessDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_BusinessList_Select", connectionString, parameters);
        }
        public List<BusinessGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<BusinessGridViewModel>("sp_BusinessList", connectionString, param);
        }
    }
}
