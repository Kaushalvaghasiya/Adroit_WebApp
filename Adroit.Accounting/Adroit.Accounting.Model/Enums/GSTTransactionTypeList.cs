using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum GSTTransactionTypeList
    {
        [Description("All")]
        All,
        [Description("Intra State")]
        IntraState,
        [Description("Inter State")]
        InterState,
    }
}
