//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class LRBookingViewModel : LRBooking
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
        public string? Consignor { get; set; }
        public string? Consignee { get; set; }
        public string? CityFrom { get; set; }
        public string? CityTo { get; set; }
        public string? Packing { get; set; }
        public string? Description { get; set; }
        public string? LRPayType { get; set; }
        public decimal? Amount { get; set; }
        public decimal? ChargeAmount { get; set; }
        public string? BillPartyName { get; set; }
        public string? VehilcleNo { get; set; }
        public string? BranchChalanNo { get; set; }
        public DateTime? ChalanDate { get; set; }
        public string ChalanDateString { get { return this.ChalanDate?.ToString(Adroit.Accounting.Model.Constant.DateFormat) ?? ""; } }
        public bool? IsLRBookingPurchased { get; set; }
        public short? CreditDays { get; set; }
        public bool? Deleted { get; set; }

        public string? BranchInvoiceNo { get; set; }
        public DateTime? InvoiceDate { get; set; }
        public decimal? gstRate { get; set; }
        public string LRDateString { get { return this.LRDate.ToString(Adroit.Accounting.Model.Constant.DateFormat); }}

        public string BranchName { get; set; }
        public int? TotalLR { get; set; }
        public decimal? ToPayAmount { get; set; }
        public decimal? PaidAmount { get; set; }
        public decimal? TBBAmount { get; set; }
        public string LRMonth { get; set; }
    }
}
