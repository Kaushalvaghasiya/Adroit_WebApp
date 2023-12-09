//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerAccountOpeningBalanceViewModel : CustomerAccountOpeningBalance
    {
        public List<DropdownViewModel> AccountNameList { get; set; } = new();
        public List<DropdownViewModel> AccountGroupList { get; set; } = new();

        public string? AccountName { get; set; }
        public string? AccountGroupName { get; set; }

        public int loginId { get; set; }
    }
}