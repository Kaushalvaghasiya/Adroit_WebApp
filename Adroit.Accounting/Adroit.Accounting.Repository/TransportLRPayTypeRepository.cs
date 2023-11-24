using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TransportLRPayTypeRepository : ITransportLRPayType
    {
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportLRPayTypeList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> GetLRPayTypeList(int branchId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@BranchId", branchId);
            return QueryHelper.GetList<DropdownViewModel>("sp_CustomerFirmBranchTransportSettingListWithLRType_Select", connectionString, parameters);
        }
    }
}
