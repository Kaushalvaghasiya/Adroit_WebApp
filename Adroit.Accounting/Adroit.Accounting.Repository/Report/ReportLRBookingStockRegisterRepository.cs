using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRBookingStockRegisterRepository : IReportLRBookingStockRegister
    {
        public List<LRBookingGridViewModel> SelectList(string connectionString, int loginId, string branchId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", string DateFrom = "", string DateTo = "", string CityFromIds = "", string CityToIds = "", string ConsignorIds = "", string ConsigneeIds = "", string BillPartyIds = "", string PayTypeIds = "", string ChalanId = "", string InvStatus = "", bool Summary = false)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchIds", branchId);
            parameters.Add("@DateFrom", DateFrom);
            parameters.Add("@DateTo", DateTo);
            parameters.Add("@CityToIds", CityToIds);
            parameters.Add("@CityFromIds", CityFromIds);
            parameters.Add("@ConsignorIds", ConsignorIds);
            parameters.Add("@ConsigneeIds", ConsigneeIds);
            parameters.Add("@BillPartyIds", BillPartyIds);
            parameters.Add("@PayTypeIds", PayTypeIds);
            parameters.Add("@ChalanId", ChalanId);
            parameters.Add("@InvStatusId", InvStatus);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            parameters.Add("@Summary", Summary);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_ReportLRBookingStockRegisterList", connectionString, parameters);
        }
    }
}
