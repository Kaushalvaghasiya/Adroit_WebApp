//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.GridViewModel
{
    public class LRBookingLRBranchModel : LRBookingReportLRBranchModel
    {
        public int RowNum { get; set; }
        public int TotalCount { get; set; }
    }
}