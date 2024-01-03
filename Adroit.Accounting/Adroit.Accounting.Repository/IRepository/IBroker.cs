using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBroker
    {
        int Save(BrokerViewModel value, int userId, string connectionString);
        //BrokerViewModel Get(string email, int userId, string connectionString);
        BrokerViewModel Get(int id, int userId, string connectionString);
        List<BrokerGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int userId, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString, int userId);
        //List<DropdownViewModel> SelectLicenceIssuePlace(string connectionString);
    }
}