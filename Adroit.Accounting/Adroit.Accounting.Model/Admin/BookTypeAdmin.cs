//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class BookTypeAdmin
    {
        public BookTypeAdmin()
        {
        }
        public byte Id { get; set; }
        public string Title { get; set; }
        public bool IsDeleted { get; set; }
    }
}
