//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class LRBookingRangeViewModel : LRBookingRange
    {
        public string Branch { get; set; }
        public int? LoginId { get; set; }
        public bool? IsUsedInLRBooking { get; set; }
        public List<DropdownViewModel> BranchList { get; set; }
        public List<DropdownViewModel> StartNumberList { get; set; }
        public List<DropdownViewModel> EndNumberList { get; set; }
    }
}