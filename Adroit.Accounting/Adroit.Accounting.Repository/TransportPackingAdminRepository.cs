using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TransportPackingAdminRepository : ITransportPackingAdmin
    {
        public int Save(TransportPackingAdmin model, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", model.Id);
            parameters.Add("@Title", model.Title);
            parameters.Add("@OrderNumber", model.OrderNumber);
            parameters.Add("@Active", model.Active);
            return QueryHelper.Save("sp_TransportPackingAdminSave", connectionString, parameters);
        }
        public TransportPackingAdminViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<TransportPackingAdminViewModel>("sp_TransportPackingAdminGet", connectionString, parameters);
        }

        public List<TransportPackingAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<TransportPackingAdminGridViewModel>("sp_TransportPackingAdminList", connectionString, param);
        }

    }
}
