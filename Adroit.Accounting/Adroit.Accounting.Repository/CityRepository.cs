using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class CityRepository : ICity
    {
        public CityViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CityViewModel>("sp_CityGet", connectionString, parameters);
        }

        public List<CityGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CityGridViewModel>("sp_CityList", connectionString, param);
        }

        public int Save(City value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@TalukaId", value.TalukaId);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_CitySave", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@StateId", stateId);
            parameters.Add("@TalukaId", talukaId);
            parameters.Add("@DistrictId", districtId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CityList_Select", connectionString, parameters);
        }
        public CityViewModel Get(string Cities, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Cities", Cities);
            return QueryHelper.Get<CityViewModel>("sp_GetCitiesByName", connectionString, parameters);
        }
    }
}
