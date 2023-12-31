namespace Adroit.Accounting.SQL.Tables
{
    public sealed class CustomerAccountGroupHeaderTable
    {
        public const string _TableName = "CustomerAccountGroupHeader";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class AccountGroupHeaderAdminTable
    {
        public const string _TableName = "AccountGroupHeaderAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class CustomerAccountGroupTable
    {
        public const string _TableName = "CustomerAccountGroup";
        public const string Code = "Code";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class SoftwareTable
    {
        public const string _TableName = "Software";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class AccountGroupAdminTable
    {
        public const string _TableName = "AccountGroupAdmin";
        public const string Code = "Code";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ColorAdminTable
    {
        public const string _TableName = "ColorAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductAmtCalcOnTable
    {
        public const string _TableName = "ProductAmtCalcOn";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductStockTypeTable
    {
        public const string _TableName = "ProductStockType";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductQualityTypeTable
    {
        public const string _TableName = "ProductQualityType";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductSizeAdminTable
    {
        public const string _TableName = "ProductSizeAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class SoftwarePlanTable
    {
        public const string _TableName = "SoftwarePlan";
        public const string Title = "Title";
        public const string Business = "Business";
        public const string Code = "Code";
        public const string Cost = "Cost";
    }
    public sealed class BusinessTable
    {
        public const string _TableName = "Business";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class CustomerFirmBranchTable
    {
        public const string _TableName = "CustomerFirmBranch";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class BranchTypeAdminTable
    {
        public const string _TableName = "FirmBranchTypeAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class CountryTable
    {
        public const string _TableName = "Country";
        public const string Title = "Title";
        public const string PhoneCode = "PhoneCode";
    }
    public sealed class StateTable
    {
        public const string _TableName = "State";
        public const string Title = "Title";
        public const string TitleGSTR = "TitleGSTR";
        public const string TitleEWay = "TitleEWay";
        public const string Code = "Code";
    }
    public sealed class DistrictTable
    {
        public const string _TableName = "District";
        public const string Title = "Title";
    }
    public sealed class TalukaTable
    {
        public const string _TableName = "Taluka";
        public const string Title = "Title";
    }
    public sealed class CityTable
    {
        public const string _TableName = "City";
        public const string Title = "Title";
    }
    public sealed class TransportDescTable
    {
        public const string _TableName = "TransportDesc";
        public const string Customer = "Customer";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class TransportPackingTable
    {
        public const string _TableName = "TransportPacking";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class BrokerTable
    {
        public const string _TableName = "Broker";
        public const string Name = "Name";
        public const string Brokerage = "Brokerage";
    }

    public sealed class DriverTable
    {
        public const string _TableName = "Driver";
        public const string Customer = "Customer";
        public const string Name = "Name";
    }
    public sealed class CustomerFirmBranchTransportContractRateSettingTable
    {
        public const string _TableName = "CustomerFirmBranchTransportContractRateSetting";
        public const string RatePerKG = "RatePerKG";
        public const string RatePerParcel = "RatePerParcel";
    }

    public sealed class VehicleModelTable
    {
        public const string _TableName = "VehicleModel";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductSizeTable
    {
        public const string _TableName = "ProductSize";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class ProductColorTable
    {
        public const string _TableName = "ProductColor";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class ProductGroupTable
    {
        public const string _TableName = "ProductGroup";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class ProductFabricTable
    {
        public const string _TableName = "ProductFabric";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class ProductSubGroupTable
    {
        public const string _TableName = "ProductSubGroup";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class ProductShadeNumberTable
    {
        public const string _TableName = "ProductShadeNumber";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class ProductDesignNumberTable
    {
        public const string _TableName = "ProductDesignNumber";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class VehicleTable
    {
        public const string _TableName = "Vehilcle";
        public const string VRN = "VRN";
    }
    public sealed class ProductPackingTable
    {
        public const string _TableName = "ProductPacking";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
	public sealed class ProductTable
    {
        public const string _TableName = "Product";
        public const string Title = "Title";
        public const string Code = "Code";
        public const string HSNCode = "HSNCode";
        public const string HSNDesc = "HSNDesc";
        public const string RateRetail = "RateRetail";
        public const string Mrp = "Mrp";
        public const string DistributorRate = "DistributorRate";
        public const string DealerRate = "DealerRate";
        public const string AveragePack = "AveragePack";
        public const string BoxPack = "BoxPack";
        public const string GstCentralCess = "GstCentralCess";
        public const string GstStateCess = "GstStateCess";
        public const string Discount = "Discount";
        public const string Cut = "Cut";
        public const string RolMin = "RolMin";
        public const string RolMax = "RolMax";
        public const string DenierWeight = "DenierWeight";
        public const string RatePerMeter = "RatePerMeter";
    }

    public sealed class LRBookingTable
    {
        public const string _TableName = "[Z-LRBooking-Z]";
        public const string EwayBillNo = "EwayBillNo";
        public const string PrivateMarka = "PrivateMarka";
    }

    public sealed class PurchaseBillMasterTable
    {
        public const string _TableName = "[Z-PurchaseBillMaster-Z]";
        public const string EwayBillNumber = "EwayBillNumber";
    }
    public sealed class ChalanReceiveTable
    {
        public const string _TableName = "[Z-ChalanReceive-Z]";
        public const string GoDownNumber = "GoDownNumber";
    }
    
    public sealed class ChalanReceiveAgencyMasterTable
    {
        public const string _TableName = "[Z-ChalanReceiveAgencyMaster-Z]";
        public const string GoDownNumber = "GoDownNumber";
        public const string EwayBillNumber = "EwayBillNo";
    }

    public sealed class ChalanReceiveAgencyDetailTable
    {
        public const string _TableName = "[Z-ChalanReceiveAgencyDetail-Z]";
        public const string EwayBillNumber = "EwayBillNo";
    }

    #region Adroit - Account
    public sealed class AccountAdminTable
    {
        public const string _TableName = "AccountAdmin";
        public const string AreaName = "AreaName";
        public const string TransportName = "TransportName";
        public const string Name = "Name";
    }
    public sealed class BookTypeAdminTable
    {
        public const string _TableName = "BookTypeAdmin";
        public const string Title = "Title";
    }
    public sealed class SalesBillFromAdminTable
    {
        public const string _TableName = "SalesBillFromAdmin";
        public const string Title = "Title";
    }

    public sealed class CustomerAccountTable
    {
        public const string _TableName = "CustomerAccount";
        public const string AreaName = "AreaName";
        public const string TransportName = "TransportName";
        public const string Name = "Name";
    }
    #endregion

    #region Adroit - GST
    public sealed class GSTRateTable
    {
        public const string _TableName = "GSTRate";
        public const string Rate = "Rate";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class GSTInvoiceTypeTable
    {
        public const string _TableName = "GSTInvoiceType";
        public const string Title = "Title";
        public const string TitleB2B = "TitleB2B";
        public const string TitleEinvoice = "TitleEinvoice";
        public const string TitleCDNUR = "TitleCDNUR";
        public const string PayType = "PayType";
        public const string OrderNumber = "OrderNumber";
    }

    public sealed class GSTPortTable
    {
        public const string _TableName = "GSTPort";
        public const string Title = "Title";
        public const string Code = "Code";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class GSTCollectionTable
    {
        public const string _TableName = "GSTCollection";
        public const string GSTNumber = "GSTNumber";
    }
    #endregion

    #region Adroit - Transport
    public sealed class TransportPackingAdminTable
    {
        public const string _TableName = "TransportPackingAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class TransportDescAdminTable
    {
        public const string _TableName = "TransportDescAdmin";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class TransportLRChargesTable
    {
        public const string _TableName = "TransportLRCharges";
        public const string Title = "Title";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class TransportLRBranchCityMappingTable
    {
        public const string _TableName = "TransportLRBranchCityMapping";
        public const string OrderNumber = "OrderNumber";
    }
    public sealed class CustomerFirmBranchLRRateTable
    {
        public const string _TableName = "CustomerFirmBranchLRRate";
        public const string RatePerKg = "RatePerKg";
        public const string RatePerParcel = "RatePerParcel";
        public const string CrossingChargePercentOnFreight = "CrossingChargePercentOnFreight";
        public const string CrossingChargePerKg = "CrossingChargePerKg";
        public const string CrossingChargePerParcel = "CrossingChargePerParcel";
        public const string CommissionPercentOnFreight = "CommissionPercentOnFreight";
        public const string CommissionPerKg = "CommissionPerKg";
        public const string CommissionPerParcel = "CommissionPerParcel";
    }
    public sealed class LRBookingRangeTable
    {
        public const string _TableName = "LRBookingRange";
        public const string StartNumber = "StartNumber";
        public const string EndNumber = "EndNumber";
    }
    #endregion

}