using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum PurchaseInvoiceType
    {
        [Description("All")]
        All,
        [Description("Tax Invoice")]
        TaxInvoice,
        [Description("Bill of Supply")]
        BillOfSupply,
        [Description("Retail Invoice")]
        RetailInvoice
    }
}
