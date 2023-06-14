using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FirmTypeAdminRepository : IFirmTypeAdmin
    {
        public List<DropdownViewModel> GetFirmTypeAdminList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_FirmAdminTypeList_Select", connectionString, parameters);
        }

    }
}
