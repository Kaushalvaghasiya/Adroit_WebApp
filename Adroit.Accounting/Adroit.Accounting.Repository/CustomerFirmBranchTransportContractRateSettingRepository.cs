using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmBranchTransportContractRateSettingRepository : ICustomerFirmBranchTransportContractRateSetting
    {
        public int Save(CustomerFirmBranchTransportContractRateSetting value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@RatePerKG", value.RatePerKG);
            parameters.Add("@RatePerParcel", value.RatePerParcel);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);

            return QueryHelper.Save("sp_CustomerFirmBranchTransportContractRateSettingSave", connectionString, parameters);
        }
        public CustomerFirmBranchTransportContractRateSettingViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerFirmBranchTransportContractRateSettingViewModel>("sp_CustomerFirmBranchTransportContractRateSettingGet", connectionString, parameters);
        }
        public List<CustomerFirmBranchTransportContractRateSettingGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerFirmBranchTransportContractRateSettingGridViewModel>("sp_CustomerFirmBranchTransportContractRateSettingList", connectionString, param);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_BrokerList_Select", connectionString, parameters);
        }
    }
}