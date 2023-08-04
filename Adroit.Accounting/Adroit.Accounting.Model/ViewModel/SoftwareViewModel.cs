//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class SoftwareViewModel: Software
    {
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}