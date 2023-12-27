using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum ChalanList
    {
        [Description("All")]
        All,
        [Description("Chalan Done")]
        Chalan_Done,
        [Description("Pending Chalan")]
        Pending_Chalan,
    }
}
