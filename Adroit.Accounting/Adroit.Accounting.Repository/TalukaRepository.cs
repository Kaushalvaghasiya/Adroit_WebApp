using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TalukaRepository : ITaluka
    {
        public TalukaViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<TalukaViewModel>("sp_TalukaGet", connectionString, parameters);
        }

        public List<TalukaGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<TalukaGridViewModel>("sp_TalukaList", connectionString, param);
        }

        public int Save(Taluka value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@DistrictId", value.DistrictId);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_TalukaSave", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString, int districtId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@DistrictId", districtId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TalukaList_Select", connectionString, parameters);
        }
    }
}
