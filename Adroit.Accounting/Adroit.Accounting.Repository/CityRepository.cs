using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class CityRepository:ICityRepository
    {
        public List<City> GetCityList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<City>("sp_CityList_Select", connectionString, parameters);
        }
    }
}
