//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class CustomerAccountViewModel : CustomerAccount
    {
        public List<DropdownViewModel> NameList { get; set; } = new();
        public List<DropdownViewModel> AccountGroupList { get; set; } = new();
        public List<DropdownViewModel> AreaNameList { get; set; } = new();
        public List<DropdownViewModel> TransportNameList { get; set; } = new();
        public List<DropdownViewModel> AccountBranchMappingList { get; set; } = new();
        public List<DropdownViewModel> BrokerBranchMappingList { get; set; } = new();
        public List<DropdownViewModel> BranchList { get; set; } = new();
        public List<DropdownViewModel> GSTInvoiceTypeList { get; set; } = new();
        public string? AccountGroupName { get; set; }
        public string? AccountGroup { get; set; }
        public string? CityName { get; set; }

        public string? CustomerAccountBranchIds { get; set; } //Comma separated
        public int? LoginId { get; set; } = 0;
        public int? FirmId { get; set; } = 0;
    }
}