using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ReportViewModel;

namespace Adroit.Accounting.Repository
{
    public interface IReportLRBookingStockRegister
    {
        public List<LRBookingStockRegisterGridViewModel> GetListWithoutSummary(LRBookingStockRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<LRBookingStockRegisterGridViewModel> GetListWithSummary(LRBookingStockRegisterViewModel value, string connectionString, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}
