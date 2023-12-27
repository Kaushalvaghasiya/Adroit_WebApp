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
        public IActionResult LRRegister()
        {
            LRDeliveryLRRegisterViewModel model = new LRDeliveryLRRegisterViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetViewList();
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.ConsignorList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.ConsigneeList = model.ConsignorList;
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.PvtMarkList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, LRBookingTable._TableName, LRBookingTable.PrivateMarka);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.InvStatusList = GenericHelper.GetInvoiceStatusList();
            model.VehicleNumberList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.LRViewList = GenericHelper.GetLRViewList();
            model.ChalanList = _chalanRepository.GetChalanListByBranchId_Select(_configurationData.DefaultConnection, CurrentBranchId);
            return View(model);
        }
    }
}