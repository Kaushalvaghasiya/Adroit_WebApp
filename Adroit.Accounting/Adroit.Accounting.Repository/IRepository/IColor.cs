using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IColor
    {
        List<ColorGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");

        void Delete(int id, string connectionString);

        int Save(ColorAdmin colorAdmin, string connectionString);

        ColorViewModel Get(int id, string connectionString);
    }
}
