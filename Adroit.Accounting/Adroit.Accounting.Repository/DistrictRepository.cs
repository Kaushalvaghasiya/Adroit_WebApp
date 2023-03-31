using Adroit.Accounting.Model;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class DistrictRepository : IDistrict
    {
        public List<Model.District> GetDistrictList(string connectionString, int stateId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@StateId", stateId);
            return QueryHelper.GetList<Model.District>("sp_DistrictList_Select", connectionString, parameters);
        }
    }
}
