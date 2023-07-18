using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class GSTCollectionRepository : IGSTCollection
    {
        public int Save(GSTCollection value, string connectionString)
        {
            var parameters = new DynamicParameters();
            
            return QueryHelper.Save("sp_GSTCollectionSave", connectionString, parameters);
        }
        public GSTCollectionViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<GSTCollectionViewModel>("sp_GSTCollectionGet", connectionString, parameters);
        }

        public GSTCollectionViewModel Get(string gstNumber, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@GSTNumber", gstNumber);
            return QueryHelper.Get<GSTCollectionViewModel>("sp_GSTCollectionGetByGSTNumber", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_GSTCollectionDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_GSTCollectionList_Select", connectionString, parameters);
        }
        public List<GSTCollectionGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<GSTCollectionGridViewModel>("sp_GSTCollectionList", connectionString, param);
        }
    }
}
