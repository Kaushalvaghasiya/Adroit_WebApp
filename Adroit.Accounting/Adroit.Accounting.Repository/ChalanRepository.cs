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
        public int Save(PurchaseBillMasterViewModel value, string connectionString, int firmId, int branchId, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LoginId", loginId);
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
            parameters.Add("@LRNumberId", value.LRNumberId);
            parameters.Add("@IsAutoLedger", value.IsAutoLedger);
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
        public List<PurchaseBillMasterGridViewModel> List(string connectionString, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<PurchaseBillMasterGridViewModel>("sp_ChalanList", connectionString, parameters);
        }
        public CustomerFirmBranchTransportSettingViewModel GetChalanLabelList(string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_GetChalanLabelList", connectionString, parameters);
        }
        public CustomerFirmBranchTransportSettingViewModel GetChalanToPayAccountValueList(string lrNumberId, string connectionString, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LRNumberId", lrNumberId);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_GetChalanToPayAccountValue", connectionString, parameters);
        }

    }
}
