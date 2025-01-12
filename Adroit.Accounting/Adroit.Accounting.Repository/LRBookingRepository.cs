﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class LRBookingRepository : ILRBooking
    {
        public int Save(LRBookingViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@YearId", value.YearId);

            parameters.Add("@Id", value.Id);
            parameters.Add("@CityIdTo", value.CityIdTo);
            parameters.Add("@CityIdFrom", value.CityIdFrom);
            parameters.Add("@LRNumber", value.LRNumber);
            parameters.Add("@LRDate", value.LRDate);
            parameters.Add("@EwayBillNo", value.EwayBillNo);
            parameters.Add("@AccountBranchMappingId", value.AccountBranchMappingId);
            parameters.Add("@DeliveryAccountBranchMappingId", value.DeliveryAccountBranchMappingId);
            parameters.Add("@LRPayTypeId", value.LRPayTypeId);
            parameters.Add("@BillAccountBranchMappingId", value.BillAccountBranchMappingId);
            parameters.Add("@Parcel", value.Parcel);
            parameters.Add("@Packing", value.Packing);
            parameters.Add("@Description", value.Description);
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
            parameters.Add("@NetAmount", value.NetAmount);

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

        public LRBookingViewModel Get(int id, string connectionString, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            return QueryHelper.Get<LRBookingViewModel>("sp_LRBookingGet", connectionString, parameters);
        }

        public List<LRBookingGridViewModel> List(string connectionString, int loginId, int branchId , int firmId , string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
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
        
        public List<LRBookingGridViewModel> GetLRBookingListByCity(string connectionString, string fromCityIds, string toCityIds, int branchId, int loginId, int firmId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FromCityIds", fromCityIds);
            parameters.Add("@ToCityIds", toCityIds);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingListByCity", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetListByPurchaseBillMasterId(string connectionString, int purchaseBillMasterId, int loginId, int branchId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@PurchaseBillMasterId", purchaseBillMasterId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_ChalanGetLRBookingTableListByPurchaseBillMasterId", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetLRBookingListByDate(string connectionString, string fromDate, string toDate, string PayTypeId, string AccountBranchMappingId, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@FromDate", fromDate);
            parameters.Add("@ToDate", toDate);
            parameters.Add("@PayTypeId", PayTypeId);
            parameters.Add("@AccountBranchMappingId", AccountBranchMappingId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingListByDate", connectionString, parameters);
        }
        public List<LRBookingGridViewModel> GetLRBookingListByDateForDeliveryInvoice(string connectionString, string fromDate, string toDate, string PayTypeId, string AccountBranchMappingId, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@FromDate", fromDate);
            parameters.Add("@ToDate", toDate);
            parameters.Add("@PayTypeId", PayTypeId);
            parameters.Add("@AccountBranchMappingId", AccountBranchMappingId);
            return QueryHelper.GetList<LRBookingGridViewModel>("sp_GetLRBookingListByDateForDeliveryInvoice", connectionString, parameters);
        }
        public List<DropdownViewModel> GetLRNumberListByLRPayTypeId(string connectionString, int loginId, int firmId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_InvoiceGetLRBookingList_Select", connectionString, parameters);
        }
        public LRBookingViewModel GetGSTRate(int firmId, int branchId, int productId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@ProductId", productId);
            return QueryHelper.Get<LRBookingViewModel>("sp_GetGSTRateByProductId", connectionString, parameters);
        }

        public List<DropdownViewModel> GetLRNumberListForDeliveryInvoice(string connectionString, int loginId, int firmId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_InvoiceGetLRBookingListForDeliveryInvoice_Select", connectionString, parameters);
        }
    }
}
