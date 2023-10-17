using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITransportDesc
    {
        int Save(TransportDesc value, string connectionString);
        TransportDescViewModel Get(int id, string connectionString);
        void Delete(int id, string connectionString);
        //List<DropdownViewModel> SelectList(string connectionString);
        //List<DropdownViewModel> SelectList(string connectionString);
        List<TransportDescGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}