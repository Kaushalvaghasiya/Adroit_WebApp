using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerController : Controller
    {
        public IActionResult Product()
        {
            var model = new ProductViewModel();

            int loginId = LoginHandler.GetUserId(User);
            model.Customer = _customerRepository.Get(loginId, _configurationData.DefaultConnection);
            byte SoftwareId = _softwareRepository.GetSoftwareIdByLoginId(loginId, _configurationData.DefaultConnection);
            model.BranchList = _customerFirmBranchRepository.SelectList(model.Customer.Id, true, _configurationData.DefaultConnection);

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

            model.ProductDesignNumberList = _productDesignNumberRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductColorList = _productColorRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductSizeList = _productSizeRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductFabricList = _productFabricRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductStockTypeList = _stockTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductCategoryList = _productCategoryRepository.SelectList(_configurationData.DefaultConnection);
            model.GSTUQCList = _gstUQCRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductPackingList = _productPackingRepository.SelectList(_configurationData.DefaultConnection);
            model.GSTCalculationList = _gstCalculationRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductSubGroupList = _productSubGroupRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductGroupList = _productGroupRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductAmtCalcOnList = _productAmtCalcOnRepository.SelectList(SoftwareId, _configurationData.DefaultConnection);
            model.ProductQualityTypeList = _productQualityTypeRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductShadeNumberList = _productShadeNumberRepository.SelectList(_configurationData.DefaultConnection);
            model.GSTRateList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);

            return View(model);
        }

        [HttpGet]
        public JsonResult ProductList(int draw = 0, int start = 0, int length = 10, int firmId = 0)
        {
            var result = new DataTableListViewModel<ProductGridViewModel>();
            try
            {
                int loginId = LoginHandler.GetUserId(User);
                //// note: we only sort one column at a time
                var search = Request.Query["search[value]"];
                var sortColumn = int.Parse(Request.Query["order[0][column]"]);
                var sortDirection = Request.Query["order[0][dir]"];

                var records = _productRepository.List(_configurationData.DefaultConnection, loginId, CurrentFirmId, search, start, length, sortColumn, sortDirection).ToList();
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
                model.loginId = LoginHandler.GetUserId(User);
                model.softwareId = _softwareRepository.GetSoftwareIdByLoginId(model.loginId, _configurationData.DefaultConnection);

                int id = _productRepository.Save(model, _configurationData.DefaultConnection, CurrentFirmId);
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
                int loginId = LoginHandler.GetUserId(User);
                _productRepository.Delete(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
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
                int loginId = LoginHandler.GetUserId(User);
                result.data = _productRepository.Get(id, _configurationData.DefaultConnection, loginId, CurrentFirmId);
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