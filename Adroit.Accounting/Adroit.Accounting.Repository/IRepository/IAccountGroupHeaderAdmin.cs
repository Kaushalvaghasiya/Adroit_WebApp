﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAccountGroupHeaderAdmin
    {
        int Save(AccountGroupHeaderAdmin value, string connectionString);
        AccountGroupHeaderAdminViewModel Get(int id, string connectionString);
        void Delete(int id, string connectionString);
        List<DropdownViewModel> SelectList(string connectionString);
        List<DropdownViewModel> SelectList(short businessId, string connectionString);
        List<AccountGroupHeaderAdminGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");

    }
}