﻿using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class AccountGroupAdminRepository : IAccountGroupAdmin
    {
        public List<DropdownViewModel> GetAccountGroupAdmin_SelectList(string connectionString)
        {
            var parameters = new DynamicParameters();
            return QueryHelper.GetList<DropdownViewModel>("sp_AccountGroupAdminList_Select", connectionString, parameters);
        }
    }
}
