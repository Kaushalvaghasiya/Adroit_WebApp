//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class ColorAdmin
    {
        public ColorAdmin()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public int? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
    }
}
