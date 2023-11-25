using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class TransportLRDeliveryTypeRepository : ITransportLRDeliveryType
    {
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_TransportLRDeliveryTypeList_Select", connectionString, parameters);
        }
    }
}
