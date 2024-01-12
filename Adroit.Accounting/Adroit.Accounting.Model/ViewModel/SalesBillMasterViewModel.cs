using System.Text.Json.Serialization;

namespace Adroit.Accounting.Model.ViewModel
{
    public class SalesBillMasterViewModel : SalesBillMaster
    {
        public List<DropdownViewModel>? BookBranchList { get; set; }
        public List<DropdownViewModel>? ShippingFromList { get; set; }
        public List<DropdownViewModel>? AccountBranchMappingList { get; set; }
        public List<DropdownViewModel>? InvoiceTypeList { get; set; }
        public List<DropdownViewModel>? BillFromList { get; set; }
        public List<DropdownViewModel>? BrokerBranchMappingList { get; set; }
        public List<DropdownViewModel>? TransportModeList { get; set; }
        public List<DropdownViewModel>? DeliveryPartyList { get; set; }
        public List<DropdownViewModel>? HastePartyList { get; set; }
        public List<DropdownViewModel>? VehicleList { get; set; }
        public List<DropdownViewModel>? LRNumberList { get; set; }
        public CustomerFirmTransportSettingViewModel CustomerFirmTransportSetting { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public string? LRDetailsArray { get; set; }
        public string? City { get; set; }
        public string? GSTNo { get; set; }
        public string? BillPartyName { get; set; }
        public string? SalesBillFromName { get; set; }
        public string? EntryTypeName { get; set; }
        public int LoginId { get; set; }
    }
}
