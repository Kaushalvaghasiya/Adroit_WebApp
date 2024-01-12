using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult ChalanReceiveAgency()
        {
            var model = new ChalanReceiveAgencyViewModel();

            var customerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
            if (customerFirmTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Firm" });
            }
            else
            {
                model.CustomerFirmTransportSetting = customerFirmTransportSetting;
            }

            model.CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetByLoginId(CurrentUserId, _configurationData.DefaultConnection);

            model.EwayBillBList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ChalanReceiveAgencyMasterTable._TableName, ChalanReceiveAgencyMasterTable.EwayBillNumber);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.DriverList = _driverRepository.SelectList(_configurationData.DefaultConnection, CurrentUserId);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId, _configurationData.DefaultConnection, CurrentUserId);

            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.EwayBillAList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ChalanReceiveAgencyDetailTable._TableName, ChalanReceiveAgencyDetailTable.EwayBillNumber);
            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectListByFirmId(CurrentFirmId, _configurationData.DefaultConnection);

            var currentUserBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);
            var currentCity = _cityRepository.Get((int)currentUserBranch.CityId!, _configurationData.DefaultConnection);

            model.CityIdFrom = currentCity.Id;
            model.CityFrom = currentCity.Title;

            ViewBag.CurrentBranchId = CurrentBranchId;
            return View(model);
        }

        [HttpGet]
        public JsonResult ChalanReceiveAgencyList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<ChalanReceiveAgencyGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _chalanReceiveAgency.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<ChalanReceiveAgencyGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        public JsonResult DeleteChalanReceiveAgency(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanReceiveAgency.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [HttpGet]
        public JsonResult GetChalanReceiveAgency(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _chalanReceiveAgency.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                data.AgencyDetailList = _chalanReceiveAgency.GetDetailListByMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.data = data;
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
        [HttpPost]
        public JsonResult SaveChalanReceiveAgency([FromBody] ChalanReceiveAgencyViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.LoginId = CurrentUserId;
                model.BranchId = CurrentBranchId;
                model.FirmId = CurrentFirmId;
                int id = _chalanReceiveAgency.Save(model, _configurationData.DefaultConnection);
                if (id > 0)
                {
                    result.data = true;
                    result.result = Constant.API_RESULT_SUCCESS;
                }
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }
    }
}