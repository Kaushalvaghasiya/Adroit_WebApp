using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ISalesBillMaster
    {
        List<SalesBillDetailViewModel> GetListBySalesBillMasterId(string connectionString, int salesBillMasterId, int loginId, int branchId, int firmId);
    }
}
