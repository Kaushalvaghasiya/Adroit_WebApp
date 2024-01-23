using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRDeliveryLRRegisterRepository : IReportLRDeliveryLRRegister
    {
        public List<LRDeliveryLRRegisterGridViewModel> GetList(LRDeliveryLRRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@SelectedView", value.SelectedView);
            parameters.Add("@BranchIds", value.BranchIds);
            parameters.Add("@DateFrom", value.DateFrom);
            parameters.Add("@DateTo", value.DateTo);
            parameters.Add("@CityFromIds", value.CityFromIds);
            parameters.Add("@CityToIds", value.CityToIds);
            parameters.Add("@LRFrom", value.LRFrom);
            parameters.Add("@LRTo", value.LRTo);
            parameters.Add("@ConsignorIds", value.ConsignorIds);
            parameters.Add("@ConsigneeIds", value.ConsigneeIds);
            parameters.Add("@BillPartyIds", value.BillPartyIds);
            parameters.Add("@PvtMarkIds", value.PvtMarkIds);
            parameters.Add("@PayTypeIds", value.PayTypeIds);
            parameters.Add("@ChalanIds", value.ChalanIds);
            parameters.Add("@VehicleNumberIds", value.VehicleNumberIds);
            parameters.Add("@LRView", value.LRViewId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@LRStatusId", value.LRStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            parameters.Add("@DateWise", ViewList.DateWise);
            parameters.Add("@PartyWise", ViewList.PartyWise);
            parameters.Add("@LRWise", ViewList.LRWise);
            return QueryHelper.GetList<LRDeliveryLRRegisterGridViewModel>("sp_ReportLRDeliveryLRRegisterList", connectionString, parameters);
        }

        public List<LRDeliveryLRRegisterGridViewModel> GetListWithSummary(LRDeliveryLRRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@SelectedView", value.SelectedView);
            parameters.Add("@BranchIds", value.BranchIds);
            parameters.Add("@DateFrom", value.DateFrom);
            parameters.Add("@DateTo", value.DateTo);
            parameters.Add("@CityFromIds", value.CityFromIds);
            parameters.Add("@CityToIds", value.CityToIds);
            parameters.Add("@LRFrom", value.LRFrom);
            parameters.Add("@LRTo", value.LRTo);
            parameters.Add("@ConsignorIds", value.ConsignorIds);
            parameters.Add("@ConsigneeIds", value.ConsigneeIds);
            parameters.Add("@BillPartyIds", value.BillPartyIds);
            parameters.Add("@PvtMarkIds", value.PvtMarkIds);
            parameters.Add("@PayTypeIds", value.PayTypeIds);
            parameters.Add("@ChalanIds", value.ChalanIds);
            parameters.Add("@VehicleNumberIds", value.VehicleNumberIds);
            parameters.Add("@LRView", value.LRViewId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@LRStatusId", value.LRStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            parameters.Add("@DateWise", ViewList.DateWise);
            parameters.Add("@PartyWise", ViewList.PartyWise);
            parameters.Add("@LRWise", ViewList.LRWise);
            return QueryHelper.GetList<LRDeliveryLRRegisterGridViewModel>("sp_ReportLRDeliveryLRRegisterListWithSummary", connectionString, parameters);
        }
    }
}
