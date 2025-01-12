//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    using System;
    public partial class VehicleModel
    {
        public VehicleModel()
        {
        }
        public short Id { get; set; }
        public string Title { get; set; } = string.Empty;
        public short? OrderNumber { get; set; }
        public int AddedById { get; set; }
        public DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public DateTime? ModifiedOn { get; set; }
        public bool Active { get; set; }
    }
}
