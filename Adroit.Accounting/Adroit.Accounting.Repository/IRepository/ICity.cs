using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICity
    {
        List<CityGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(City value, string connectionString);
        CityViewModel Get(int id, string connectionString);
        CityViewModel Get(string Cities, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString, int stateId = 0, int talukaId = 0, int districtId = 0);
    }
}
