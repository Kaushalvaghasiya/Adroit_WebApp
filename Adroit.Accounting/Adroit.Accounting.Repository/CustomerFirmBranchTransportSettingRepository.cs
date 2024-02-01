using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmBranchTransportSettingRepository : ICustomerFirmBranchTransportSetting
    {
        public CustomerFirmBranchTransportSettingViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", 0);
            parameters.Add("@BranchId", id);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_CustomerFirmBranchTransportSettingGet", connectionString, parameters);
        }
        public CustomerFirmBranchTransportSettingViewModel GetByLoginId(int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", 0);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_CustomerFirmBranchTransportSettingGet", connectionString, parameters);
        }
        public List<CustomerFirmBranchTransportSettingGridViewModel> List(string connectionString, int loginId, int branchId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@BranchId", branchId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<CustomerFirmBranchTransportSettingGridViewModel>("sp_CustomerFirmBranchTransportSettingList", connectionString, param);
        }
        public int Save(CustomerFirmBranchTransportSettingViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@PurcahseBookBranchMappingId", value.PurcahseBookBranchMappingId);
            parameters.Add("@BookingSalesBookBranchMappingId", value.BookingSalesBookBranchMappingId);
            parameters.Add("@DeliverySalesBookBranchMappingId", value.DeliverySalesBookBranchMappingId);
            parameters.Add("@ToPayAccountBranchMappingId", value.ToPayAccountBranchMappingId);
            parameters.Add("@CrossingAmountAccountBranchMappingId", value.CrossingAmountAccountBranchMappingId);
            parameters.Add("@CrossingCommissionAccountBranchMappingId", value.CrossingCommissionAccountBranchMappingId);
            parameters.Add("@CrossingHamaliAccountBranchMappingId", value.CrossingHamaliAccountBranchMappingId);
            parameters.Add("@CrossingDeliveryChargeAccountBranchMappingId", value.CrossingDeliveryChargeAccountBranchMappingId);
            parameters.Add("@SalesAccountBranchMappingId", value.SalesAccountBranchMappingId);
            parameters.Add("@IsAutoJvEnableForChallan", value.IsAutoJvEnableForChallan);
            parameters.Add("@IsFreightAddInToBillForDelivery", value.IsFreightAddInToBillForDelivery);
            parameters.Add("@LRRateOnId", value.LRRateOnId);
            parameters.Add("@LRPayTypeId", value.LRPayTypeId);
            parameters.Add("@LRCopy", value.LRCopy);
            parameters.Add("@LRTemplate", value.LRTemplate);
            parameters.Add("@LRSubTitle", value.LRSubTitle);
            parameters.Add("@LRSubject", value.LRSubject);

            return QueryHelper.Save("sp_CustomerFirmBranchTransportSettingSave", connectionString, parameters);
        }
        public int SaveChalanDetailTemplate(CustomerFirmBranchTransportSettingViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@ChalanDetailTemplate", value.ChalanDetailTemplate);

            return QueryHelper.Save("sp_CustomerFirmBranchTransportSettingChalanDetailTemplateUpdate", connectionString, parameters);
        }
        public int SaveChalanSammaryTemplate(CustomerFirmBranchTransportSettingViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@ChalanSummaryTemplate", value.ChalanSummaryTemplate);

            return QueryHelper.Save("sp_CustomerFirmBranchTransportSettingChalanSummaryTemplateUpdate", connectionString, parameters);
        }
    }
}