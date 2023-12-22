using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class LRBookingRenewRepository : ILRBookingRenew
    {
        public int Save(LRBookingRangeViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@NumberOfLR", value.NumberOfLR);
            parameters.Add("@LoginId", value.LoginId);
            return QueryHelper.Save("sp_LRBookingRenewSave", connectionString, parameters);
        }
        public LRBookingRangeViewModel Get(int id, int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<LRBookingRangeViewModel>("sp_LRBookingRenewGet", connectionString, parameters);
        }
        public List<LRBookingRangeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingRangeGridViewModel>("sp_LRBookingRenewList", connectionString, param);
        }
        public void Delete(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            QueryHelper.Save("sp_LRBookingRenewDelete", connectionString, parameters);
        }
    }
}
