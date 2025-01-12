﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.ViewModel;

namespace Adroit.Accounting.Repository.IRepository
{
    public interface ICustomerFirmBranchTransportSetting
    {
        int Save(CustomerFirmBranchTransportSettingViewModel value, string connectionString);
        int SaveChalanDetailTemplate(CustomerFirmBranchTransportSettingViewModel value, string connectionString);
        int SaveChalanSammaryTemplate(CustomerFirmBranchTransportSettingViewModel value, string connectionString);
        CustomerFirmBranchTransportSettingViewModel Get(int id, string connectionString);
        CustomerFirmBranchTransportSettingViewModel GetByLoginId(int loginId, string connectionString);
        List<CustomerFirmBranchTransportSettingGridViewModel> List(string connectionString, int loginId, int branchId = 0, int firmId = 0, string search = "", int pageStart = 0, int pageSize = 10, int sortColumn = 0, string sortOrder = "ASC");
    }
}