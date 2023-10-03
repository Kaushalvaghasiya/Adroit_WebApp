using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
namespace Adroit.Accounting.Repository
{
    public class StateRepository : IState
    {
        public StateViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<StateViewModel>("sp_StateGet", connectionString, parameters);
        }

        public List<StateGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<StateGridViewModel>("sp_StateList", connectionString, param);
        }

        public int Save(State value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@TitleGSTR", value.TitleGSTR);
            parameters.Add("@TitleEWay", value.TitleEWay);
            parameters.Add("@Code", value.Code);
            parameters.Add("@Country", value.CountryId);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_StateSave", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString, int countryId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CountryId", countryId);
            return QueryHelper.GetList<DropdownViewModel>("sp_StateList_Select", connectionString, parameters);
        }
    }
}
