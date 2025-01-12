﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IGSTRate
    {
        List<GSTRateGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        int Save(GSTRate value, string connectionString);
        GSTRateViewModel Get(int id, string connectionString);
        public GSTRateViewModel GetListWithProductId(string connectionString, int productId);
    }
}
