using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ChalanReceiveRepository : IChalanReceive
    {
        public int Save(ChalanReceiveViewModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@LoginId", value.LoginId);
            parameters.Add("@FirmId", value.FirmId);
            parameters.Add("@BranchId", value.BranchId);
            parameters.Add("@ReceiveDate", value.ReceiveDate);
            parameters.Add("@GoDownNumber", value.GoDownNumber);
            parameters.Add("@BillNumberBranch", value.BillNumberBranch);
            parameters.Add("@BillNumberFirm", value.BillNumberFirm);
            parameters.Add("@PurchaseBillMasterId", value.PurchaseBillMasterId);
            parameters.Add("@ReceivedNote", value.ReceivedNote);
            parameters.Add("@CheckedLRNumberIds", value.CheckedLRNumberIds);
            parameters.Add("@UnCheckedLRNumberIds", value.UnCheckedLRNumberIds);
            return QueryHelper.Save("sp_ChalanReceiveSave", connectionString, parameters);
        }
        public bool Delete(int id, string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            return QueryHelper.Delete("sp_ChalanReceiveDelete", connectionString, parameters);
        }

        public ChalanReceiveViewModel Get(int id, string connectionString, int loginId, int branchId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@LoginId", loginId);
            parameters.Add("@BranchId", branchId);
            return QueryHelper.Get<ChalanReceiveViewModel>("sp_ChalanReceiveGet", connectionString, parameters);
        }
        public List<ChalanReceiveGridViewModel> List(string connectionString, int loginId, int firmId, int branchId, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@BranchId", branchId);
            parameters.Add("@Search", search);
            parameters.Add("@PageStart", pageStart);
            parameters.Add("@PageSize", pageSize);
            parameters.Add("@SortColumn", sortColumn);
            parameters.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ChalanReceiveGridViewModel>("sp_ChalanReceiveList", connectionString, parameters);
        }
        public ChalanReceiveViewModel GetChalanMasterListByChalanNumber(string connectionString, int chalanNumber, int senderId, int loginId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@ChalanNumber", chalanNumber);
            parameters.Add("@SenderId", senderId);
            return QueryHelper.Get<ChalanReceiveViewModel>("sp_ChalanReceiveGetMasterDetailsByChalanNumber", connectionString, parameters);
        }
        public List<ChalanReceiveGridViewModel> GetChalanDetailListByChalanNumber(string connectionString, int chalanNumber, int senderId, int loginId, int firmId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@LoginId", loginId);
            parameters.Add("@FirmId", firmId);
            parameters.Add("@ChalanNumber", chalanNumber);
            parameters.Add("@SenderId", senderId);
            return QueryHelper.GetList<ChalanReceiveGridViewModel>("sp_ChalanReceiveGetChalanDetailByChalanNumber", connectionString, parameters);
        }
    }
}
