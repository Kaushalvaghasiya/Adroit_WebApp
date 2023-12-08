using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class LRBookingRepository : ILRBooking
    {
        public int Save(LRBooking value, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@CityIdTo", value.CityIdTo);
            parameters.Add("@LRNumber", value.LRNumber);
            parameters.Add("@LRDate", value.LRDate);
            parameters.Add("@EwayBillNo", value.EwayBillNo);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@DeliveryAccountBranchMappingId", value.DeliveryAccountBranchMappingId);
            parameters.Add("@LRPayTypeId", value.LRPayTypeId);
            parameters.Add("@BillAccountBranchMappingId", value.BillAccountBranchMappingId);
            parameters.Add("@Parcel", value.Parcel);
            parameters.Add("@PackingId", value.PackingId);
            parameters.Add("@DescriptionId", value.DescriptionId);
            parameters.Add("@ActualWeight", value.ActualWeight);
            parameters.Add("@ChargeWeight", value.ChargeWeight);
            parameters.Add("@LRRateOnId", value.LRRateOnId);
            parameters.Add("@Rate", value.Rate);
            parameters.Add("@Freight", value.Freight);
            parameters.Add("@InvoiceNo", value.InvoiceNo);
            parameters.Add("@VehicleId", value.VehicleId);
            parameters.Add("@InvoiceValue", value.InvoiceValue);
            parameters.Add("@LRDeliveryId", value.LRDeliveryId);
            parameters.Add("@PrivateMarka", value.PrivateMarka);
            parameters.Add("@LRDeliveryTypeId", value.LRDeliveryTypeId);
            parameters.Add("@Remarks", value.Remarks);
            parameters.Add("@Charges1", value.Charges1);
            parameters.Add("@Charges2", value.Charges2);
            parameters.Add("@Charges3", value.Charges3);
            parameters.Add("@Charges4", value.Charges4);
            parameters.Add("@Charges5", value.Charges5);
            parameters.Add("@Charges6", value.Charges6);
            return QueryHelper.Save("sp_LRBookingSave", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Delete("sp_LRBookingDelete", connectionString, parameters);
        }

        public LRBookingViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<LRBookingViewModel>("sp_LRBookingGet", connectionString, parameters);
        }

        public List<LRBookingGridViewModel> List(string connectionString, int branchId, int loginId , int firmId , string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_LRBookingList", connectionString, parameters);
        }
        
        public GetRateFromLRBookingViewModel GetRate(int firmId, int branchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@CityIdTo", cityIdTo); 
            parameters.Add("@BillPartyId", billPartyId);
            parameters.Add("@RateOnId", rateOnId); 
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Get<GetRateFromLRBookingViewModel>("sp_GetRateFromLRBooking", connectionString, parameters);
        }
        
        public List<LRBookingGridViewModel> GetLRBookingListByCity(string connectionString, int fromCityId, int toCityId, int branchId, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FromCityId", fromCityId);
            parameters.Add("@ToCityId", toCityId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingListByCity", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetListByPurchaseBillMasterId(string connectionString, int PurchaseBillMasterId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@PurchaseBillMasterId", PurchaseBillMasterId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingTableListByPurchaseBillMasterId", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetListByLRNumberId(string connectionString, int LRNumberId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@LRNumberId", LRNumberId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingTableListByLRNumberId", connectionString, parameters);
        }

    }
}
