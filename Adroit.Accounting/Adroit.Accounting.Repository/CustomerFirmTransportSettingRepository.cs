using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;
using Newtonsoft.Json.Linq;

namespace Adroit.Accounting.Repository
{
    public class CustomerFirmTransportSettingRepository : ICustomerFirmTransportSetting
    {
        public int Save(CustomerFirmTransportSetting value, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@ReverseChargeLimitForSalesGST", value.ReverseChargeLimitForSalesGST);
            parameters.Add("@ProductIdForSales", value.ProductIdForSales);
            parameters.Add("@LRBookChargeLable1", value.LRBookChargeLable1);
            parameters.Add("@LRBookChargeLable2", value.LRBookChargeLable2);
            parameters.Add("@LRBookChargeLable3", value.LRBookChargeLable3);
            parameters.Add("@LRBookChargeLable4", value.LRBookChargeLable4);
            parameters.Add("@LRBookChargeLable5", value.LRBookChargeLable5);
            parameters.Add("@LRBookChargeLable6", value.LRBookChargeLable6);
            parameters.Add("@DeliveryChargeLable1", value.DeliveryChargeLable1);
            parameters.Add("@DeliveryChargeLable2", value.DeliveryChargeLable2);
            parameters.Add("@DeliveryChargeLable3", value.DeliveryChargeLable3);
            parameters.Add("@DeliveryChargeLable4", value.DeliveryChargeLable4);
            parameters.Add("@DeliveryChargeLable5", value.DeliveryChargeLable5);
            parameters.Add("@DeliveryChargeLable6", value.DeliveryChargeLable6);
            parameters.Add("@IsWeightRoundOff", value.IsWeightRoundOff);
            parameters.Add("@IsPartyAndCityRateFromLastLR", value.IsPartyAndCityRateFromLastLR);
            parameters.Add("@ReverseChargeApplyForURDParty", value.ReverseChargeApplyForURDParty);
            return QueryHelper.Save("sp_CustomerFirmTransportSettingSave", connectionString, parameters);
        }
       
        public CustomerFirmTransportSettingViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<CustomerFirmTransportSettingViewModel>("sp_CustomerFirmTransportSettingGet", connectionString, parameters);
        }

        public List<CustomerFirmTransportSettingGridViewModel> List(string connectionString, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<CustomerFirmTransportSettingGridViewModel>("sp_CustomerFirmTransportSettingList", connectionString, param);
        }

    }
}
