using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ChalanRepository : IChalan
    {
        public int Save(PurchaseBillMasterViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@YearId", value.YearId);

            parameters.Add("@Id", value.Id);
            parameters.Add("@BillNumberBranch", value.BillNumberBranch);
            parameters.Add("@BillNumberFirm", value.BillNumberFirm);
            parameters.Add("@BillDate", value.BillDate);
            parameters.Add("@CityIdFrom", value.CityIdFrom);
            parameters.Add("@CityIdTo", value.CityIdTo);
            parameters.Add("@VehicleId", value.VehicleId);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@DriverId", value.DriverId);
            parameters.Add("@EwayBillNumber", value.EwayBillNumber);
            parameters.Add("@ToPayAmount", value.ToPayAmount);
            parameters.Add("@ToPayAccountBranchMappingId", value.ToPayAccountBranchMappingId);
            parameters.Add("@CrossingAmount", value.CrossingAmount);
            parameters.Add("@CrossingCommission", value.CrossingCommission);
            parameters.Add("@CrossingHamali", value.CrossingHamali);
            parameters.Add("@CrossingDeliveryCharge", value.CrossingDeliveryCharge);
            parameters.Add("@CrossingAmountAccountBranchMappingId", value.CrossingAmountAccountBranchMappingId);
            parameters.Add("@CrossingCommissionAccountBranchMappingId", value.CrossingCommissionAccountBranchMappingId);
            parameters.Add("@CrossingHamaliAccountBranchMappingId", value.CrossingHamaliAccountBranchMappingId);
            parameters.Add("@CrossingDeliveryAccountBranchMappingId", value.CrossingDeliveryAccountBranchMappingId);
            parameters.Add("@BrokerAmount", value.BrokerAmount);
            parameters.Add("@BrokerBranchMappingId", value.BrokerBranchMappingId);
            parameters.Add("@Notes", value.Notes);
            parameters.Add("@TaxableAmount", value.TaxableAmount);
            parameters.Add("@TDSAmount", value.TDSAmount);
            parameters.Add("@AdvanceCash", value.AdvanceCash);
            parameters.Add("@AdvanceNeft", value.AdvanceNeft);
            parameters.Add("@ReceiveCash", value.ReceiveCash);
            parameters.Add("@OtherPlus", value.OtherPlus);
            parameters.Add("@OtherLess", value.OtherLess);
            parameters.Add("@LRNumberIds", value.LRNumberIds);
            parameters.Add("@IsAutoLedger", value.IsAutoLedger);
            parameters.Add("@ValidDateFrom", value.ValidDateFrom);
            parameters.Add("@ValidDateTo", value.ValidDateTo);
            parameters.Add("@TDSPercent", value.TDSPercent);
            parameters.Add("@SGSTTotal", value.SGSTTotal);
            parameters.Add("@CGSTTotal", value.CGSTTotal);
            parameters.Add("@IGSTTotal", value.IGSTTotal);
            parameters.Add("@GSTStateCessTotal", value.GSTStateCessTotal);
            parameters.Add("@GSTCentralCessTotal", value.GSTCentralCessTotal);
            parameters.Add("@TCSPercent", value.TCSPercent);
            parameters.Add("@TCSAmount", value.TCSAmount);
            parameters.Add("@CreditDays", value.CreditDays);
            parameters.Add("@RoundOff", value.RoundOff);
            parameters.Add("@BillAmount", value.BillAmount);
            parameters.Add("@SalesAccountBranchMappingId", value.SalesAccountBranchMappingId);
            parameters.Add("@GenaralPurchaseAccountBranchMappingId", value.GenaralPurchaseAccountBranchMappingId);
            parameters.Add("@SkipInGSTR", value.SkipInGSTR);
            parameters.Add("@RCMId", value.RCMId);
            parameters.Add("@RCMBillNumber", value.RCMBillNumber);
            parameters.Add("@BillTypeID", value.BillTypeID);
            parameters.Add("@ReturnBillNumber", value.ReturnBillNumber);
            parameters.Add("@ReturnBillDate", value.ReturnBillDate);
            parameters.Add("@ReturnReasonId", value.ReturnReasonId);
            parameters.Add("@PurchaseOrderRefNo", value.PurchaseOrderRefNo);
            parameters.Add("@EntryTypeName", value.EntryTypeName);
            parameters.Add("@EntryTypeGroupName", value.EntryTypeGroupName);
            
            parameters.Add("@BranchIdTo", value.BranchIdTo);
            return QueryHelper.Save("sp_ChalanSave", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Delete("sp_ChalanDelete", connectionString, parameters);
        }

        public PurchaseBillMasterViewModel Get(int id, string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.Get<PurchaseBillMasterViewModel>("sp_ChalanGet", connectionString, parameters);
        }
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<PurchaseBillMasterGridViewModel>("sp_ChalanList", connectionString, parameters);
        }
        public CustomerFirmBranchTransportSettingViewModel GetChalanToPayAccountValueList(string lrNumberIds, string connectionString, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LRNumberIds", lrNumberIds);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_GetChalanToPayAccountValue", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetListByLRNumberId(string connectionString, int LRNumberId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LRNumberId", LRNumberId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_ChalanLRBookingGetGridDetailsByLRNumber", connectionString, parameters);
        }
        public List<DropdownViewModel> GetCustomerAccountBranchMappingList_Select(int loginId, int firmId, int branchId, int vehicleId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@VehicleId", vehicleId);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ChalanCustomerAccounListWithGroup_Select", connectionString, parameters);
        }

        public List<DropdownViewModel> GetChalanNumberListBySenderId(string connectionString, int loginId, int firmId, int branchId, int senderId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@SenderId", senderId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ChalanReceiveBranchGetChalanList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> GetChalanListByBranchId_Select(string connectionString, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_ChalanListByBranchId_Select", connectionString, parameters);
        }
    }
}
