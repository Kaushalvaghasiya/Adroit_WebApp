using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBillTypeAdmin
    {
        List<DropdownViewModel> GetBillTypeAdminList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
