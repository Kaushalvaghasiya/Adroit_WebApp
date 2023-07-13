using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class CityRepository : ICity
    {
        public List<DropdownViewModel> SelectList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@StateId", stateId);
            parameters.Add("@TalukaId", talukaId);
            parameters.Add("@DistrictId", districtId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CityList_Select", connectionString, parameters);
        }
    }
}
