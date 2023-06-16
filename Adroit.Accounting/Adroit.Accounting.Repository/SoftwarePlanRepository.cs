using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class SoftwarePlanRepository : ISoftwarePlan
    {
        public int Save(SoftwarePlan softwarePlan, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", softwarePlan.Id);
            parameters.Add("@Title", softwarePlan.Title);
            parameters.Add("@SoftwareId", softwarePlan.SoftwareId);
            parameters.Add("@bussiness", softwarePlan.Business);
            parameters.Add("@Code", softwarePlan.Code);
            parameters.Add("@Cost", softwarePlan.Cost);
            parameters.Add("@Active", softwarePlan.Active);
            return QueryHelper.Save("sp_SoftwarePlanSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_SoftwarePlanDelete", connectionString, parameters);
        }
        public SoftwarePlanViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.GetTableDetail<SoftwarePlanViewModel>("sp_SoftwarePlanGet", connectionString, parameters);
        }
        public List<SoftwarePlanGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<SoftwarePlanGridViewModel>("sp_SoftwarePlanList", connectionString, param);
        }
    }
}
