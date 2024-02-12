//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------
using Adroit.Accounting.Model.Transaction;

namespace Adroit.Accounting.Model.ViewModel
{
    public class ChalanReceiveAgencyDetailViewModel : ChalanReceiveAgencyDetail
    {
        public string LRDateString { get { return this.LRDate.ToString(Adroit.Accounting.Model.Constant.DateFormat); } }
    }
}
