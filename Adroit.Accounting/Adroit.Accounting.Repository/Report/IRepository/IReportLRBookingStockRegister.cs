using Adroit.Accounting.Model.GridViewModel;

namespace Adroit.Accounting.Repository
{
    public interface IReportLRBookingStockRegister
    {
        public List<LRBookingGridViewModel> SelectList(string connectionString, int loginId, string branchId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", string DateFrom = "", string DateTo = "", string CityFromIds = "", string CityToIds = "", string ConsignorIds = "", string ConsigneeIds = "", string BillPartyIds = "", string PayTypeIds = "", string ChalanId = "", string InvStatus = "", bool Summary = false);
    }
}
