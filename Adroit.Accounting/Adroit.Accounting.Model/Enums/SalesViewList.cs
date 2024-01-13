using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum SalesViewList
    {
        [Description("Date Wise")]
        DateWise,
        [Description("Party Wise")]
        PartyWise,
        [Description("Quality Wise")]
        QualityWise,
        [Description("Broker Wise")]
        BrokerWise,
        [Description("Book Wise")]
        BookWise,
        [Description("HSN Wise")]
        HSNWise,
    }
}
