using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum ChalanList
    {
        [Description("All")]
        All,
        [Description("Chalan Done")]
        ChalanDone,
        [Description("Pending Chalan")]
        PendingChalan,
    }
}
