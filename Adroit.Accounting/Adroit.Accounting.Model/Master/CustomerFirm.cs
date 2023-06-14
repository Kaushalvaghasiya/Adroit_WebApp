//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirm
    {
        public CustomerFirm()
        {
        }
        public int Id { get; set; }
        public int CustomerId { get; set; }
        public string CustomerName { get; set; }
        public short BusinessId { get; set; }
        public string Title { get; set; }
        public string OwnerName { get; set; }
        public string TAN { get; set; }
        public string IECCode { get; set; }
        public bool IsLutBond { get; set; }
        public string LutBondNumber { get; set; }
        public bool IsGTA { get; set; }
        public short FirmTypeId { get; set; }
        public  string FirmType { get;set; }
        public byte GstFirmTypeId { get; set; }
        public byte SoftwareId { get; set; }
        public short BranchLimit { get; set; }
        public bool IsDeleted { get; set; }
        public bool IsActive { get; set; }
        public byte? OrderNumber { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public string AdharUID { get; set; }
        public bool LRResetOnYearEnd { get; set; }
        public bool CessRequired { get; set; }

    }
}
