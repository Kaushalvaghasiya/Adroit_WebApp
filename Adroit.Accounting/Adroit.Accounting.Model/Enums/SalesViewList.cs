using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum SalesViewList
    {
        [Description("Date Wise")]
        Date_Wise,
        [Description("Party Wise")]
        Party_Wise,
        [Description("Quality Wise")]
        Quality_Wise,
        [Description("Broker Wise")]
        Broker_Wise,
        [Description("Book Wise")]
        Book_Wise,
        [Description("HSN Wise")]
        HSN_Wise,
    }
}
