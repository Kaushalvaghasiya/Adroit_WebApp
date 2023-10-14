using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class BookTypeAdminRepository : IBookTypeAdmin
    {
        public int Save(BookTypeAdmin bookTypeAdmin, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", bookTypeAdmin.Id);
            parameters.Add("@Title", bookTypeAdmin.Title);
            parameters.Add("@Active", bookTypeAdmin.Active);
            return QueryHelper.Save("sp_BookTypeAdminSave", connectionString, parameters);
        }
        public void Delete(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            QueryHelper.Save("sp_BookTypeAdminDelete", connectionString, parameters);
        }

        public BookTypeAdminViewModel Get(int id, string connectionString)
        {
            var parameters = new DynamicParameters();
            parameters.Add("@Id", id);
            return QueryHelper.Get<BookTypeAdminViewModel>("sp_BookTypeAdminGet", connectionString, parameters);
        }

        public List<BookTypeAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC")
        {
            var param = new DynamicParameters();
            param.Add("@LoginId", loginId);
            param.Add("@FirmId", firmId);
            param.Add("@Search", search);
            param.Add("@PageStart", pageStart);
            param.Add("@PageSize", pageSize);
            param.Add("@SortColumn", sortColumn);
            param.Add("@SortOrder", sortOrder);
            return QueryHelper.GetList<BookTypeAdminGridViewModel>("sp_BookTypeAdminList", connectionString, param);
        }

    }
}
