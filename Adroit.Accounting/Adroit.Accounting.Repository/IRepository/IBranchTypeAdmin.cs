using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBranchTypeAdmin
    {
        int Save(BranchTypeAdmin value, string connectionString);
        BranchTypeAdminViewModel Get(int id, string connectionString);
        void Delete(int id, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        List<BranchTypeAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}
