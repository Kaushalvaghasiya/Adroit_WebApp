//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class BookAdminViewModel : BookAdmin
    {
        public List<DropdownViewModel> BookAccountList { get; set; }
        public List<DropdownViewModel> BookTypeList { get; set; }
        public List<DropdownViewModel> BillTypeList { get; set; }
        public List<DropdownViewModel> BillFromList { get; set; }
        public string BookName { get; set; }
        public string BookType { get; set; }
    }
}