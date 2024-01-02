using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum PurchaseInvoiceType
    {
        [Description("All")]
        All,
        [Description("Tax Invoice")]
        Tax_Invoice,
        [Description("Bill of Supply")]
        Bill_of_Supply,
        [Description("Retail Invoice")]
        Retail_Invoice
    }
}
