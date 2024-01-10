//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.Transaction;

namespace Adroit.Accounting.Model.ViewModel
{
    public class ChalanReceiveAgencyViewModel : ChalanReceiveAgencyMaster
    {
        public List<DropdownViewModel> EwayBillAList { get; set; }
        public List<DropdownViewModel> EwayBillBList { get; set; }
        public List<DropdownViewModel> GoDownNumberList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> VehicleList { get; set; }
        public List<DropdownViewModel> DriverList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> BrokerList { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public List<DropdownViewModel> CustomerFirmBranchList { get; set; }
        public CustomerFirmTransportSettingViewModel CustomerFirmTransportSetting { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public List<ChalanReceiveAgencyDetailViewModel>? AgencyDetailList { get; set; }
        public string? ToPayAccountBranchMappingLbl { get; set; }
        public int LoginId { get; set; }
        public string? LRDetailsArray { get; set; }
        public string? CityFrom { get; set; }
        public string? CityTo { get; set; }
        public string? VehicleVRN { get; set; }
        public string? SenderName { get; set; }
        public string? BillPartyName { get; set; }
        public string? ToPayLr { get; set; }
        public string? ToPayLrSum { get; set; }
        public string? PaidLr { get; set; }
        public string? PaidLrSum { get; set; }
        public string? TbbLR { get; set; }
        public string? TbbLRSum { get; set; }
    }
}
