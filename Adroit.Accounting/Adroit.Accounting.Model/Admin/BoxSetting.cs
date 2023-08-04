//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model
{
    public partial class BoxSetting
    {
        public int Id { get; set; }
        public byte SoftwareId { get; set; }
        public int? CustomerId { get; set; }
        public int? CusomerFirmId { get; set; }
        public bool Product_ProductName { get; set; }
        public bool Product_ProductName2 { get; set; }
        public bool Product_ProductName3 { get; set; }
        public bool Product_CodeSKU { get; set; }
        public bool Product_Design { get; set; }
        public bool Product_Colour { get; set; }
        public bool Product_Size { get; set; }
        public bool Product_Fabric { get; set; }
        public bool Product_MRP { get; set; }
        public bool Product_DistributorRate { get; set; }
        public bool Product_DealerRate { get; set; }
        public bool Product_AvgPack { get; set; }
        public bool Product_BoxPack { get; set; }
        public bool Product_ProductPacking { get; set; }
        public bool Product_CentralCess { get; set; }
        public bool Product_StateCess { get; set; }
        public bool Product_Group { get; set; }
        public bool Product_SubGroup { get; set; }
        public bool Product_Discount { get; set; }
        public bool Product_FIFORate { get; set; }
        public bool Product_OpStockQty { get; set; }
        public bool Product_PurchaseRate { get; set; }
        public bool Product_CalculationOn { get; set; }
        public bool Product_Cut { get; set; }
        public bool Product_RolMin { get; set; }
        public bool Product_RolMax { get; set; }
        public bool Product_OpStockNos { get; set; }
        public bool Product_LooseQty { get; set; }
        public bool Product_PurchaseRateUpdate { get; set; }
        public bool Product_QualityType { get; set; }
        public bool Product_YarnDenierWt { get; set; }
        public bool Product_RateMeter { get; set; }
        public bool Product_YarnShadeNo { get; set; }
        public bool Account_Taluka { get; set; }
        public bool Account_District { get; set; }
        public bool Account_Country { get; set; }
        public bool Account_Area { get; set; }
        public bool Account_TransporterName { get; set; }
        public bool Account_TransporterGSTNo { get; set; }
        public bool Account_VehicleNumber { get; set; }
        public bool Account_Broker { get; set; }
        public bool Account_DeliveryParty { get; set; }
        public bool Account_HasteParty { get; set; }
        public bool Account_ShippingParty { get; set; }
        public bool GeneralExpenseMulti_Group { get; set; }
        public bool GeneralExpenseMulti_Discount { get; set; }
        public bool GeneralExpenseMulti_OtherCharges { get; set; }
        public bool GeneralExpenseMulti_Group2 { get; set; }
        public bool GeneralExpenseMulti_Discount2 { get; set; }
        public bool GeneralExpenseMulti_OtherCharges2 { get; set; }
        public bool GeneralExpenseMulti_TDS { get; set; }
        public bool GeneralExpenseMulti_SGST { get; set; }
        public bool GeneralExpenseMulti_CGST { get; set; }
        public bool GeneralExpenseMulti_IGST { get; set; }
        public bool GeneralExpenseMulti_StateCess { get; set; }
        public bool GeneralExpenseMulti_CentralCess { get; set; }
        public bool GeneralExpenseMulti_TCS { get; set; }
        public int UserId { get; set; }
        public bool Active { get; set; } = true;
    }
}
