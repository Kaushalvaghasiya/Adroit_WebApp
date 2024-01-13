using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum VoucheBookViewList
    {
        [Description("Cash Payment")]
        CashPayment,
        [Description("Cash Receive")]
        CashReceive,
        [Description("Bank Payment")]
        BankPayment,
        [Description("Bank Receive")]
        BankReceive,
    }
}
