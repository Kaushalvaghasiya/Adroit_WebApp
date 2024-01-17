using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum ChalanViewList
    {
        [Description("Date Wise")]
        DateWise,
        [Description("Truck Wise")]
        TruckWise
    }
}
