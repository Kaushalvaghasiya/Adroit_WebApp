using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProductShadeNumber
    {
        int Save(ProductShadeNumber value, int userId, string connectionString);
        ProductShadeNumberViewModel Get(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(int firmId, string connectionString);
        void Delete(int id, int userId, string connectionString);
        List<ProductShadeNumberGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}