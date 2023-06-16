//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class SoftwarePlanViewModel : SoftwarePlan
    {
        public List<DropdownViewModel> SoftwareList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> BusinessList { get; set; }
        public List<DropdownViewModel> CodeList { get; set; }
        public string SoftwareName { get; set; }
    }
}