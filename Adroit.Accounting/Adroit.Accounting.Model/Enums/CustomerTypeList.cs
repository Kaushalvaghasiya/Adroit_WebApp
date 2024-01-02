using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace Adroit.Accounting.Model.Enums
{
    public enum CustomerTypeList
    {
        [Description("All")]
        All,
        [Description("Regular")]
        Regular,
        [Description("Composition")]
        Composition,
        [Description("Rev. Charge")]
        Rev_Charge,
        [Description("URD")]
        URD
    }
}
