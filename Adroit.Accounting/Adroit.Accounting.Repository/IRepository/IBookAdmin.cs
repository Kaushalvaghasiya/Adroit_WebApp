﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBookAdmin
    {
        public int Save(BookAdmin value, string connectionString, int loginId = 0, int firmId = 0);
        public BookAdmin Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<BookAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<BookAdmin> GetBookAdminSelectList(string connectionString, int loginId = 0, int firmId = 0);
    }
}
