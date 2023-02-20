using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class StateRepository : IStateRepository
    {
        public List<State> GetStateList(string connectionString, int countryId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CountryId", countryId);
            return QueryHelper.GetList<State>("sp_StateList_Select", connectionString, parameters);
        }
    }
}
