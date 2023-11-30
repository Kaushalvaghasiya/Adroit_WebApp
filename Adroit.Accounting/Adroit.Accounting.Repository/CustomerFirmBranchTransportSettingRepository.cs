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
            parameters.Add("@BranchId", id);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_CustomerFirmBranchTransportSettingGet", connectionString, parameters);
        }
        public List<CustomerFirmBranchTransportSettingGridViewModel> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
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

            return QueryHelper.Save("sp_CustomerFirmBranchTransportSettingSave", connectionString, parameters);
        }
        public CustomerFirmBranchTransportSettingViewModel GetListWithLabel_Total(string lrNumberId, string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            parameters.Add("@branchId", branchId);
            parameters.Add("@lrNumberId", lrNumberId);
            return QueryHelper.Get<CustomerFirmBranchTransportSettingViewModel>("sp_CustomerFirmBranchTransportSettingForLabel_Total_Select", connectionString, parameters);
        }
    }
}