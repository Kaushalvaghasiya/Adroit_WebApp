using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICityRepository
    {
        List<City> GetCityList(string connectionString);
    }
}
