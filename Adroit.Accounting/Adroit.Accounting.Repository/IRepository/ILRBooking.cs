using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ILRBooking
    {
        public List<LRBookingGridViewModel> List(string connectionString, int loginId, int branchId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        int Save(LRBookingViewModel value, string connectionString, int loginId);
        public LRBookingViewModel Get(int id, string connectionString, int loginId, int branchId, int firmId);
        public GetRateFromLRBookingViewModel GetLRBookingRate(int firmId, int branchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString);
        public string GetLRBookingMaxDate(string connectionString, int branchId);
    }
}
