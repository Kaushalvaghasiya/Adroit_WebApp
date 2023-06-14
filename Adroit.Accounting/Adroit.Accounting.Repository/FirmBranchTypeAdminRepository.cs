﻿using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL;
using Dapper;

namespace Adroit.Accounting.Repository
{
    public class FirmBranchTypeAdminRepository : IFirmBranchTypeAdmin
    {
        public List<DropdownViewModel> GetFirmBranchTypeAdminList(string connectionString)
        {
            var parameters = new DynamicParameters();
            
            return QueryHelper.GetList<DropdownViewModel>("sp_FirmBranchTypeAdminList_Select", connectionString, parameters);
        }
    }
}
