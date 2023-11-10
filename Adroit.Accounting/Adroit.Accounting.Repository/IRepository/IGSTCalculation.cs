using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTCalculation
    {
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(GSTCalculation value, string connectionString);
    }
}