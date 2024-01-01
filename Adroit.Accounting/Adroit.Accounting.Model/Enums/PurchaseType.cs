using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum PurchaseType
    {
        [Description("All")]
        All,
        [Description("Purchase")]
        Purchase,
        [Description("Return")]
        Return,
        [Description("Import")]
        Import
    }
}
