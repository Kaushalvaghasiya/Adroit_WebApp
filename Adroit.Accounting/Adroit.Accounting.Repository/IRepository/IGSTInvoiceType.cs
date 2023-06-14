using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTInvoiceType
    {
        List<DropdownViewModel> GetGSTInvoiceTypeList(string connectionString);
    }
}
