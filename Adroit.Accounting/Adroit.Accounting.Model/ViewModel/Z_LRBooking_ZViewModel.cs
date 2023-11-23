//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class Z_LRBooking_ZViewModel : Z_LRBooking_Z
    {
        public List<DropdownViewModel> EwayBillList { get; set; }
        public List<DropdownViewModel> CityList { get; set; }
        public List<DropdownViewModel> DescriptionList { get; set; }
        public List<DropdownViewModel> PackingList { get; set; }
        public List<DropdownViewModel> LRRateOnList { get; set; }
        public List<DropdownViewModel> AccountBranchMappingList { get; set; }
        public List<DropdownViewModel> PaymentList { get; set; }
        public List<DropdownViewModel> LRDeliveryList { get; set; }
        public List<DropdownViewModel> LRDeliveryTypeList { get; set; }
        public List<DropdownViewModel> VehicleList { get; set; }
        public CustomerFirmTransportSettingViewModel CustomerFirmTransportSetting { get; set; }
        public CustomerFirmBranchTransportSettingViewModel CustomerFirmBranchTransportSetting { get; set; }
        public string Consignor { get; set; }
        public string Consignee { get; set; }
        public string CityFrom { get; set; }
        public string CityTo { get; set; }
    }
}
