//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Model.GridViewModel
{
    public class LRBookingGridViewModel : LRBookingViewModel
    {
        public int RowNum { get; set; }
        public int TotalCount { get; set; }
    }
}
