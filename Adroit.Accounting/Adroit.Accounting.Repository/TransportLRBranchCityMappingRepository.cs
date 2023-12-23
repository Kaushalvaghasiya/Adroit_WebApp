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
        public int Save(TransportLRBranchCityMapping value, string connectionString, int loginId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@Active", value.Active);
            parameters.Add("@OrderNumber", value.OrderNumber);
            return QueryHelper.Save("sp_TransportLRBranchCityMappingSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString, int loginId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            QueryHelper.Save("sp_TransportLRBranchCityMappingDelete", connectionString, parameters);
        }

        public TransportLRBranchCityMappingViewModel Get(int id, string connectionString, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<TransportLRBranchCityMappingViewModel>("sp_TransportLRBranchCityMappingGet", connectionString, parameters);
        }

        public List<TransportLRBranchCityMappingGridViewModel> List(string connectionString, int loginId, int branchId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@BranchId", branchId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<TransportLRBranchCityMappingGridViewModel>("sp_TransportLRBranchCityMappingList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(string connectionString, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportLRBranchCityMappingList_Select", connectionString, parameters);
        }
    }
}
