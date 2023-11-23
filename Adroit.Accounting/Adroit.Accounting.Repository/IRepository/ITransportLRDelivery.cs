using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITransportLRDelivery
    {
        List<DropdownViewModel> SelectList(string connectionString);
    }
}