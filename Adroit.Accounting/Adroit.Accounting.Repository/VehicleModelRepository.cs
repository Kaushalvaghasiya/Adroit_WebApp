using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class VehicleModelRepository : IVehicleModel
    {
        public VehicleModelViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<VehicleModelViewModel>("sp_VehicleModelGet", connectionString, parameters);
        }

        public List<VehicleModelGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<VehicleModelGridViewModel>("sp_VehicleModelList", connectionString, param);
        }

        public int Save(VehicleModel value, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", value.Id);
            //parameters.Add("@Title", value.Title);
            //parameters.Add("@PhoneCode", value.PhoneCode);
            parameters.Add("@Active", value.Active);
            return QueryHelper.Save("sp_VehicleModelSave", connectionString, parameters);
        }

        public List<DropdownViewModel> SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_VehicleModelList_Select", connectionString, parameters);
        }
    }
}
