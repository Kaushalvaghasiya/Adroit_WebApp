﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranches
    {
        int Save(CustomerFirmBranch value, int loginId, string connectionString);
        CustomerFirmBranchViewModel Get(int id, int loginId, string connectionString);
        List<CustomerFirmBranchGridViewModel> List(string connectionString, int loginId, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
        void Delete(int id, int deletedById, int loginId, string connectionString);        
    }
}