//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmBranchViewModel : CustomerFirmBranch
    {
        public List<DropdownViewModel> CountryList { get; set; }
        public List<DropdownViewModel> SoftwarePlanList { get; set; }
        public CustomerFirmViewModel Firm { get; set; }
    }
}