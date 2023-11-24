using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ILRBooking
    {
        public List<LRBookingGridViewModel> List(string connectionString, int BranchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, int loginId, string connectionString);
        int Save(LRBooking value, int FirmId, int BranchId, int loginId, string connectionString);
        public LRBookingViewModel Get(int id, string connectionString);
        public (string, int) GetLRBookingRate(int FirmId, int BranchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString);
        public int? GetLRNumber(int BranchId, string connectionString);
    }
}
