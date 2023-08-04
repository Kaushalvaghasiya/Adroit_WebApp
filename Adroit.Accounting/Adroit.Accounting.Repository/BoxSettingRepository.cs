using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class BoxSettingRepository : IBoxSetting
    {
        public int Save(BoxSetting value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@SoftwareId", value.SoftwareId);
            parameters.Add("@CustomerId", value.CustomerId);
            parameters.Add("@CusomerFirmId", value.CusomerFirmId);

            parameters.Add("@Product_ProductName", value.Product_ProductName);
            parameters.Add("@Product_ProductName2", value.Product_ProductName2);
            parameters.Add("@Product_ProductName3", value.Product_ProductName3);
            parameters.Add("@Product_CodeSKU", value.Product_CodeSKU);
            parameters.Add("@Product_Design", value.Product_Design);
            parameters.Add("@Product_Colour", value.Product_Colour);
            parameters.Add("@Product_Size", value.Product_Size);
            parameters.Add("@Product_Fabric", value.Product_Fabric);
            parameters.Add("@Product_MRP", value.Product_MRP);
            parameters.Add("@Product_DistributorRate", value.Product_DistributorRate);
            parameters.Add("@Product_DealerRate", value.Product_DealerRate);
            parameters.Add("@Product_AvgPack", value.Product_AvgPack);
            parameters.Add("@Product_BoxPack", value.Product_BoxPack);
            parameters.Add("@Product_ProductPacking", value.Product_ProductPacking);
            parameters.Add("@Product_CentralCess", value.Product_CentralCess);
            parameters.Add("@Product_StateCess", value.Product_StateCess);
            parameters.Add("@Product_Group", value.Product_Group);
            parameters.Add("@Product_SubGroup", value.Product_SubGroup);
            parameters.Add("@Product_Discount", value.Product_Discount);
            parameters.Add("@Product_FIFORate", value.Product_FIFORate);
            parameters.Add("@Product_OpStockQty", value.Product_OpStockQty);
            parameters.Add("@Product_PurchaseRate", value.Product_PurchaseRate);
            parameters.Add("@Product_CalculationOn", value.Product_CalculationOn);
            parameters.Add("@Product_Cut", value.Product_Cut);
            parameters.Add("@Product_RolMin", value.Product_RolMin);
            parameters.Add("@Product_RolMax", value.Product_RolMax);
            parameters.Add("@Product_OpStockNos", value.Product_OpStockNos);
            parameters.Add("@Product_LooseQty", value.Product_LooseQty);
            parameters.Add("@Product_PurchaseRateUpdate", value.Product_PurchaseRateUpdate);
            parameters.Add("@Product_QualityType", value.Product_QualityType);
            parameters.Add("@Product_YarnDenierWt", value.Product_YarnDenierWt);
            parameters.Add("@Product_RateMeter", value.Product_RateMeter);
            parameters.Add("@Product_YarnShadeNo", value.Product_YarnShadeNo);
            parameters.Add("@Account_Taluka", value.Account_Taluka);
            parameters.Add("@Account_District", value.Account_District);
            parameters.Add("@Account_Country", value.Account_Country);
            parameters.Add("@Account_Area", value.Account_Area);
            parameters.Add("@Account_TransporterName", value.Account_TransporterName);
            parameters.Add("@Account_TransporterGSTNo", value.Account_TransporterGSTNo);
            parameters.Add("@Account_VehicleNumber", value.Account_VehicleNumber);
            parameters.Add("@Account_Broker", value.Account_Broker);
            parameters.Add("@Account_DeliveryParty", value.Account_DeliveryParty);
            parameters.Add("@Account_HasteParty", value.Account_HasteParty);
            parameters.Add("@Account_ShippingParty", value.Account_ShippingParty);
            parameters.Add("@GeneralExpenseMulti_Group", value.GeneralExpenseMulti_Group);
            parameters.Add("@GeneralExpenseMulti_Discount", value.GeneralExpenseMulti_Discount);
            parameters.Add("@GeneralExpenseMulti_OtherCharges", value.GeneralExpenseMulti_OtherCharges);
            parameters.Add("@GeneralExpenseMulti_Group2", value.GeneralExpenseMulti_Group2);
            parameters.Add("@GeneralExpenseMulti_Discount2", value.GeneralExpenseMulti_Discount2);
            parameters.Add("@GeneralExpenseMulti_OtherCharges2", value.GeneralExpenseMulti_OtherCharges2);
            parameters.Add("@GeneralExpenseMulti_TDS", value.GeneralExpenseMulti_TDS);
            parameters.Add("@GeneralExpenseMulti_SGST", value.GeneralExpenseMulti_SGST);
            parameters.Add("@GeneralExpenseMulti_CGST", value.GeneralExpenseMulti_CGST);
            parameters.Add("@GeneralExpenseMulti_IGST", value.GeneralExpenseMulti_IGST);
            parameters.Add("@GeneralExpenseMulti_StateCess", value.GeneralExpenseMulti_StateCess);
            parameters.Add("@GeneralExpenseMulti_CentralCess", value.GeneralExpenseMulti_CentralCess);
            parameters.Add("@GeneralExpenseMulti_TCS", value.GeneralExpenseMulti_TCS);

            parameters.Add("@UserId", value.UserId);
            parameters.Add("@Active", value.Active);

            return QueryHelper.Save("sp_BoxSettingsSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_BoxuSettingsDelete", connectionString, parameters);
        }
        public BoxSettingViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<BoxSettingViewModel>("sp_BoxSettingsGet", connectionString, parameters);
        }
        public BoxSettingViewModel GetBySoftware(int softwareId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@SoftwareId", softwareId);
            return QueryHelper.Get<BoxSettingViewModel>("sp_BoxSettingsGet_BySoftware", connectionString, parameters);
        }
        public BoxSettingViewModel GetByCustomer(int customerId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CustomerId", customerId);
            return QueryHelper.Get<BoxSettingViewModel>("sp_BoxSettingsGet_ByCustomer", connectionString, parameters);
        }
        public BoxSettingViewModel GetByFirm(int firmId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@CusomerFirmId", firmId);
            return QueryHelper.Get<BoxSettingViewModel>("sp_BoxSettingsGet_ByCustomerFirm", connectionString, parameters);
        }
        public List<BoxSettingGridViewModel> List(string connectionString, int loginId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<BoxSettingGridViewModel>("sp_BoxSettingList", connectionString, param);
        }
    }
}
