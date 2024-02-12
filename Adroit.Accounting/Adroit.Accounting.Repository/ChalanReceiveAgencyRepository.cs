using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using System.Text.Json;

namespace Adroit.Accounting.Repository
{
    public class ChalanReceiveAgencyRepository : IChalanReceiveAgency
    {
        public int Save(ChalanReceiveAgencyViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@ArrivalDate", value.ArrivalDate);
            parameters.Add("@SenderBranchAccountMappingid", value.SenderBranchAccountMappingid);
            parameters.Add("@GoDownNumber", value.GoDownNumber);
            parameters.Add("@BillNumberBranch", value.BillNumberBranch); 
            parameters.Add("@BillNumberFirm", value.BillNumberFirm); 
            parameters.Add("@FirmChalanNumber", value.FirmChalanNumber); 
            parameters.Add("@FirmChalanDate", value.FirmChalanDate);
            parameters.Add("@CityIdFrom", value.CityIdFrom);
            parameters.Add("@CityIdTo", value.CityIdTo);
            parameters.Add("@VehicleId", value.VehicleId);
            parameters.Add("@BillAccountBranchMappingId", value.BillAccountBranchMappingId);
            parameters.Add("@DriverId", value.DriverId); 
            parameters.Add("@EwayBillNo", value.EwayBillNo);
            parameters.Add("@ToPayAmount", value.ToPayAmount); 
            parameters.Add("@SalesAccountBranchMappingId", value.SalesAccountBranchMappingId); 
            parameters.Add("@ToPayAccountBranchMappingId", value.ToPayAccountBranchMappingId); 
            parameters.Add("@CrossingAmount", value.CrossingAmount); 
            parameters.Add("@CrossingAmountAccountBranchMappingId", value.CrossingAmountAccountBranchMappingId); 
            parameters.Add("@CrossingCommission", value.CrossingCommission); 
            parameters.Add("@CrossingCommissionAccountBranchMappingId", value.CrossingCommissionAccountBranchMappingId); 
            parameters.Add("@CrossingHamali", value.CrossingHamali); 
            parameters.Add("@CrossingHamaliAccountBranchMappingId", value.CrossingHamaliAccountBranchMappingId); 
            parameters.Add("@CrossingDeliveryCharge", value.CrossingDeliveryCharge); 
            parameters.Add("@CrossingDeliveryAccountBranchMappingId", value.CrossingDeliveryAccountBranchMappingId); 
            parameters.Add("@BrokerAmount", value.BrokerAmount); 
            parameters.Add("@BrokerBranchMappingId", value.BrokerBranchMappingId); 
            parameters.Add("@TaxableAmount", value.TaxableAmount); 
            parameters.Add("@TDSPercent", value.TDSPercent); 
            parameters.Add("@TDSAmount", value.TDSAmount); 
            parameters.Add("@AdvanceCash", value.AdvanceCash);  
            parameters.Add("@AdvanceNeft", value.AdvanceNeft); 
            parameters.Add("@OtherLess", value.OtherLess); 
            parameters.Add("@ReceiveCash", value.ReceiveCash); 
            parameters.Add("@OtherPlus", value.OtherPlus); 
            parameters.Add("@NetAmount", value.NetAmount); 
            parameters.Add("@Notes", value.Notes); 
            parameters.Add("@IsAutoLR", value.IsAutoLR); 
            parameters.Add("@ChalanReceiveAgencyDetailTableList", JsonSerializer.Serialize(value.LRDetailsArray));
            parameters.Add("@Deleted", value.Deleted);


            return QueryHelper.Save("sp_ChalanReceiveAgencySave", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Delete("sp_ChalanReceiveAgencyDelete", connectionString, parameters);
        }

        public ChalanReceiveAgencyViewModel Get(int id, string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.Get<ChalanReceiveAgencyViewModel>("sp_ChalanReceiveAgencyGet", connectionString, parameters);
        }
        public List<ChalanReceiveAgencyGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
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
            return QueryHelper.GetList<ChalanReceiveAgencyGridViewModel>("sp_ChalanReceiveAgencyList", connectionString, parameters);
        }
        public List<ChalanReceiveAgencyDetailViewModel> GetDetailListByMasterId(string connectionString, int masterId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@MasterId", masterId);
            return QueryHelper.GetList<ChalanReceiveAgencyDetailViewModel>("sp_ChalanReceiveAgencyGetDetailListByMasterId", connectionString, parameters);
        }

    }
}
