using Adroit.Accounting.Model;
using Adroit.Accounting.Model.GridViewModel;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Invoice()
        {
            var model = new SalesBillMasterViewModel();
            //var LRBooking = _lrBookingRepository.Get(_configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
            //if (LRBooking == null)
            //{
            //    return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please add data into Transaction > Booking > LR" });
            //}
            //else
            //{
            //    model.LRBooking = LRBooking;
            //}

            model.LRNumberList = _lrBookingRepository.GetLRNumberListByLRPayTypeId(_configurationData.DefaultConnection, CurrentBranchId, 1);
            model.VehicleList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);

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

                var records = _customerInvoice.List(_configurationData.DefaultConnection, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
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

        //[HttpPost]
        //public JsonResult SaveInvoice([FromBody] SalesBillMasterViewModel model)
        //{
        //    ApiResult result = new ApiResult();
        //    try
        //    {
        //        int id = _customerInvoice.Save(model, _configurationData.DefaultConnection, CurrentFirmId, CurrentBranchId, CurrentUserId);
        //        if (id > 0)
        //        {
        //            result.data = true;
        //            result.result = Constant.API_RESULT_SUCCESS;
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = ErrorHandler.GetError(ex);
        //        result.result = Constant.API_RESULT_ERROR;
        //    }
        //    return Json(result);
        //}

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

        //[HttpGet]
        //public JsonResult GetInvoice(int id)
        //{
        //    ApiResult result = new ApiResult();
        //    try
        //    {
        //        result.data = _customerInvoice.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentBranchId);
        //        result.result = Constant.API_RESULT_SUCCESS;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = ErrorHandler.GetError(ex);
        //        result.result = Constant.API_RESULT_ERROR;
        //    }
        //    return Json(result);
        //}

        [Route("~/Customer/GetLRBookingListByDate/{fromDate}/{toDate}")]
        public JsonResult GetLRBookingListByDate(string fromDate, string toDate, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByDate(_configurationData.DefaultConnection, fromDate, toDate, CurrentBranchId, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/Customer/GetLRNumberListByLRPayTypeId/{lrPayTypeId}")]
        public JsonResult GetLRNumberListByLRPayTypeId(int lrPayTypeId)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _lrBookingRepository.GetLRNumberListByLRPayTypeId(_configurationData.DefaultConnection, CurrentBranchId, lrPayTypeId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        //[Route("~/Customer/GetListByLRNumberId/{LRNumberId}")]
        //public JsonResult GetListByLRNumberId(int LRNumberId)
        //{
        //    ApiResult result = new ApiResult();
        //    try
        //    {
        //        result.data = _lrBookingRepository.GetListByLRNumberId(_configurationData.DefaultConnection, LRNumberId, CurrentUserId, CurrentBranchId, CurrentFirmId);
        //        result.result = Constant.API_RESULT_SUCCESS;
        //    }
        //    catch (Exception ex)
        //    {
        //        result.data = ErrorHandler.GetError(ex);
        //        result.result = Constant.API_RESULT_ERROR;
        //    }
        //    return Json(result);
        //}

    }
}