//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class GSTCollection
    {
        public GSTCollection()
        {

        }
        public int Id { get; set; }
        public string GSTNumber { get; set; }
        public string Name { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public string City { get; set; }
        public string Pincode { get; set; }
        public System.DateTime AddedOn { get; set; }
        public bool Active { get; set; }
    }
}
