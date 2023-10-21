//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class AccountGroupAdminViewModel : AccountGroupAdmin
    {
        public List<DropdownViewModel> AccountGroupTypeList { get; set; }
        public List<DropdownViewModel> AccountGroupHeaderList { get; set; }
        public List<DropdownViewModel> CodeList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}