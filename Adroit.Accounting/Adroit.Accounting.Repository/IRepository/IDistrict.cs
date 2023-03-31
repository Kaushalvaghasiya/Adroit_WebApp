using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IDistrict
    {
        List<Model.District> GetDistrictList(string connectionString, int stateId);
    }
}
