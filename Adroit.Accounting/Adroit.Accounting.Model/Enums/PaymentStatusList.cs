using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum PaymentStatusList
    {
        [Description("All")]
        All,
        [Description("Paid")]
        Paid,
        [Description("Unpaid")]
        Unpaid
    }
}
