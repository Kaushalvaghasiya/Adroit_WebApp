﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface IAdminCustomerUser
    {
        List<CustomerUserGridViewModel> List(string connectionString, int loginId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC", int CustomerId = 0);
        void Delete(int id, int loginId, string connectionString);
        int Save(CustomerUser value, string connectionString);
        CustomerUserViewModel Get(int id, string connectionString);
        CustomerUserViewModel Get(string username, string connectionString);
        List<DropdownViewModel> SelectList(int customerId, string connectionString);
    }
}