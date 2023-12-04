﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ILRBooking
    {
        public List<LRBookingGridViewModel> List(string connectionString, int branchId, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        int Save(LRBooking value, string connectionString, int loginId);
        public LRBookingViewModel Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public GetRateFromLRBookingViewModel GetRate(int firmId, int branchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString);
        public List<LRBookingGridViewModel> GetLRBookingListByCity(string connectionString, int fromCityId, int toCityId, int branchId, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public List<LRBookingGridViewModel> GetListByPurchaseBillMasterId(string connectionString, int purchaseBillMasterId, int loginId, int branchId, int firmId = 0);
        public List<LRBookingGridViewModel> GetListByLRNumberId(string connectionString, int LRNumberId, int loginId, int branchId, int firmId = 0);

    }
}
