using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTCollection
    {
        int Save(GSTCollection value, string connectionString);
        GSTCollectionViewModel Get(int id, string connectionString);
        GSTCollectionViewModel Get(string gstNumber, string connectionString);
        List<DropdownViewModel> SelectCityList(string connectionString);
        List<GSTCollectionGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");

    }
}
