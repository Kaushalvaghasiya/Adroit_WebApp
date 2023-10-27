//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class BookAdmin
    {
        public BookAdmin()
        {

        }
        public int Id { get; set; }
        public int BookAccountId { get; set; }
        public byte BookTypeId { get; set; }
        public string BoxLabel1 { get; set; }
        public string BoxLabel2 { get; set; }
        public string BoxLabel3 { get; set; }
        public string BoxLabel4 { get; set; }
        public string BoxLabel5 { get; set; }
        public string BoxLabel6 { get; set; }
        public string BillNoPrefix { get; set; }
        public string BillNoPostFix { get; set; }
        public bool LRRequired { get; set; }
        public byte? BillTypeID { get; set; }
        public bool IsGeneralPurchase { get; set; }
        public bool IsItemDiscount { get; set; }
        public bool IsItemDiscountSp { get; set; }
        public bool IsCashPayAtBill { get; set; }
        public string ItemDesc1 { get; set; }
        public string ItemDesc2 { get; set; }
        public string ItemDesc3 { get; set; }
        public string ItemDesc4 { get; set; }
        public string ItemDesc5 { get; set; }
        public string ItemDesc6 { get; set; }
        public bool ShowSalesOrderBoxNumber { get; set; }
        public bool ShowPurcahseOrderBoxNumber { get; set; }
        public bool ShowQuotationBoxNumber { get; set; }
        public bool ShowPerformaInvoiceNumber { get; set; }
        public string SalesBillFrom { get; set; }
        public bool IsCalcMultiply { get; set; }
        public string BookShortName { get; set; }
        public string HeaderBox1 { get; set; }
        public string HeaderBox2 { get; set; }
        public string HeaderBox3 { get; set; }
        public string HeaderBox4 { get; set; }
        public string HeaderBox5 { get; set; }
        public bool IsTDSAccount { get; set; }
        public int? TDSAccountId { get; set; }
        public bool IsTCSAccount { get; set; }
        public int? TCSAccountId { get; set; }
        public int SGSTAccountId { get; set; }
        public int CGSTAccountId { get; set; }
        public int IGSTAccountId { get; set; }
        public int? GSTStateCessAccountId { get; set; }
        public int? GSTCentralCessAccountId { get; set; }
        public int? RCMSGSTPayAccountId { get; set; }
        public int? RCMCGSTPayAccountId { get; set; }
        public int? RCMIGSTPayAccountId { get; set; }
        public int? RCMSGSTRecAccountId { get; set; }
        public int? RCMCGSTRecAccountId { get; set; }
        public int? RCMIGSTRecAccountId { get; set; }
        public int RoundOffAccountId { get; set; }
        public bool Active { get; set; }
        public bool Deleted { get; set; }
    }
}
