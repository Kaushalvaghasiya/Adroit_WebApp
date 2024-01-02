using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum DateWiseTDSDetailViewList
    {
        [Description("TDS Date Wise")]
        TDS_Date_Wise,
        [Description("TCS Date Wise")]
        TCS_Date_Wise,
        [Description("TDS Party Wise")]
        TDS_Party_Wise,
        [Description("TCS Party Wise")]
        TCS_Party_Wise,
    }
}
