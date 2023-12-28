using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Model.ReportViewModel;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.SQL.Tables;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class CustomerReportController : MasterController
    {
        public IActionResult LRDeliveryChalanLoading()
        {
            LRDeliveryChalanLoadingViewModel model = new LRDeliveryChalanLoadingViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetViewList();
            model.ChalanList = _chalanRepository.GetChalanListByBranchId_Select(_configurationData.DefaultConnection, CurrentBranchId);
            model.CityList = _transportLRBranchCityMappingRepository.SelectList(_configurationData.DefaultConnection, CurrentBranchId);
            model.VehicleNumberList = _vehicleRepo.SelectList(CurrentUserId, _configurationData.DefaultConnection);
            
            return View(model);
        }
    }
}