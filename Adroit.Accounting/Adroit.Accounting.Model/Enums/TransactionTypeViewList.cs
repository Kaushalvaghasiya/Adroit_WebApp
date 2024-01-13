using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum TransactionTypeViewList
    {
        [Description("Sales Activity")]
        SalesActivity,
        [Description("LR Wise")]
        PurchaseActivity,
    }
}
