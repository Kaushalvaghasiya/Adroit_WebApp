using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum InvoiceStatusList
    {
        [Description("All")]
        All,
        [Description("Invoice Done")]
        InvoiceDone,
        [Description("Pending Invoice")]
        PendingInvoice,
    }
}
