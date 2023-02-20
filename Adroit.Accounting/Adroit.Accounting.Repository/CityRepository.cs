using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class CityRepository:ICityRepository
    {
        public List<City> GetCityList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@StateId",stateId);
            parameters.Add("@TalukaId", talukaId);
            parameters.Add("@DistrictId", districtId);
            return QueryHelper.GetList<City>("sp_CityList_Select", connectionString, parameters);
        }
    }
}
