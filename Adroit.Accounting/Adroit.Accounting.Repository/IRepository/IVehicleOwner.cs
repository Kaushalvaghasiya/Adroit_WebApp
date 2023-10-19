using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IVehicleOwner
    {
        List<VehicleOwnerGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        int Save(VehicleOwner value, int userId, string connectionString);
        void Delete(int id, int userId, string connectionString);
        VehicleOwnerViewModel Get(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(int userId, string connectionString);
    }
}
