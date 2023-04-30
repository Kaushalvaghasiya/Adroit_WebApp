using Adroit.Accounting.Model;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICity
    {
        List<Model.City> GetCityList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0);
    }
}
