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
        public IActionResult CashBook()
        {
            CashBookViewModel model = new CashBookViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.CashBookList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.PartyList = _customerAccountRepo.GetCustomerAccountBranchMappingList_Select(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            
            return View(model);
        }
    }
}