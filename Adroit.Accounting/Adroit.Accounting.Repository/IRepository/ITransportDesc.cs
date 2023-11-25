using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITransportDesc
    {
        int Save(TransportDesc value, int userId, string connectionString);
        TransportDescViewModel Get(int id, int userId, string connectionString);
        void Delete(int id, int userId, string connectionString);
        List<TransportDescGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        List<DropdownViewModel> SelectList(string connectionString);
    }
}