//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class SalesBillMaster
    {
        public SalesBillMaster()
        {
        }
        public int Id { get; set; }
        public int AccountBranchMappingId { get; set; }
        public int BookBranchMappingId { get; set; }
        public int BillNumber { get; set; }
        public byte EntryTypeId { get; set; }
        public System.DateTime BillDate { get; set; }
        public int SerialNumberOfBranch { get; set; }
        public string InvoiceMemo { get; set; }
        public string SalesBillFromId { get; set; }
        public System.DateTime ChalanDateFrom { get; set; }
        public System.DateTime ChalanDateTo { get; set; }
        public int ChalanNo { get; set; }
        public string SalesOrderNumber { get; set; }
        public byte? BillTypeID { get; set; }
        public int DeliveryPartyAccountBranchMappingId { get; set; }
        public int ShippingAccountBranchMappingId { get; set; }
        public int HastePartyAccountBranchMappingId { get; set; }
        public int DeliveryLRBookingId { get; set; }
        public string SalesPartyName1 { get; set; }
        public string SalesPartyName2 { get; set; }
        public decimal? CreditDays { get; set; }
        public decimal? TaxableAmount { get; set; }
        public decimal? SGSTTotal { get; set; }
        public decimal? CGSTTotal { get; set; }
        public decimal? IGSTTotal { get; set; }
        public decimal? GSTStateCessTotal { get; set; }
        public decimal? GSTCentralCessTotal { get; set; }
        public decimal? TCSPercentage { get; set; }
        public decimal? TCSAmount { get; set; }
        public decimal? TDSPercentage { get; set; }
        public decimal? TDSAmount { get; set; }
        public decimal? ExtraAmount { get; set; }
        public decimal? RoundOff { get; set; }
        public decimal? BillAmount { get; set; }
        public int? BrokerBranchMappingId { get; set; }
        public string Notes { get; set; }
        public string EwayBillNumber { get; set; }
        public string IRNNumber { get; set; }
        public string AcknowledgementNumber { get; set; }
        public string ReturnBillNumber { get; set; }
        public System.DateTime? ReturnBillDate { get; set; }
        public byte? ReturnReasonId { get; set; }
        public int VehicleNumber { get; set; }
        public string TransportGSTNumber { get; set; }
        public string TransportLRNumber { get; set; }
        public DateTime? TransportLRDate { get; set; }
        public string TransportName { get; set; }
        public byte TransportModeId { get; set; }
        public int? ToStationCityId { get; set; }
        public string HeaderBox1 { get; set; }
        public string HeaderBox2 { get; set; }
        public string HeaderBox3 { get; set; }
        public string HeaderBox4 { get; set; }
        public string HeaderBox5 { get; set; }
        public decimal PaidAmount { get; set; }
        public decimal UnPaidAmount { get; set; }
        public decimal Charge1 { get; set; }
        public decimal Charge12 { get; set; }
        public decimal Charge3 { get; set; }
        public decimal Charge4 { get; set; }
        public decimal Charge5 { get; set; }
        public decimal Charge6 { get; set; }
        public int CreditNoteId { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int AddedById { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public bool Deleted { get; set; }

    }
}
