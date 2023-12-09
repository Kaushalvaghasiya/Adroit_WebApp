using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : MasterController
    {
        public IActionResult GSTInvoiceType()
        {
            var model = new GSTInvoiceTypeViewModel();
            model.TitleList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.Title);
            model.TitleB2BList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.TitleB2B);
            model.TitleEinvoiceList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.TitleEinvoice);
            model.TitleCDNURList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.TitleCDNUR);
            model.PayTypeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.PayType);
            model.OrderNumberList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, GSTInvoiceTypeTable._TableName, GSTInvoiceTypeTable.OrderNumber);

            return View(model);
        }

        [HttpGet]
        public JsonResult GSTInvoiceTypeList(int draw = 0, int start = 0, int length = 10, int customerId = 0)
        {
            var result = new DataTableListViewModel<GSTInvoiceTypeGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];
                var records = _gstInvoiceTypeRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<GSTInvoiceTypeGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveGSTInvoiceType([FromBody] GSTInvoiceType model)
        {
            ApiResult result = new ApiResult();
            try
            {
                //we need add user Id
                //var UserId = Adroit.Accounting.Web.Utility.LoginHandler.GetUserId(User);

                int id = _gstInvoiceTypeRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult GetGSTInvoiceType(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _gstInvoiceTypeRepository.Get(id, _configurationData.DefaultConnection);
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