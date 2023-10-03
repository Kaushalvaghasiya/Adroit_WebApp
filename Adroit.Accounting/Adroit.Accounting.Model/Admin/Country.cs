//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Country
    {
        public Country()
        {
        }
        public short Id { get; set; }
        public string Title { get; set; }
        public string PhoneCode { get; set; }
        public bool Active { get; set; }
    }
}
