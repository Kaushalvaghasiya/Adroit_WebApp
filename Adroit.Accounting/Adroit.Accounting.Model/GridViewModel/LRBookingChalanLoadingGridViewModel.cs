﻿//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using Adroit.Accounting.Model.ReportViewModel;

namespace Adroit.Accounting.Model.GridViewModel
{
    public class LRBookingChalanLoadingGridViewModel : LRBookingChalanLoadingReportViewModel
    {
        public int RowNum { get; set; }
        public int TotalCount { get; set; }
    }
}