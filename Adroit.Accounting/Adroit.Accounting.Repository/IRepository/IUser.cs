using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IUser
    {
        int Save(UserDetail value, string connectionString);
        UserDetail Get(int id, string connectionString);
        UserDetail Get(Guid userId, string connectionString);
        UserDetail Get(string username, string connectionString);
        void Delete(int id, int deletedById, string connectionString);
        void Active(int id, int activatedByUserId, string connectionString);
        void Deactive(int id, int deactivatedByUserId, string connectionString);
        List<DropdownViewModel> SelectList(int customerId, string connectionString);
        int GetLoggedInBranchId(int loginId, string connectionString);
        int GetLoggedInFirmId(int loginId, string connectionString);
        int? GetLoggedInYearId(int loginId, string connectionString);
    }
}