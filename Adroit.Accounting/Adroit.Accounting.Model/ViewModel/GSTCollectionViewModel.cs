//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class GSTCollectionViewModel : GSTCollection
    {
        public int? CityId { get; set; }
        public int? TalukaId { get; set; }
        public int? DistrictId { get; set; }
        public int? StateId { get; set; }
        public short? CountryId { get; set; }

        public string PAN { get { return this.GSTNumber.Substring(2, this.GSTNumber.Length - 5); } }
    }
}