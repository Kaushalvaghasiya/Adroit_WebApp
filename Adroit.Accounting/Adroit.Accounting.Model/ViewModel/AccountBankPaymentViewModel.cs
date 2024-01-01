//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class AccountBankPaymentViewModel 
    {
        public List<DropdownViewModel> CustomerBookList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
    }
}