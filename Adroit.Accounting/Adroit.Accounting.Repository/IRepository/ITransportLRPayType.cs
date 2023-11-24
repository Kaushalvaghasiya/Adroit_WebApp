using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ITransportLRPayType
    {
        List<DropdownViewModel> SelectList(string connectionString);
        public List<DropdownViewModel> GetLRPayTypeList(int branchId, string connectionString);
    }
}