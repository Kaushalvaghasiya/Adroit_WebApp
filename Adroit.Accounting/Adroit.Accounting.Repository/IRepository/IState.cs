using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IState
    {
        List<Model.State> GetStateList(string connectionString, int countryId);
    }
}
