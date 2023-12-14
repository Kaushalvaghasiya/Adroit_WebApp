using System.Text.Json.Serialization;

namespace Adroit.Accounting.Model.ViewModel
{
    public class SalesBillMasterViewModel : SalesBillMaster
    {
        public List<DropdownViewModel>? AccountBranchMappingList { get; set; }
        public List<DropdownViewModel>? VehicleList { get; set; }
        public List<DropdownViewModel>? LRNumberList { get; set; }
        public CustomerFirmTransportSettingViewModel CustomerFirmTransportSetting { get; set; }
        public string? LRDetailsArray { get; set; }
        public string? City { get; set; }
        public string? GSTNo { get; set; }
        public string? BillPartyName { get; set; }
    }   
}
