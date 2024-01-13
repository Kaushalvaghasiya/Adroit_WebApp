using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : MasterController
    {
        public IActionResult Product()
        {
            var model = new ProductViewModel();

            var customerId = _customerRepository.GetCustomerIdByLoginId(CurrentUserId, _configurationData.DefaultConnection);
            var Customer = _customerRepository.Get(customerId, _configurationData.DefaultConnection);
            if (Customer == null)
            {
                return RedirectToAction("ErrorMessage", "Common", new { errMessage = "Please ask your admin to add your customer data" });
            }
            else
            {
                model.Customer = Customer;
            }

            byte SoftwareId = _softwareRepository.GetSoftwareIdFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.BranchList = _customerFirmBranchRepository.SelectListByFirmId(CurrentFirmId, _configurationData.DefaultConnection);

            model.CodeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.Code);
            model.ProductList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.Title);
            model.HSNCodeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.HSNCode);
            model.HSNDescList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.HSNDesc);
            model.RateRetailList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.RateRetail);
            model.MrpList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.Mrp);
            model.DistributorRateList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.DistributorRate);
            model.DealerRateList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.DealerRate);
            model.AveragePackList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.AveragePack);
            model.BoxPackList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.BoxPack);
            model.CentralCessList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.GstCentralCess);
            model.StateCessList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.GstStateCess);
            model.DiscountList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.Discount);
            model.CutList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.Cut);
            model.RolMinList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.RolMin);
            model.RolMaxList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.RolMax);
            model.DenierWeightList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.DenierWeight);
            model.RatePerMeterList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductTable._TableName, ProductTable.RatePerMeter);

            model.ProductDesignNumberList = _productDesignNumberRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductColorList = _productColorRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductSizeList = _productSizeRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductFabricList = _productFabricRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductStockTypeList = _stockTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductCategoryList = _productCategoryRepository.SelectList(_configurationData.DefaultConnection);
            model.GSTUQCList = _gstUQCRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductPackingList = _productPackingRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.GSTCalculationList = _gstCalculationRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductSubGroupList = _productSubGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductGroupList = _productGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductAmtCalcOnList = _productAmtCalcOnRepository.SelectList(SoftwareId, _configurationData.DefaultConnection);
            model.ProductQualityTypeList = _productQualityTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductShadeNumberList = _productShadeNumberRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.GSTRateList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult ProductList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<ProductGridViewModel>();
            try
            {
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _productRepository.List(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
                result.data = records;
                result.recordsTotal = records.Count > 0 ? records[0].TotalCount : 0;
                result.recordsFiltered = records.Count > 0 ? records[0].TotalCount : 0;
            }
            catch (Exception ex)
            {
                result.data = new List<ProductGridViewModel>();
                result.recordsTotal = 0;
                result.recordsFiltered = 0;
            }
            return Json(result);
        }

        [HttpPost]
        public JsonResult SaveProduct([FromBody] ProductViewModel model)
        {
            ApiResult result = new ApiResult();
            try
            {
                model.loginId = CurrentUserId;
                model.softwareId = _softwareRepository.GetSoftwareIdFirmId(CurrentFirmId, _configurationData.DefaultConnection);
                model.firmId = CurrentFirmId;
                int id = _productRepository.Save(model, _configurationData.DefaultConnection);
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
        public JsonResult DeleteProduct(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                _productRepository.Delete(id, CurrentFirmId, _configurationData.DefaultConnection, CurrentUserId);
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
        public JsonResult GetProduct(int id)
        {
            ApiResult result = new ApiResult();
            try
            {
                result.data = _productRepository.Get(id, _configurationData.DefaultConnection, CurrentUserId, CurrentFirmId);
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