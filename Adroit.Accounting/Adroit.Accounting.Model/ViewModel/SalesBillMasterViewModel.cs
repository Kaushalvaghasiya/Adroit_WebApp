namespace Adroit.Accounting.Model.ViewModel
{
    public class SalesBillMasterViewModel : SalesBillMaster
    {
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> VehicleList { get; set; }
        public List<DropdownViewModel> LRNumberList { get; set; }
        //public LRBookingViewModel LRBooking { get; set; }
    }
}
