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
        public const string GATE_PASS = "GatePass";

        [Route("~/Customer/DeliveryInvoice/{type?}")]
        public IActionResult DeliveryInvoice(string type = "")
        {
            var model = new SalesBillMasterViewModel() { UIName = type };

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

            model.CustomerFirm = _customerFirmRepository.Get(CurrentFirmId, CurrentFirmId, _configurationData.DefaultConnection);
            model.CalculateGST = _customerFirmRepository.IsGSTEnabled(CurrentUserId, _configurationData.DefaultConnection);

            ViewBag.BookName = model.UIName == GATE_PASS ? $"{model.CustomerFirmBranchTransportSetting.GatePassBookName}" : $"{model.CustomerFirmBranchTransportSetting.DeliverySalesBookName}";
            model.LRNumberList = _lrBookingRepository.GetLRNumberListForDeliveryInvoice(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.PayTypeList = _transportLRPayTypeRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult DeliveryInvoiceList(int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<SalesBillMasterGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _customerDeliveryInvoice.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
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
        public JsonResult SaveDeliveryInvoice([FromBody] SalesBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.FirmId = CurrentFirmId;
                model.BranchId = CurrentBranchId;
                model.LoginId = CurrentUserId;
                model.YearId = CurrentYearId;

                int id = _customerDeliveryInvoice.Save(model, _configurationData.DefaultConnection);
                if (id > 0)
                {
                    result.data = id;
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
        public JsonResult DeleteDeliveryInvoice(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerDeliveryInvoice.Delete(id, _configurationData.DefaultConnection, CurrentUserId);
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
        public JsonResult GetDeliveryInvoice(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerDeliveryInvoice.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetDeliveryLRBookingListByDate/{fromDate}/{toDate}/{payTypeId}/{accountBranchMappingId}")]
        public JsonResult GetDeliveryLRBookingListByDate(string fromDate, string toDate, string payTypeId, string accountBranchMappingId, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByDateForDeliveryInvoice(_configurationData.DefaultConnection, fromDate, toDate, payTypeId, accountBranchMappingId, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/Customer/GetDeliveryInvoiceListByLRNumberId/{lrNumberId}/{isAgency}")]
        public JsonResult GetDeliveryInvoiceListByLRNumberId(int lrNumberId, bool isAgency)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerDeliveryInvoice.GetListByLRNumberId(_configurationData.DefaultConnection, lrNumberId, CurrentUserId, CurrentBranchId, CurrentFirmId, isAgency);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetDeliveryListByCustomerAccountBranchMappingId/{customerAccountBranchMappingId}")]
        public JsonResult GetDeliveryListByCustomerAccountBranchMappingId(int customerAccountBranchMappingId)
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

        [Route("~/Customer/GetDeliveryListBySalesBillMasterId/{salesBillMasterId}")]
        public JsonResult GetDeliveryListBySalesBillMasterId(int salesBillMasterId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _salesBillMaster.GetListBySalesBillMasterId(_configurationData.DefaultConnection, salesBillMasterId, CurrentUserId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetDeliveryInvoiceCustomerAccountBranchMappingList_Select/{payTypeId}")]
        public JsonResult GetDeliveryInvoiceCustomerAccountBranchMappingList_Select(int payTypeId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _customerDeliveryInvoice.GetCustomerAccountBranchMappingList_Select(CurrentUserId, CurrentFirmId, CurrentBranchId, payTypeId, _configurationData.DefaultConnection);
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