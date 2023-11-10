using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class LRBookingRangeRepository : ILRBookingRange
    {
        public int Save(LRBookingRange value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@StartNumber", value.StartNumber);
            parameters.Add("@EndNumber", value.EndNumber);
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);

            return QueryHelper.Save("sp_LRBookingRangeSave", connectionString, parameters);
        }
        public LRBookingRangeViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<LRBookingRangeViewModel>("sp_LRBookingRangeGet", connectionString, parameters);
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
            return QueryHelper.GetList<LRBookingRangeGridViewModel>("sp_LRBookingRangeList", connectionString, param);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@DeletedBy", userId);
            QueryHelper.Save("sp_LRBookingRangeDelete", connectionString, parameters);
        }
    }
}
