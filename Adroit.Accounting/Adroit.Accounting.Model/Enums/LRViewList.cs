using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum LRViewList
    {
        [Description("All LR")]
        AllLR,
        [Description("Past Year LR")]
        PastYearLR,
        [Description("Current Year LR")]
        CurrentYearLR,
    }
}
