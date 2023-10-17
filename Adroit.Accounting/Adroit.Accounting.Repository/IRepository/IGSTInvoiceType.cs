using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTInvoiceType
    {
        List<DropdownViewModel> SelectList(string connectionString);
        List<GSTInvoiceTypeGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(GSTInvoiceType value, string connectionString);
        GSTInvoiceTypeViewModel Get(int id, string connectionString);
    }
}
