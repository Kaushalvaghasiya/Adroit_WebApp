//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class State
    {
        public State()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public string TitleGSTR { get; set; } = string.Empty;
        public string TitleEWay { get; set; } = string.Empty;
        public string Code { get; set; } = string.Empty;
        public short CountryId { get; set; }
        public bool Active { get; set; }
    }
}
