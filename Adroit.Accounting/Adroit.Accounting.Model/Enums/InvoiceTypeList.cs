using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum InvoiceTypeList
    {
        [Description("All")]
        All,
        [Description("Sales")]
        Sales,
        [Description("Return")]
        Return,
        [Description("Export")]
        Export
    }
}
