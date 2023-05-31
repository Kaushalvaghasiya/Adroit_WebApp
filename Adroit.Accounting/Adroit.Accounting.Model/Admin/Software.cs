//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Software:BaseModel
    {
        public Software()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public bool IsDeleted { get; set; }
        public byte? OrderNumber { get; set; }
    }
}
