using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum InvoiceStatusList
    {
        [Description("All")]
        All,
        [Description("Invoice Done")]
        Invoice_Done,
        [Description("Pending Invoice")]
        Pending_Invoice,
        [Description("Forward Chalan")]
        Forward_Chalan
    }
    public enum LRViewList
    {
        [Description("All LR")]
        All_LR,
        [Description("Past Year LR")]
        Past_Year_LR,
        [Description("Current Year LR")]
        Current_Year_LR,
    }
    public enum ViewList
    {
        [Description("Date Wise")]
        Date_Wise,
        [Description("LR Wise")]
        LR_Wise,
        [Description("Party Wise")]
        Party_Wise,
    }
    public enum ChalanList
    {
        [Description("All")]
        All,
        [Description("Chalan Done")]
        Chalan_Done,
        [Description("Pending Chalan")]
        Pending_Chalan,
    }
}
