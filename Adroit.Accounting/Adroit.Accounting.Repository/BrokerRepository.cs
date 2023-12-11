using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class BrokerRepository : IBroker
    {
        public int Save(Broker value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@UserId", userId);
            parameters.Add("@OwnerBranchId", value.OwnerBranchId);
            parameters.Add("@Name", value.Name);
            parameters.Add("@Brokerage", value.Brokerage);
            parameters.Add("@Address", value.Address ?? "");
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@Pincode", value.Pincode);
            parameters.Add("@ContactPersonName", value.ContactPersonName);
            parameters.Add("@Mobile", value.Mobile);
            parameters.Add("@MobileAlternate", value.MobileAlternate ?? "");
            parameters.Add("@Email", value.Email);
            parameters.Add("@AdharUID", value.AdharUID ?? "");
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);

            return QueryHelper.Save("sp_BrokerSave", connectionString, parameters);
        }
        public BrokerViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<BrokerViewModel>("sp_BrokerGet", connectionString, parameters);
        }
        public List<BrokerGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<BrokerGridViewModel>("sp_BrokerList", connectionString, param);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_BrokerDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString, int userId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.GetList<DropdownViewModel>("sp_BrokerList_Select", connectionString, parameters);
        }
    }
}