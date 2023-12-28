using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum LRViewList
    {
        [Description("All LR")]
        All_LR,
        [Description("Past Year LR")]
        Past_Year_LR,
        [Description("Current Year LR")]
        Current_Year_LR,
    }
}
