using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TransportLRBranchCityMappingRepository : ITransportLRBranchCityMapping
    {
        public int Save(TransportLRBranchCityMapping value, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_TransportLRBranchCityMappingSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            QueryHelper.Save("sp_TransportLRBranchCityMappingDelete", connectionString, parameters);
        }

        public TransportLRBranchCityMappingViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.Get<TransportLRBranchCityMappingViewModel>("sp_TransportLRBranchCityMappingGet", connectionString, parameters);
        }

        public List<TransportLRBranchCityMappingGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@loginId", loginId);
            param.Add("@firmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<TransportLRBranchCityMappingGridViewModel>("sp_TransportLRBranchCityMappingList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(string connectionString, int branchId, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@branchId", branchId);
            parameters.Add("@loginId", loginId);
            parameters.Add("@firmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportLRBranchCityMappingList_Select", connectionString, parameters);
        }
    }
}
