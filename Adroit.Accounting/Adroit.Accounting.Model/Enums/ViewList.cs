using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum ViewList
    {
        [Description("Date Wise")]
        Date_Wise,
        [Description("LR Wise")]
        LR_Wise,
        [Description("Party Wise")]
        Party_Wise,
    }
}
