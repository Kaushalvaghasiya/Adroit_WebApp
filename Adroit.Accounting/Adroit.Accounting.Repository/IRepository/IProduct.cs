using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProduct
    {
        List<DropdownViewModel> GetProductList(string connectionString, int loginId = 0, int firmId = 0);
        List<ProductGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int loginId, string connectionString);
        int Save(ProductViewModel value, int loginId,string connectionString);
        ProductViewModel Get(int id, string connectionString);
    }
}