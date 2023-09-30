//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class Taluka
    {
        public Taluka()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public int DistrictId { get; set; }
        public bool Active { get; set; }
        public string DistrictName { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }

    }
}
