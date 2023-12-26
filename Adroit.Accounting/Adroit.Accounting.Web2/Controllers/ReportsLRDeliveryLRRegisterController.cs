﻿using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRRegister()
        {
            LRDeliveryLRRegisterViewModel model = new LRDeliveryLRRegisterViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = new List<Model.ViewModel.DropdownViewModel> {
                new Model.ViewModel.DropdownViewModel { Value = "0", Text ="Static Chhe"},
                new Model.ViewModel.DropdownViewModel { Value = "1", Text ="Date Wise"},
                new Model.ViewModel.DropdownViewModel { Value = "2", Text ="LR Wise"},
                new Model.ViewModel.DropdownViewModel { Value = "3", Text ="Party Wise"}
            };

            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.ConsignorList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.ConsigneeList = model.ConsignorList;
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PvtMarkList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.PrivateMarka);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);

            model.InvStatusList = new List<Model.ViewModel.DropdownViewModel> {
                new Model.ViewModel.DropdownViewModel { Value = "0", Text ="Static Chhe"},
                new Model.ViewModel.DropdownViewModel { Value = "1", Text = "All"},
                new Model.ViewModel.DropdownViewModel { Value = "2", Text = "Invoice Done"},
                new Model.ViewModel.DropdownViewModel { Value = "3", Text = "Pending Invoice"},
                new Model.ViewModel.DropdownViewModel { Value = "4", Text = "Forward Chalan"}
            };
            model.VehicleNumberList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);

            model.LRViewList = new List<Model.ViewModel.DropdownViewModel> {
                new Model.ViewModel.DropdownViewModel { Value = "0", Text ="Static Chhe"},
                new Model.ViewModel.DropdownViewModel { Value = "1", Text = "All LR"},
                new Model.ViewModel.DropdownViewModel { Value = "2", Text = "Past Year LR"},
                new Model.ViewModel.DropdownViewModel { Value = "3", Text = "Current Year LR"}
            };
            model.ChalanList = new List<Model.ViewModel.DropdownViewModel>();
            return View(model);
        }
    }
}