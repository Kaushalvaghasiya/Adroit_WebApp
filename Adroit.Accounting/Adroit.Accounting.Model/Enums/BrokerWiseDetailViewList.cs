using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum BrokerWiseDetailViewList
    {
        [Description("Party Wise")]
        Party_Wise,
        [Description("Broker Wise")]
        Broker_Wise,
    }
}
