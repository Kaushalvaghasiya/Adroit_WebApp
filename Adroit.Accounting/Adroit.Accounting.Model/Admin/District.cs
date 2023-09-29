//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class District
    {
        public District()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public int StateId { get; set; }
        public bool Active { get; set; }
    }
}
