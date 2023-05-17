//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class CustomerFirmBranch: BaseModel
    {
        public CustomerFirmBranch()
        {
        }
        public int Id { get; set; }
        public int FirmId { get; set; }
        public string CustomerFirm { get; set; }
        public string Title { get; set; }
        public string PrintTitle { get; set; }
        public string ShortTitle { get; set; }
        public int FirmBranchTypeId { get; set; }
        public string FirmBranchTypeAdmin { get; set; }
        public string Address1 { get; set; }
        public string Address2 { get; set; }
        public string Address3 { get; set; }
        public int CityId { get; set; }
        public string City { get; set; }
        public int StateId { get; set; }
        public short CountryId { get; set; }
        public string Pincode { get; set; }
        public string Phone { get; set; }
        public string ContactPersonName { get; set; }
        public string Mobile { get; set; }
        public string MobileAlternate { get; set; }
        public string Email { get; set; }
        public string GSTNumber { get; set; }
        public string PAN { get; set; }
        public string EWBAddress1 { get; set; }
        public string EWBAddress2 { get; set; }
        public System.DateTime CreatedOn { get; set; }
        public System.DateTime RenewalDate { get; set; }
        public decimal SetupPrice { get; set; }
        public decimal RenewalPrice { get; set; }
        public byte? OrderNumber { get; set; }
        public bool IsDeleted { get; set; }
        public int AddedById { get; set; }
        public System.DateTime AddedOn { get; set; }
        public int? DeletedById { get; set; }
        public System.DateTime? DeletedOn { get; set; }
        public int? ModifiedById { get; set; }
        public System.DateTime? ModifiedOn { get; set; }
        public bool IsActive { get; set; }

        public string RenewalDateStr { get; set; }
        public string AddedOnStr { get; set; }
    }
}
