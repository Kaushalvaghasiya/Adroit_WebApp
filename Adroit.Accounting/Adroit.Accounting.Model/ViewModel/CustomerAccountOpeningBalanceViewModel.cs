//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerAccountOpeningBalanceViewModel : CustomerAccountOpeningBalance
    {
        public List<DropdownViewModel> AccountBranchMappingList { get; set; } = new();
        public List<DropdownViewModel> AccountGroupList { get; set; } = new();

        public string? AccountBranchMappingName { get; set; }
        public string? AccountGroupName { get; set; }

        public int loginId { get; set; }
    }
}