//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class GSTInvoiceTypeViewModel : GSTInvoiceType
    {
        public List<DropdownViewModel> TitleList { get; set; }
        public List<DropdownViewModel> TitleB2BList { get; set; }
        public List<DropdownViewModel> TitleEinvoiceList { get; set; }
        public List<DropdownViewModel> TitleCDNURList { get; set; }
        public List<DropdownViewModel> PayTypeList { get; set; }
        public List<DropdownViewModel> OrderNumberList { get; set; }
    }
}