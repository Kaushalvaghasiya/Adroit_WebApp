//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
namespace Adroit.Accounting.Model.ViewModel
{
    public class GetRateFromLRBookingViewModel : LRBooking
    {
        public decimal Rate { get; set; }
        public bool IsRateDisable { get; set; }
    }
}
