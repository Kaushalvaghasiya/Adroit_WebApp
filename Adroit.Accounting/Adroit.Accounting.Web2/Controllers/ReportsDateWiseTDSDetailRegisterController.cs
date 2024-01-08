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
        public IActionResult DateWiseTDSDetailRegister()
        {
            DateWiseTDSDetailRegisterViewModel model = new DateWiseTDSDetailRegisterViewModel();
            model.BranchList = _customerFirmBranchRepository.SelectListWithFirmByFirmId(CurrentFirmId, _configurationData.DefaultConnection);
            model.BankBookList = _customerBookRepository.SelectList(CurrentBranchId, _configurationData.DefaultConnection);
            model.BillPartyList = _customerAccountBranchMapping.GetCustomerAccountBranchMappingList(CurrentFirmId, CurrentBranchId, _configurationData.DefaultConnection);
            model.ViewList = GenericHelper.GetDateWiseTDSDetailViewList();
            model.TransactionTypeViewList = GenericHelper.GetTransactionTypeViewList();
            return View(model);
        }
    }
}