//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class SalesBillDetailViewModel : SalesBillDetail
    {
        public int LRNumber { get; set; }
        public DateTime LRDate { get; set; }
        public decimal? ChargeWeight { get; set; }
        public short? Parcel { get; set; }
        public string LRDateString { get { return this.LRDate.ToString(Constant.DateFormat) ?? ""; } }
        public decimal GSTRate { get; set; }
        public decimal GstCentralCessRate { get; set; }
        public decimal GstStateCessRate { get; set; }
    }
}