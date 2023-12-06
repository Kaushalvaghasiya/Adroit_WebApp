using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using Newtonsoft.Json.Linq;

namespace Adroit.Accounting.Repository
{
    public class TransportPackingRepository : ITransportPacking
    {
        public int Save(TransportPacking value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Title", value.Title);
            parameters.Add("@UserId", userId);
            parameters.Add("@OrderNumber", value.OrderNumber);
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            return QueryHelper.Save("sp_TransportPackingSave", connectionString, parameters);
        }
        public TransportPackingViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<TransportPackingViewModel>("sp_TransportPackingGet", connectionString, parameters);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_TransportPackingDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportPackingList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(short businessId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BusinessId", businessId);
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportPackingList_Select", connectionString, parameters);
        }

        public List<TransportPackingGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<TransportPackingGridViewModel>("sp_TransportPackingList", connectionString, param);
        }
    }
}
