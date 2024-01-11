//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerFirmBranchViewModel : CustomerFirmBranch
    {
        public List<DropdownViewModel> SoftwarePlanList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
        public List<DropdownViewModel> BranchTypeList { get; set; }
        public CustomerFirmViewModel Firm { get; set; }
        public List<DropdownViewModel> CustomerBranchList { get; set; }
        public string AddedOnString { get { return this.AddedOn.ToString("dd/MM/yyyy"); } }
        public string RenewalDateString { get { return this.RenewalDate.ToString("dd/MM/yyyy"); } }
        public string SoftwarePlan { get; set; }
        public int? TalukaId { get; set; }
        public int? DistrictId { get; set; }
    }
}