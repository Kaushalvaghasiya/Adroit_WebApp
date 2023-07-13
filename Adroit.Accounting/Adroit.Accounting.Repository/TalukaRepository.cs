using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TalukaRepository : ITaluka
    {
        public List<DropdownViewModel> SelectList(string connectionString, int districtId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@DistrictId", districtId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TalukaList_Select", connectionString, parameters);
        }
    }
}
