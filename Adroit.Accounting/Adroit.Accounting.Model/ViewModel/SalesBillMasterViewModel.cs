namespace Adroit.Accounting.Model.ViewModel
{
    public class SalesBillMasterViewModel : SalesBillMaster
    {
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> VehicleList { get; set; }
        //public PurchaseBillMasterViewModel LRBooking { get; set; }
    }
}
