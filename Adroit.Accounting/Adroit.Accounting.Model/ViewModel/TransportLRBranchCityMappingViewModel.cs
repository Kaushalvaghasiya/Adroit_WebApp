//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class TransportLRBranchCityMappingViewModel : TransportLRBranchCityMapping
    {
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
        
    }
}
