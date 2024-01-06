using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class VehicleOwnerRepository : IVehicleOwner
    {
        public VehicleOwnerViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<VehicleOwnerViewModel>("sp_VehicleOwnerGet", connectionString, parameters);
        }

        public List<VehicleOwnerGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<VehicleOwnerGridViewModel>("sp_VehicleOwnerList", connectionString, param);
        }

        public int Save(VehicleOwner value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@UserId", userId);
            parameters.Add("@Name", value.Name);
            parameters.Add("@Address", value.Address);
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@Pincode", value.Pincode);
            parameters.Add("@Mobile", value.Mobile);
            parameters.Add("@PAN", value.PAN);
            parameters.Add("@AccountId", value.AccountId);
            parameters.Add("@AdharUID", value.AdharUID);
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_VehicleOwnerSave", connectionString, parameters);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_VehicleOwnerDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.GetList<DropdownViewModel>("sp_VehicleOwnerList_Select", connectionString, parameters);
        }
    }
}
