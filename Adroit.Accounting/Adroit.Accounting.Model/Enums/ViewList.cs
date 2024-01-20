using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum ViewList
    {
        [Description("Date Wise")]
        DateWise,
        [Description("LR Wise")]
        LRWise,
        [Description("Party Wise")]
        PartyWise,
        [Description("To City Wise")]
        ToCityWise,
        [Description("Consignor Wise")]
        ConsignorWise,
        [Description("Consignee Wise")]
        ConsigneeWise,
        [Description("Bill Party Wise")]
        BillPartyWise,
    }
}
