using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProductDesignNumber
    {
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(ProductDesignNumber value, int userId, string connectionString);
        ProductDesignNumberViewModel Get(int id, int userId, string connectionString);
        void Delete(int id, int userId, string connectionString);
        List<ProductDesignNumberGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}