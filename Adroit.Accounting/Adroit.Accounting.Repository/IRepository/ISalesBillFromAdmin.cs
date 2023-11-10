using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ISalesBillFromAdmin
    {
        List<SalesBillFromAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(string id, string connectionString);
        int Save(SalesBillFromAdmin value, string connectionString);
        SalesBillFromAdminViewModel Get(string id, string connectionString);
        List<DropdownViewModel> SalesBillFromAdminList(string connectionString, int loginId = 0, int firmId = 0);
    }
}