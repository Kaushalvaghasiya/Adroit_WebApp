﻿using Adroit.Accounting.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IBookAdmin
    {
        public int Save(Model.BookAdmin bookAdmin, string connectionString, int loginId = 0, int firmId = 0);
        public Model.BookAdmin Get(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<Model.BookAdmin> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        public bool Delete(int id, string connectionString, int loginId = 0, int firmId = 0);
        public List<Model.BookAdmin> GetBookAdminSelectList(string connectionString, int loginId = 0, int firmId = 0);
    }
}