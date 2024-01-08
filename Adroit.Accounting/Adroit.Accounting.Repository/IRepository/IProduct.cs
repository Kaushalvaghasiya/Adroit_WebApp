using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProduct
    {
        List<DropdownViewModel> GetProductList(int firmId, string connectionString, int loginId = 0);
        List<ProductGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int firmId, string connectionString, int loginId);
        int Save(ProductViewModel value, string connectionString);
        ProductViewModel Get(int id, string connectionString, int loginId, int firmId);
        ProductViewModel GetByProductBranchMappingId(int id, string connectionString, int loginId, int firmId, int branchId);
        public List<DropdownViewModel> GetListWithGroupId(string connectionString, int GroupId, int loginId = 0, int firmId = 0);
    }
}