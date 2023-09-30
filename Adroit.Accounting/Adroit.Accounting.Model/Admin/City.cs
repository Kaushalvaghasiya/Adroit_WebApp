//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class City
    {
        public City()
        {
        }
        public int Id { get; set; }
        public string Title { get; set; }
        public int TalukaId { get; set; }
        public bool Active { get; set; }
        public string TalukaName { get; set; }
        public string DistrictName { get; set; }
        public string StateName { get; set; }
        public string CountryName { get; set; }

    }
}
