using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ReportLRBookingChalanMonthlyReportRepository : IReportLRBookingChalanMonthlyReport
    {
        public List<LRBookingChalanMonthlyReportGridViewModel> SelectList(LRBookingChalanMonthlyReportViewModel value, string connectionString, int loginId, int branchId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchIds", value.BranchIds);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingChalanMonthlyReportGridViewModel>("sp_ReportLRBookingChalanMonthlyReportList", connectionString, parameters);
        }
    }
}
