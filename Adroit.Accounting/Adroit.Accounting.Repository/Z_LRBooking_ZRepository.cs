using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class Z_LRBooking_ZRepository : IZ_LRBooking_Z
    {
        public int Save(Z_LRBooking_Z value, int FirmId, int BranchId, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@FirmId", FirmId);
            parameters.Add("@BranchId", BranchId);
            parameters.Add("@loginId", loginId);
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
            return QueryHelper.Save("sp_Z_LRBooking_ZSave", connectionString, parameters);
        }
        public bool Delete(int id, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@loginId", loginId);
            return QueryHelper.Delete("sp_Z_LRBooking_ZDelete", connectionString, parameters);
        }

        public Z_LRBooking_ZViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<Z_LRBooking_ZViewModel>("sp_Z_LRBooking_ZGet", connectionString, parameters);
        }

        public List<Z_LRBooking_ZGridViewModel> List(string connectionString, int BranchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", BranchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<Z_LRBooking_ZGridViewModel>("sp_Z_LRBooking_ZList", connectionString, parameters);
        }

        public (string, int) GetLRBookingRate(int FirmId, int BranchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", FirmId);
            parameters.Add("@BranchId", BranchId);
            parameters.Add("@CityIdTo", cityIdTo); 
            parameters.Add("@BillPartyId", billPartyId);
            parameters.Add("@RateOnId", rateOnId); 
            parameters.Add("@loginId", loginId);
            return QueryHelper.Get<(string,int)>("sp_GetRateFromZ_LRBooking_Z", connectionString, parameters);
        }

        public int? GetLRNumber(int BranchId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", BranchId);
            return QueryHelper.Get<int?>("sp_GetLRNumberFromZ_LRBooking_Z", connectionString, parameters);
        }

    }
}
