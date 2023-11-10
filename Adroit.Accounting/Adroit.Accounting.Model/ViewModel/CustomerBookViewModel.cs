//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerBookViewModel : CustomerBook
    {
        public List<DropdownViewModel> CustomerAccountList { get; set; }
        public List<DropdownViewModel> BookTypeList { get; set; }
        public List<DropdownViewModel> BillTypeList { get; set; }
        public List<DropdownViewModel> BillFromList { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public string BookName { get; set; }
        public string BookType { get; set; }
        public CustomerViewModel Customer { get; set; }

    }
}