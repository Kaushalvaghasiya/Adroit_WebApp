using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum LRStatus
    {
        [Description("All")]
        All,
        [Description("Active")]
        Active,
        [Description("Cancelled")]
        Cancelled,
    }
}
