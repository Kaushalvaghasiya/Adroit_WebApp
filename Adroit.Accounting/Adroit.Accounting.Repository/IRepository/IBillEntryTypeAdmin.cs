using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBillEntryTypeAdmin
    {
        List<DropdownViewModel> GetBillEntryTypeAdminList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
