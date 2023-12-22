using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ILRBookingRenew
    {
        int Save(LRBookingRangeViewModel value, string connectionString);
        LRBookingRangeViewModel Get(int id, int firmId, string connectionString);
        List<LRBookingRangeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int loginId, string connectionString);
    }
}