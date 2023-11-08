//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmBranchLRRateViewModel : CustomerFirmBranchLRRate
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> LrRatePerKgList { get; set; }
        public List<DropdownViewModel> LrRatePerParcelList { get; set; }
        public List<DropdownViewModel> CrossingChargePerFreightList { get; set; }
        public List<DropdownViewModel> CrossingChargePerKgList { get; set; }
        public List<DropdownViewModel> CrossingChargePerParcelList { get; set; }
        public List<DropdownViewModel> CommissionPerFreightList { get; set; }
        public List<DropdownViewModel> CommissionPerKgList { get; set; }
        public List<DropdownViewModel> CommissionPerParcelList { get; set; }
        public string AddedOnString { get { return this.AddedOn.ToString("dd/MM/yyyy");} }
        public string Branch { get; set; }
        public string City { get; set; }
    }
}