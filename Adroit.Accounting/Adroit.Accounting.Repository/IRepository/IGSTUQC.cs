using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTUQC
    {
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(GSTUQC value, string connectionString);
    }
}