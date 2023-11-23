using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IZ_LRBooking_Z
    {
        public List<Z_LRBooking_ZGridViewModel> List(string connectionString, int BranchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, int loginId, string connectionString);
        int Save(Z_LRBooking_Z value, int FirmId, int BranchId, int loginId, string connectionString);
        public Z_LRBooking_ZViewModel Get(int id, string connectionString);
        public (string, int) GetLRBookingRate(int FirmId, int BranchId, int cityIdTo, int billPartyId, int rateOnId, int loginId, string connectionString);
        public int? GetLRNumber(int BranchId, string connectionString);
    }
}
