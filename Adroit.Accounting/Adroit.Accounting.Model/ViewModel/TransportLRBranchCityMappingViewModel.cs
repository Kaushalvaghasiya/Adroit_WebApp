//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class TransportLRBranchCityMappingViewModel : TransportLRBranchCityMapping
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
        public string? CityName { get; set; }
        public string? BranchName { get; set; }
        public string? BranchIds { get; set; }

    }
}
