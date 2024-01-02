using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum GSTTransactionTypeList
    {
        [Description("All")]
        All,
        [Description("Intra State")]
        Intra_State,
        [Description("Inter State")]
        Inter_State,
    }
}
