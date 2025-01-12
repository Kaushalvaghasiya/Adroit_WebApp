﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ILRBooking
    {
        public List<LRBookingGridViewModel> List(string connectionString, int loginId, int branchId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        int Save(LRBookingViewModel value, string connectionString);
        public LRBookingViewModel Get(int id, string connectionString, int loginId, int branchId, int firmId);
        public GetRateFromLRBookingViewModel GetRate(int firmId, int branchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString);
        public List<LRBookingGridViewModel> GetLRBookingListByCity(string connectionString, string fromCityIds, string toCityIds, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<LRBookingGridViewModel> GetListByPurchaseBillMasterId(string connectionString, int purchaseBillMasterId, int loginId, int branchId, int firmId = 0);
        public List<LRBookingGridViewModel> GetLRBookingListByDate(string connectionString, string fromDate, string toDate, string PayTypeId, string AccountBranchMappingId, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<LRBookingGridViewModel> GetLRBookingListByDateForDeliveryInvoice(string connectionString, string fromDate, string toDate, string PayTypeId, string AccountBranchMappingId, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        List<DropdownViewModel> GetLRNumberListByLRPayTypeId(string connectionString, int loginId, int firmId, int branchId);
        public LRBookingViewModel GetGSTRate(int firmId, int branchId, int productId, string connectionString);
        public List<DropdownViewModel> GetLRNumberListForDeliveryInvoice(string connectionString, int loginId, int firmId, int branchId);
    }
}
