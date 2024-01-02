using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum VoucheBookViewList
    {
        [Description("Cash Payment")]
        Cash_Payment,
        [Description("Cash Receive")]
        Cash_Receive,
        [Description("Bank Payment")]
        Bank_Payment,
        [Description("Bank Receive")]
        Bank_Receive,
    }
}
