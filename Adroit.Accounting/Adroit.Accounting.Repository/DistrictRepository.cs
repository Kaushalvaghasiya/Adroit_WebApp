using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class DistrictRepository : IDistrict
    {
        public List<DropdownViewModel> GetDistrictList(string connectionString, int stateId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@StateId", stateId);
            return QueryHelper.GetList<DropdownViewModel>("sp_DistrictList_Select", connectionString, parameters);
        }
    }
}
