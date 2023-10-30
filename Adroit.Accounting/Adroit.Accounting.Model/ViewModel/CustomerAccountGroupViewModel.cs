//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerAccountGroupViewModel : CustomerAccountGroup
    {
        public string CustomerAccountGroupHeaderName { get; set; }
        public string MainAccountGroupName { get; set; }
        public List<DropdownViewModel> AccountGroupTypeList { get; set; }
        public List<DropdownViewModel> CustomerAccountGroupList { get; set; }
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> CodeList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}