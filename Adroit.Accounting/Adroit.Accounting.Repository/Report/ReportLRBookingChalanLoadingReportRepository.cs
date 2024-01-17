using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRBookingChalanLoadingReportRepository : IReportLRBookingChalanLoadingReport
    {
        public List<LRBookingChalanLoadingGridViewModel> GetList(LRBookingChalanLoadingReportViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
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
            parameters.Add("@ChalanFrom", value.ChalanFrom);
            parameters.Add("@ChalanTo", value.ChalanTo);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@VehicleOwner", value.VehicleOwner);
            parameters.Add("@Agent", value.Agent);

            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            parameters.Add("@DateWise", ChalanViewList.DateWise);
            parameters.Add("@TruckWise", ChalanViewList.TruckWise);
            return QueryHelper.GetList<LRBookingChalanLoadingGridViewModel>("sp_ReportLRBookingChalanLoadingList", connectionString, parameters);
        }

        public List<LRBookingChalanLoadingGridViewModel> GetListWithSummary(LRBookingChalanLoadingReportViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
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
            parameters.Add("@ChalanFrom", value.ChalanFrom);
            parameters.Add("@ChalanTo", value.ChalanTo);
            parameters.Add("@VehicleNumber", value.VehicleNumber);
            parameters.Add("@VehicleOwner", value.VehicleOwner);
            parameters.Add("@Agent", value.Agent);

            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            parameters.Add("@DateWise", ChalanViewList.DateWise);
            parameters.Add("@TruckWise", ChalanViewList.TruckWise);
            return QueryHelper.GetList<LRBookingChalanLoadingGridViewModel>("sp_ReportLRBookingChalanLoadingListWithSummary", connectionString, parameters);
        }
    }
}
