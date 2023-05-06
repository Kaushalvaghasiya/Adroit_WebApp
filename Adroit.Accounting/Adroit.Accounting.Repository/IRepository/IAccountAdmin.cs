using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAccountAdmin
    {
        List<Model.AccountAdmin> GetAccountAdminList(string connectionString, int loginId = 0, int firmId = 0);
    }
}