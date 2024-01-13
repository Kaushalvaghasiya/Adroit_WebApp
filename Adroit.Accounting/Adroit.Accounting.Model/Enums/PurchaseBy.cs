﻿using System.ComponentModel;

namespace Adroit.Accounting.Model.Enums
{
    public enum PurchaseBy
    {
        [Description("All")]
        All,
        [Description("Purchase")]
        Purchase,
        [Description("Gen Exps.")]
        GenExps,
        [Description("Import")]
        Import
    }
}
