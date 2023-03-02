using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IDistrictRepository
    {
        List<District> GetDistrictList(string connectionString, int stateId);
    }
}
