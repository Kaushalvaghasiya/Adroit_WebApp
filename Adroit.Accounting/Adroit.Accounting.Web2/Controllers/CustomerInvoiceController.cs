using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Operations;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Invoice()
        {
            var model = new SalesBillMasterViewModel();

            var customerFirmTransportSetting = _customerFirmTransportSettingRepository.Get(CurrentFirmId, _configurationData.DefaultConnection);
            if (customerFirmTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Firm" });
            }
            else
            {
                model.CustomerFirmTransportSetting = customerFirmTransportSetting;
            }

            var customerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            if (customerFirmBranchTransportSetting == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Settings > Transport Settings > Branch" });
            }
            else
            {
                model.CustomerFirmBranchTransportSetting = customerFirmBranchTransportSetting;
            }

            ViewBag.BookName = $"{model.CustomerFirmBranchTransportSetting.BookingSalesBookName}";
            model.LRNumberList = _lrBookingRepository.GetLRNumberListByLRPayTypeId(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult InvoiceList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<SalesBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerInvoice.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<SalesBillMasterGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }
        [AllowAnonymous]

        [HttpPost]
        public JsonResult SaveInvoice([FromBody] SalesBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.FirmId = CurrentFirmId;
                model.BranchId = CurrentBranchId;
                model.LoginId = CurrentUserId;
                model.YearId = CurrentYearId;

                int id = _customerInvoice.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteInvoice(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerInvoice.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
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
        public JsonResult GetInvoice(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerInvoice.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetLRBookingListByDate/{fromDate}/{toDate}/{payTypeId}/{accountBranchMappingId}")]
        public JsonResult GetLRBookingListByDate(string fromDate, string toDate, string payTypeId, string accountBranchMappingId, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByDate(_configurationData.DefaultConnection, fromDate, toDate, payTypeId, accountBranchMappingId, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/Customer/GetInvoiceListByLRNumberId/{lrNumberId}")]
        public JsonResult GetInvoiceListByLRNumberId(int lrNumberId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerInvoice.GetListByLRNumberId(_configurationData.DefaultConnection, lrNumberId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByCustomerAccountBranchMappingId/{customerAccountBranchMappingId}")]
        public JsonResult GetListByCustomerAccountBranchMappingId(int customerAccountBranchMappingId)
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

        [Route("~/Customer/GetListBySalesBillMasterId/{salesBillMasterId}")]
        public JsonResult GetListBySalesBillMasterId(int salesBillMasterId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetListBySalesBillMasterId(_configurationData.DefaultConnection, salesBillMasterId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetInvoiceCustomerAccountBranchMappingList_Select/{payTypeId}")]
        public JsonResult GetInvoiceCustomerAccountBranchMappingList_Select(int payTypeId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerInvoice.GetCustomerAccountBranchMappingList_Select(CurrentUserId, CurrentFirmId, CurrentBranchId, payTypeId, _configurationData.DefaultConnection);
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