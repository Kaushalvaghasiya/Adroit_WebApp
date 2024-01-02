using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult PurchaseItemWiseRegister()
        {
            PurchaseItemWiseRegisterViewModel model = new PurchaseItemWiseRegisterViewModel();

            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.InvTypeList = GenericHelper.GetInvoiceTypeList();
            model.PurchaseInoiceType = GenericHelper.GetPurchaseInvoiceType();
            model.ProductGroupList = _productGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ProductSubGroupList = _productSubGroupRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.DesignList = _productDesignNumberRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.ColourList = _productColorRepository.SelectList(CurrentFirmId, _configurationData.DefaultConnection);
            model.DescriptionList = _transportDescRepository.SelectList(_configurationData.DefaultConnection, CurrentFirmId);
            model.GSTList = _gstRateRepository.SelectList(_configurationData.DefaultConnection);
            model.ProductSizeList = _commonRepository.GetDropdownList(_configurationData.DefaultConnection, ProductSizeAdminTable._TableName, ProductSizeAdminTable.Title);

            return View(model);
        }
    }
}