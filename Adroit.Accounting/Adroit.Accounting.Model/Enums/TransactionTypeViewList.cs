using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum TransactionTypeViewList
    {
        [Description("Sales Activity")]
        Sales_Activity,
        [Description("LR Wise")]
        Purchase_Activity,
    }
}
