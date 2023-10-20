using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class VehicleRepository : IVehicle
    {
        public VehicleViewModel Get(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            return QueryHelper.Get<VehicleViewModel>("sp_VehicleGet", connectionString, parameters);
        }

        public List<VehicleGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<VehicleGridViewModel>("sp_VehicleList", connectionString, param);
        }

        public int Save(Vehilcle value, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            parameters.Add("@UserId", userId);
            parameters.Add("@VRN", value.VRN);
            parameters.Add("@OwnerId", value.OwnerId);
            parameters.Add("@ModelId", value.ModelId);
            parameters.Add("@StateId", value.StateId);
            parameters.Add("@ChasisNumber", value.ChasisNumber);
            parameters.Add("@EngineNumber", value.EngineNumber);
            parameters.Add("@RegistrationDate", value.RegistrationDate);
            parameters.Add("@StatePermitNumber", value.StatePermitNumber);
            parameters.Add("@StatePermitIssueOn", value.StatePermitIssueOn);
            parameters.Add("@StatePermitExpiry", value.StatePermitExpiry);
            parameters.Add("@NationalPermitNumber", value.NationalPermitNumber);
            parameters.Add("@NationalPermitIssueOn", value.NationalPermitIssueOn);
            parameters.Add("@NationalPermitExpiry", value.NationalPermitExpiry);
            parameters.Add("@InsuranceNumber", value.InsuranceNumber);
            parameters.Add("@InsuranceIssueOn", value.InsuranceIssueOn);
            parameters.Add("@InsuranceExpiry", value.InsuranceExpiry);
            parameters.Add("@Active", value.Active);
            parameters.Add("@AddedById", value.AddedById);
            parameters.Add("@ModifiedById", value.ModifiedById);
            return QueryHelper.Save("sp_VehicleSave", connectionString, parameters);
        }
        public void Delete(int id, int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            parameters.Add("@UserId", userId);
            QueryHelper.Save("sp_VehicleDelete", connectionString, parameters);
        }
        public List<DropdownViewModel> SelectList(int userId, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@UserId", userId);
            return QueryHelper.GetList<DropdownViewModel>("sp_VehicleList_Select", connectionString, parameters);
        }
    }
}
