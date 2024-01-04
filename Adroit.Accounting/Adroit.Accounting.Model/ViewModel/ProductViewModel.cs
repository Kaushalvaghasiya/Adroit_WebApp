//-----------------------------------------------------------------------
//    Copyright (c) Adroit IBS Pvt Ltd. All rights reserved.
//-----------------------------------------------------------------------

namespace Adroit.Accounting.Model.ViewModel
{
    public class ProductViewModel : Product
    {
        public List<DropdownViewModel> CodeList { get; set; } = new();
        public List<DropdownViewModel> ProductList { get; set; } = new();       
        public List<DropdownViewModel> HSNCodeList { get; set; } = new();
        public List<DropdownViewModel> HSNDescList { get; set; } = new();
        public List<DropdownViewModel> RateRetailList { get; set; } = new();
        public List<DropdownViewModel> MrpList { get; set; } = new();
        public List<DropdownViewModel> DistributorRateList { get; set; } = new();
        public List<DropdownViewModel> DealerRateList { get; set; } = new();
        public List<DropdownViewModel> AveragePackList { get; set; } = new();
        public List<DropdownViewModel> BoxPackList { get; set; } = new();
        public List<DropdownViewModel> CentralCessList { get; set; } = new();
        public List<DropdownViewModel> StateCessList { get; set; } = new();
        public List<DropdownViewModel> DiscountList { get; set; } = new();
        public List<DropdownViewModel> CutList { get; set; } = new();
        public List<DropdownViewModel> RolMinList { get; set; } = new();
        public List<DropdownViewModel> RolMaxList { get; set; } = new();
        public List<DropdownViewModel> DenierWeightList { get; set; } = new();
        public List<DropdownViewModel> RatePerMeterList { get; set; } = new();
        public List<DropdownViewModel> ProductDesignNumberList { get; set; } = new();
        public List<DropdownViewModel> ProductColorList { get; set; } = new();
        public List<DropdownViewModel> ProductSizeList { get; set; } = new();
        public List<DropdownViewModel> ProductFabricList { get; set; } = new();
        public List<DropdownViewModel> ProductStockTypeList { get; set; } = new();
        public List<DropdownViewModel> ProductCategoryList { get; set; } = new();
        public List<DropdownViewModel> GSTUQCList { get; set; } = new();
        public List<DropdownViewModel> ProductPackingList { get; set; } = new();
        public List<DropdownViewModel> GSTCalculationList { get; set; } = new();
        public List<DropdownViewModel> ProductSubGroupList { get; set; } = new();
        public List<DropdownViewModel> ProductGroupList { get; set; } = new();
        public List<DropdownViewModel> ProductAmtCalcOnList { get; set; } = new();
        public List<DropdownViewModel> ProductQualityTypeList { get; set; } = new();
        public List<DropdownViewModel> ProductShadeNumberList { get; set; } = new();
        public List<DropdownViewModel> GSTRateList { get; set; } = new();
        public List<DropdownViewModel> BranchList { get; set; } = new();

        //Only Temp Values For Saving & Listing
        public string CustomerName { get; set; }
        public string ProductDesignNumber { get; set; }
        public string ColorName { get; set; }
        public string SizeName { get; set; }
        public string PackingName { get; set; }
        public string ShadeNumber { get; set; }
        public string FabricName { get; set; }
        public string GroupName { get; set; }
        public string SubGroupName { get; set; }
        public string StockTypeName { get; set; }
        public string QualityTypeName { get; set; }
        public string UQCTypeName { get; set; }
        public string CategoryName { get; set; }
        public string GSTCalculationName { get; set; }
        public string GSTRateName { get; set; }
        public string AmtCalcName { get; set; }
        public byte softwareId { get; set; }
        public int loginId { get; set; }
        public int firmId { get; set; }
        public CustomerViewModel Customer { get; set; }
        public int ProductBranchMappingId { get; set; }
    }
}