//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTInvoiceType
    {
        public GSTInvoiceType()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public string TitleB2B { get; set; }
        public string TitleEinvoice { get; set; }
        public string TitleCDNUR { get; set; }
        public string PayType { get; set; }
        public byte? OrderNumber { get; set; }
        public bool Active { get; set; }
    }
}
