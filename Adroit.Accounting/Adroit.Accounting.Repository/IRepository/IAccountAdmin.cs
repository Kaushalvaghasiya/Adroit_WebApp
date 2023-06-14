﻿using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAccountAdmin
    {
        List<DropdownViewModel> GetAccountAdminList(string connectionString, int loginId = 0, int firmId = 0);
    }
}