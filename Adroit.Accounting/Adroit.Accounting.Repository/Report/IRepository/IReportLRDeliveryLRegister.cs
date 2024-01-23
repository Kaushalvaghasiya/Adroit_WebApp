using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Model.ReportViewModel;

namespace Adroit.Accounting.Repository
{
    public interface IReportLRDeliveryLRRegister
    {
        public List<LRDeliveryLRRegisterGridViewModel> GetList(LRDeliveryLRRegisterViewModel value, string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<LRDeliveryLRRegisterGridViewModel> GetListWithSummary(LRDeliveryLRRegisterViewModel value, string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}
