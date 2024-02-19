//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.GridViewModel;

namespace Adroit.Accounting.Model.ViewModel
{
    public class PurchaseBillMasterViewModel : PurchaseBillMaster
    {
        public List<DropdownViewModel>? BookBranchList { get; set; }
        public List<DropdownViewModel>? InvoiceTypeList { get; set; }
        public List<DropdownViewModel>? BillFromList { get; set; }
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
        public List<DropdownViewModel> ProductAmtCalcOnList { get; set; }
        public List<DropdownViewModel> VehicleNumberList { get; set; }
        public List<DropdownViewModel> TransportModeList { get; set; }
        public List<DropdownViewModel> TransporterList { get; set; }
        public List<DropdownViewModel> TransGSTList { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public CustomerBookViewModel CustomerBook { get; set; }
        public string? DeliveryBranch { get; set; }
        public string? CityFrom { get; set; }
        public string? CityTo { get; set; }
        public string? VehicleVRN { get; set; }
        public string? LRNumberIds { get; set; }
        public string? BillPartyName { get; set; }
        public string? DriverName { get; set; }
        public string? BrokerName { get; set; }
        public decimal? NetAmount { get; set; }
        public string? GSTNo { get; set; }
        public int? LoginId { get; set; }
        public string? EntryTypeName { get; set; }
        public string? EntryTypeGroupName { get; set; }
        public int? TotalLR { get; set; }
        public int? Parcel { get; set; }
        public string? BranchName { get; set; }
        public string LRNumberId { get; set; }
        public string? DetailTableDetails { get; set; }
        public bool ChalanReceived { get; set; }
        public string? ToPayAccountBranchMappingLbl { get; set; }
        public string? ChasisNumber { get; set; }
        public string? EngineNumber { get; set; }
        public string? NationalPermitNumber { get; set; }
        public string? InsuranceNumber { get; set; }
        public string? LicenceNumber { get; set; }
        public string? DriverMobile { get; set; }
        public string? DriverAddress { get; set; }
        public string? DriverLicence { get; set; }
        public bool Deleted { get; set; }
        public string? ToPayAmountAccountBranchMappingChargerTo { get; set; }
        public string? CrossingAmountAccountBranchMappingChargedTo { get; set; }
        public string? CrossingCommissionAccountBranchMappingChargedTo { get; set; }
        public string? CrossingHamaliAccountBranchMappingChargedTo { get; set; }
        public string? CrossingDeliveryAccountBranchMappingChargedTo { get; set; }
        public string? TransportMode { get; set; }
        public string? FirmEntryVou { get; set; }
        public string? GSTRTwoAReconsilDate { get; set; }
        public string? GSTRThreeBFillingDate { get; set; }
        public string? Remarks { get; set; }
        public decimal? TotalRCMAmt { get; set; }
        public decimal? NonRCMAmt { get; set; }
    }
}
 