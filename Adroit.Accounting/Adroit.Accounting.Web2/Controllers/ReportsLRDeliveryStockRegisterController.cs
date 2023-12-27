using Adroit.Accounting.Model;
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
        public IActionResult LRDeliveryStockRegister()
        {
            LRDeliveryStockRegisterViewModel model = new LRDeliveryStockRegisterViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);

            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.ConsignorList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.ConsigneeList = model.ConsignorList;
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);

            model.InvStatusList = new List<Model.ViewModel.DropdownViewModel> {
                new Model.ViewModel.DropdownViewModel { Value = "0", Text ="Static Chhe"},
                new Model.ViewModel.DropdownViewModel { Value = "1", Text = "All"},
                new Model.ViewModel.DropdownViewModel { Value = "2", Text = "Invoice Done"},
                new Model.ViewModel.DropdownViewModel { Value = "3", Text = "Pending Invoice"},
                new Model.ViewModel.DropdownViewModel { Value = "4", Text = "Forward Chalan"}
            };
            model.ChalanList = new List<Model.ViewModel.DropdownViewModel> {
                new Model.ViewModel.DropdownViewModel { Value = "0", Text ="Static Chhe"},
                new Model.ViewModel.DropdownViewModel { Value = "1", Text = "All"},
                new Model.ViewModel.DropdownViewModel { Value = "2", Text = "Chalan Done"},
                new Model.ViewModel.DropdownViewModel { Value = "3", Text = "Pending Chalan"}
            };
            return View(model);
        }
    }
}