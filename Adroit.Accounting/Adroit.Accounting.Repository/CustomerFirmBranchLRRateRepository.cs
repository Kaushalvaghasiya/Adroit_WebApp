using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmBranchLRRateRepository : ICustomerFirmBranchLRRate
    {
        public CustomerFirmBranchLRRateViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerFirmBranchLRRateViewModel>("sp_CustomerFirmBranchLRRateGet", connectionString, parameters);
        }
        public List<CustomerFirmBranchLRRateGridViewModel> List(string connectionString, int loginId, int firmId, string search, int pageStart, int pageSize, int sortColumn, string sortOrder)
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);

            return QueryHelper.GetList<CustomerFirmBranchLRRateGridViewModel>("sp_CustomerFirmBranchLRRateList", connectionString, param);
        }
        public int Save(CustomerFirmBranchLRRate value, string connectionString)
        {
            var parameters = new DynamicParameters();

            parameters.Add("@Id", value.Id);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@RatePerKg", value.RatePerKg);
            parameters.Add("@RatePerParcel", value.RatePerParcel);
            parameters.Add("@IsCrossingChargeApply", value.IsCrossingChargeApply);
            parameters.Add("@CrossingChargePercentOnFreight", value.CrossingChargePercentOnFreight);
            parameters.Add("@CrossingChargePerKg", value.CrossingChargePerKg);
            parameters.Add("@CrossingChargePerParcel", value.CrossingChargePerParcel);
            parameters.Add("@IsCommissionApply", value.IsCommissionApply);
            parameters.Add("@CommissionPercentOnFreight", value.CommissionPercentOnFreight);
            parameters.Add("@CommissionPerKg", value.CommissionPerKg);
            parameters.Add("@CommissionPerParcel", value.CommissionPerParcel);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            

            return QueryHelper.Save("sp_CustomerFirmBranchLRRateSave", connectionString, parameters);
        }
    }
}