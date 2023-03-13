using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IUser
    {
        int Save(UserDetail userDeteail, string connectionString);
        List<UserDetail> GetUsersByAccount(int accountId, string connectionString);
        UserDetail GetUserDetail(string email, string connectionString);
        UserDetail GetUserDetail(int id, string connectionString);
        void Delete(int ID, string connectionString);
        void Active(int ID, bool isActive, string connectionString);
    }
}