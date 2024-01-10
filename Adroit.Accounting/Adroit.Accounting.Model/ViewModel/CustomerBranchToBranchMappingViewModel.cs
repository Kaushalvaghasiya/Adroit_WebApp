//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerBranchToBranchMappingViewModel : CustomerChalanBranchMapping
    {        
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> SharedBranchList { get; set; }        
        public string? Branch { get; set; }
        public string? SharedBranch { get; set; }
    }
}