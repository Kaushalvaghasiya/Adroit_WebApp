//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class AccountGroupAdminViewModel : AccountGroupAdmin
    {
        public string AccountGroupHeaderAdminName { get; set; }
        public List<DropdownViewModel> AccountGroupHeaderAdminList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> CodeList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}