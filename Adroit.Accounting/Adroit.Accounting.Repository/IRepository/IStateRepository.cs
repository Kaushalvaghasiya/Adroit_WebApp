using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IStateRepository
    {
        List<State> GetStateList(string connectionString);
    }
}
