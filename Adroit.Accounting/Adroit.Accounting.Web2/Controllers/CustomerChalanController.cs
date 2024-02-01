using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Chalan()
        {
            var model = new PurchaseBillMasterViewModel();
            var customerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            if (customerFirmBranchTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Branch" });
            }
            else
            {
                model.CustomerFirmBranchTransportSetting = customerFirmBranchTransportSetting;
            }

            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillMasterTable._TableName, PurchaseBillMasterTable.EwayBillNumber);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.DriverList = _driverRepository.SelectList(_configurationData.DefaultConnection, CurrentUserId);
            model.BrokerList = _customerBrokerBranchMappingRepo.SelectList(CurrentBranchId,_configurationData.DefaultConnection, CurrentUserId);
            model.CustomerFirmBranchList = _customerFirmBranchRepository.SelectListByLoginId(CurrentUserId, _configurationData.DefaultConnection);
           
            var currentUserBranch = _customerFirmBranchRepository.Get(CurrentBranchId, CurrentFirmId, _configurationData.DefaultConnection);

            ViewBag.CurrentBranchId = CurrentBranchId;
            ViewBag.LoggedInBranchCity = currentUserBranch.CityId;
            ViewBag.BookName = $"{model.CustomerFirmBranchTransportSetting.PurchaseBookName}";

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveChalan([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.FirmId = CurrentFirmId;
                model.BranchId = CurrentBranchId;
                model.LoginId = CurrentUserId;
                model.YearId = CurrentYearId;
                
                int id = _chalanRepository.Save(model, _configurationData.DefaultConnection);
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

        [HttpGet]
        public JsonResult GetChalan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, CurrentUserId, CurrentBranchId);
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

        [HttpGet]
        public JsonResult ChalanList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<PurchaseBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _chalanRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<PurchaseBillMasterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        public JsonResult DeleteChalan(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetLRBookingListByCity/{fromCityIds}/{toCityIds}")]
        public JsonResult GetLRBookingListByCity(string fromCityIds, string toCityIds, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByCity(_configurationData.DefaultConnection, fromCityIds, toCityIds, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<LRBookingGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanToPayAmount/{lrNumberIds}")]
        public JsonResult GetChalanToPayAmount(string lrNumberIds)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetChalanToPayAccountValueList(lrNumberIds, _configurationData.DefaultConnection, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByPurchaseBillMasterId/{purchaseBillMasterId}")]
        public JsonResult GetListByPurchaseBillMasterId(int purchaseBillMasterId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, purchaseBillMasterId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByLRNumberId/{lrNumberId}")]
        public JsonResult GetListByLRNumberId(int lrNumberId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetListByLRNumberId(_configurationData.DefaultConnection, lrNumberId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetTDSPercentByCustomerAccountBranchMappingId/{customerAccountBranchMappingId}")]
        public JsonResult GetTDSPercentByCustomerAccountBranchMappingId(int customerAccountBranchMappingId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerAccountRepo.GetCustomerAccountByBranchMappingId(_configurationData.DefaultConnection, customerAccountBranchMappingId, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetChalanCustomerAccountBranchMappingList_Select/{vehicleId}")]
        public JsonResult GetChalanCustomerAccountBranchMappingList_Select(int vehicleId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _chalanRepository.GetCustomerAccountBranchMappingList_Select(CurrentUserId, CurrentFirmId, CurrentBranchId, vehicleId, _configurationData.DefaultConnection);
                result.result = Constant.API_RESULT_SUCCESS;
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