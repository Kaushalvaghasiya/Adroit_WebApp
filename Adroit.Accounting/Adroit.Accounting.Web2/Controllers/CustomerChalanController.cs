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
    public partial class CustomerController : Controller
    {
        public IActionResult Chalan()
        {
            var model = new PurchaseBillMasterViewModel();
            int loginId = LoginHandler.GetUserId(User);

            model.CustomerFirmBranchTransportSetting = _customerFirmBranchTransportSettingRepository.GetListWithLabel_Total("0", _configurationData.DefaultConnection, loginId ,CurrentBranchId);
            model.EwayBillList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, PurchaseBillMasterTable._TableName, PurchaseBillMasterTable.EwayBillNumber);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.VehicleList = _vehicleRepo.SelectList(loginId, _configurationData.DefaultConnection);
            model.AccountBranchMappingList = _customerAccountRepo.GetCustomerAccountListWithGSTNo_MobileNo(_configurationData.DefaultConnection, loginId, CurrentBranchId);
            model.DriverList = _driverRepository.GetListWithCityId_MobileNo(_configurationData.DefaultConnection, loginId);
            model.BrokerList = _customerBrokerBranchMappingRepo.GetCustomerBrokerBranchMappingList(_configurationData.DefaultConnection, loginId, CurrentFirmId);

            return View(model);
        }

        [HttpPost]
        public JsonResult SaveChalan([FromBody] PurchaseBillMasterViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                int id = _chalanRepository.Save(model, _configurationData.DefaultConnection, CurrentFirmId, CurrentBranchId, loginId);
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
                int loginId = LoginHandler.GetUserId(User);
                var data = _chalanRepository.Get(id, _configurationData.DefaultConnection, loginId, CurrentBranchId);
                data.LRBookingList = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, id, loginId, CurrentBranchId);
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

                var records = _chalanRepository.List(_configurationData.DefaultConnection, CurrentBranchId, search, start, length, sortColumn, sortDirection).ToList();
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
                int loginId = LoginHandler.GetUserId(User);
                result.data = _chalanRepository.Delete(id, _configurationData.DefaultConnection, loginId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetLRBookingListByCity/{fromCityId}/{toCityId}")]
        public JsonResult GetLRBookingListByCity(int fromCityId, int toCityId, int draw = 0, int start = 0, int length = 10)
        {
            var result = new DataTableListViewModel<LRBookingGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _lrBookingRepository.GetLRBookingListByCity(_configurationData.DefaultConnection, fromCityId, toCityId, CurrentBranchId, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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

        [Route("~/Customer/GetLRToPayAmount/{lrNumberId}")]
        public JsonResult GetLRToPayAmount(string lrNumberId)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _customerFirmBranchTransportSettingRepository.GetListWithLabel_Total(lrNumberId, _configurationData.DefaultConnection, loginId, CurrentBranchId);
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
                int loginId = LoginHandler.GetUserId(User);
                result.data = _lrBookingRepository.GetListByPurchaseBillMasterId(_configurationData.DefaultConnection, purchaseBillMasterId, loginId, CurrentBranchId, CurrentFirmId);
                result.result = Constant.API_RESULT_SUCCESS;
            }
            catch (Exception ex)
            {
                result.data = ErrorHandler.GetError(ex);
                result.result = Constant.API_RESULT_ERROR;
            }
            return Json(result);
        }

        [Route("~/Customer/GetListByLRNumberId/{LRNumberId}")]
        public JsonResult GetListByLRNumberId(int LRNumberId)
        {
            ApiResult result = new ApiResult();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                result.data = _lrBookingRepository.GetListByLRNumberId(_configurationData.DefaultConnection, LRNumberId, loginId, CurrentBranchId, CurrentFirmId);
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