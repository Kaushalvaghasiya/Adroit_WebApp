using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IProductCategory
    {
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(ProductCategory value, string connectionString);
    }
}