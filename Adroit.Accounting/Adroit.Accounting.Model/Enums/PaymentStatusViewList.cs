using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum PaymentStatusViewList
    {
        [Description("Paid")]
        Paid,
        [Description("Unpaid")]
        Unpaid,
    }
}
