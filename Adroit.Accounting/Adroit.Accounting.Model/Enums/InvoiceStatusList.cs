using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum InvoiceStatusList
    {
        [Description("All")]
        All,
        [Description("Invoice Done")]
        Invoice_Done,
        [Description("Pending Invoice")]
        Pending_Invoice,
    }
}
