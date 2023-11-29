using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class DriverRepository : IDriver
    {
        public int Save(Driver value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@Name", value.Name);
            parameters.Add("@UserId", userId);
            parameters.Add("@Address", value.Address ?? "");
            parameters.Add("@CityId", value.CityId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@PinCode", value.Pincode ?? "");
            parameters.Add("@LicenceIssuePlaceId", value.LicenceIssuePlaceId);
            parameters.Add("@LicenceNumber", value.LicenceNumber ?? "");
            parameters.Add("@AdharUID", value.AdharUID ?? "");
            parameters.Add("@Mobile", value.Mobile ?? "");
            parameters.Add("@LicenceExpiry", value.LicenceExpiry);
            parameters.Add("@DriverTypeId", $"{(short)value.DriverTypeId}");
            parameters.Add("@AdharUID", value.AdharUID ?? "");
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);

            return QueryHelper.Save("sp_DriverSave", connectionString, parameters);
        }
        public DriverViewModel Get(string email, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Email", email);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<DriverViewModel>("sp_DriverGetByEmail", connectionString, parameters);
        }
        public DriverViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<DriverViewModel>("sp_DriverGet", connectionString, parameters);
        }
        public List<DriverGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<DriverGridViewModel>("sp_DriverList", connectionString, param);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_DriverDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_DriverList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectLicenceIssuePlace(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_LicenceIssuePlaceList_Select", connectionString, parameters);
        }
        public List<DropdownViewModel> GetDriverListWithCityId_MobileNo(string connectionString, int loginId)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@loginId", loginId);
            return QueryHelper.GetList<DropdownViewModel>("sp_DriverWithCityId_MobileNo_Select", connectionString, parameters);
        }
    }
}