//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class ProductViewModel : Product
    {
        public List<DropdownViewModel> CodeList { get; set; }
        public List<DropdownViewModel> ProductList { get; set; }
        public List<DropdownViewModel> HSNCodeList { get; set; }
        public List<DropdownViewModel> HSNDescList { get; set; }
        public List<DropdownViewModel> RateRetailList { get; set; }
        public List<DropdownViewModel> MrpList { get; set; }
        public List<DropdownViewModel> DistributorRateList { get; set; }
        public List<DropdownViewModel> DealerRateList { get; set; }
        public List<DropdownViewModel> AveragePackList { get; set; }
        public List<DropdownViewModel> BoxPackList { get; set; }
        public List<DropdownViewModel> CentralCessList { get; set; }
        public List<DropdownViewModel> StateCessList { get; set; }
        public List<DropdownViewModel> DiscountList { get; set; }
        public List<DropdownViewModel> CutList { get; set; }
        public List<DropdownViewModel> RolMinList { get; set; }
        public List<DropdownViewModel> RolMaxList { get; set; }
        public List<DropdownViewModel> DenierWeightList { get; set; }
        public List<DropdownViewModel> RatePerMeterList { get; set; }
        public List<DropdownViewModel> ProductDesignNumberList { get; set; }
        public List<DropdownViewModel> ProductColorList { get; set; }
        public List<DropdownViewModel> ProductSizeList { get; set; }
        public List<DropdownViewModel> ProductFabricList { get; set; }
        public List<DropdownViewModel> ProductStockTypeList { get; set; }
        public List<DropdownViewModel> ProductCategoryList { get; set; }
        public List<DropdownViewModel> GSTUQCList { get; set; }
        public List<DropdownViewModel> ProductPackingList { get; set; }
        public List<DropdownViewModel> GSTCalculationList { get; set; }
        public List<DropdownViewModel> ProductSubGroupList { get; set; }
        public List<DropdownViewModel> ProductGroupList { get; set; }
        public List<DropdownViewModel> ProductAmtCalcOnList { get; set; }
        public List<DropdownViewModel> ProductQualityTypeList { get; set; }
        public List<DropdownViewModel> ProductShadeNumberList { get; set; }
        public List<DropdownViewModel> GSTRateList { get; set; }
        public byte SoftwareId { get; set; }
    }
}