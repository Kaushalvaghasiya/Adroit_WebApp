//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using System.Reflection.Metadata;

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmBranchTransportContractRateSettingViewModel : CustomerFirmBranchTransportContractRateSetting
    {
        public string City { get; set; }
        public string CustomerName { get; set; }
        public string BranchName { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> CustomerList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> RatePerKGList { get; set; }
        public List<DropdownViewModel> RatePerParcelList { get; set; }
    }
}