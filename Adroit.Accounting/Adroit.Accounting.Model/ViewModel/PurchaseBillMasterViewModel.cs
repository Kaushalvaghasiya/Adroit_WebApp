//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.GridViewModel;

namespace Adroit.Accounting.Model.ViewModel
{
    public class PurchaseBillMasterViewModel : PurchaseBillMaster
    {
        public List<LRBookingGridViewModel> LRBookingList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> VehicleList { get; set; }
        public List<DropdownViewModel> DriverList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> EwayBillList { get; set; }
        public List<DropdownViewModel> BrokerList { get; set; }
        public List<DropdownViewModel> CustomerFirmBranchList { get; set; }
        public List<DropdownViewModel> BillTypeList { get; set; }
        public List<DropdownViewModel> ItemDescList { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public CustomerBookViewModel CustomerBook { get; set; }
        public string? CityFrom { get; set; }
        public string? CityTo { get; set; }
        public string? VehicleVRN { get; set; }
        public string? LRNumberIds { get; set; }
        public string? BillPartyName { get; set; }
        public string? DriverName { get; set; }
        public decimal? NetAmount { get; set; }
        public string? GSTNo { get; set; }
        public int? LoginId { get; set; }
        public string? EntryTypeName { get; set; }
        public int? TotalLR { get; set; }
        public int? Parcel { get; set; }
        public string? BranchName { get; set; }
        public string LRNumberId { get; set; }
        public string? DetailTableDetails { get; set; }
    }
}
