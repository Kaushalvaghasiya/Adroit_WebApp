using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRBookingLRRegisterRepository : IReportLRBookingLRRegister
    {
        public List<LRBookingLRRegisterGridViewModel> GetList(LRBookingLRRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
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
            parameters.Add("@ChalanId", value.ChalanId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingLRRegisterGridViewModel>("sp_ReportLRBookingLRRegisterList", connectionString, parameters);
        }

        public List<LRBookingLRRegisterGridViewModel> GetListWithSummary(LRBookingLRRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
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
            parameters.Add("@ChalanId", value.ChalanId);
            parameters.Add("@InvStatusId", value.InvStatusId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingLRRegisterGridViewModel>("sp_ReportLRBookingLRRegisterListWithSummary", connectionString, parameters);
        }
    }
}
