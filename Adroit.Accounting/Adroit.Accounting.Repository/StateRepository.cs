using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class StateRepository : IState
    {
        public List<DropdownViewModel> SelectList(string connectionString, int countryId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CountryId", countryId);
            return QueryHelper.GetList<DropdownViewModel>("sp_StateList_Select", connectionString, parameters);
        }
    }
}
