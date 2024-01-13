using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum BrokerWiseDetailViewList
    {
        [Description("Party Wise")]
        PartyWise,
        [Description("Broker Wise")]
        BrokerWise,
    }
}
