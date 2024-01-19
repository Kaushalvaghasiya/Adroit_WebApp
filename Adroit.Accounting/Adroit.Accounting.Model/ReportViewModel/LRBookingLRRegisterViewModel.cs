using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.ReportViewModel
{
    public class LRBookingLRRegisterViewModel : LRBookingViewModel
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> ViewList { get; set; }
        public List<DropdownViewModel> PvtMarkList { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public List<DropdownViewModel> InvStatusList { get; set; }
        public List<DropdownViewModel> ChalanList { get; set; }
        public List<DropdownViewModel> LRStatusList { get; set; }
        public string GroupingColumn { get; set; }
        public int SelectedView { get; set; }
        public string BranchIds { get; set; }
        public int ViewId { get; set; }
        public DateTime? DateFrom { get; set; }
        public DateTime? DateTo { get; set; }
        public int LRFrom { get; set; }
        public int LRTo { get; set; }
        public string CityFromIds { get; set; }
        public string CityToIds { get; set; }
        public string ConsignorIds { get; set; }
        public string ConsigneeIds { get; set; }
        public string BillPartyIds { get; set; }
        public string PvtMarkIds { get; set; }
        public string PayTypeIds { get; set; }
        public int InvStatusId { get; set; }
        public int ChalanId { get; set; }
        public bool SubTotal { get; set; }
        public bool Summary { get; set; }
        public int LRStatusId { get; set; }
    }
}
