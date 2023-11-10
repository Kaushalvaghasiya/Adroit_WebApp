using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProductFabric
    {
        int Save(ProductFabric value, int userId, string connectionString);
        ProductFabricViewModel Get(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        void Delete(int id, int userId, string connectionString);
        List<ProductFabricGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}