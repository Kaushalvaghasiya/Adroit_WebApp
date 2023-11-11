using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITransportLRCharges
    {
        List<TransportLRChargesGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
        int Save(TransportLRCharge value, string connectionString);
        TransportLRChargesViewModel Get(int id, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
    }
}
