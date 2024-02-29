using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum GSTInvoiceType
    {
        [Description("Regular")]
        Regular = 1,
        [Description("Export With Pay")]
        ExportWithPay = 2,
        [Description("Export Without Pay")]
        Export_Without_Pay = 3,
        [Description("Deemed Export")]
        Deemed_Export = 4,
        [Description("SEZ With Pay")]
        SEZWithPay = 5,
        [Description("SEZ Without Pay")]
        SEZWithoutPay = 6,
        [Description("INTRA")]
        INTRA = 7,
        [Description("Import")]
        Import = 8
    }
}
