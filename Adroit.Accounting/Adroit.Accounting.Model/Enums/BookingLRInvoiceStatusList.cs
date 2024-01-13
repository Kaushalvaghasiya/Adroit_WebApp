using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum BookingLRInvoiceStatusList
    {
        [Description("All")]
        All,
        [Description("Invoice Done")]
        InvoiceDone,
        [Description("Pending Invoice")]
        PendingInvoice,
    }
}
