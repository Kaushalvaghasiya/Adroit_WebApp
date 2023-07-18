using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class ColorRepository : IColor
    {
        public int Save(ColorAdmin colorAdmin, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", colorAdmin.Id);
            parameters.Add("@Title", colorAdmin.Title);
            parameters.Add("@OrderNumber", colorAdmin.OrderNumber);
            parameters.Add("@Active", colorAdmin.Active);
            return QueryHelper.Save("sp_ColorSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_ColorDelete", connectionString, parameters);
        }
        public ColorViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<ColorViewModel>("sp_ColorGet", connectionString, parameters);
        }
        public List<ColorGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<ColorGridViewModel>("sp_ColorList", connectionString, param);
        }
    }
}
