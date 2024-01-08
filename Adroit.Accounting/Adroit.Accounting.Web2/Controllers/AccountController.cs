using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AccountController : MasterController
    {
        private readonly ICommon _commonRepository;
        private readonly ICustomerAccountBranchMapping _customerAccountBranchMapping;
        private readonly ICustomerBook _customerBookRepository;
        private readonly ICustomerInvoice _customerInvoice;

        public AccountController(
            ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData,
            ICommon commonRepository,
            ICustomerAccountBranchMapping customerAccountBranchMapping,
            ICustomerBook customerBookRepository, 
            ICustomerInvoice customerInvoice) 
            : base(loginHandler, userRepository, configurationData)
        {
            _commonRepository = commonRepository;
            _customerAccountBranchMapping = customerAccountBranchMapping;
            _customerBookRepository = customerBookRepository;
            _customerInvoice = customerInvoice;
        }
        [HttpGet]
        public JsonResult InvoiceList()
        {
            ApiResult result = new ApiResult();
            try
            {
                var data = _customerInvoice.SelectList(_configurationData.DefaultConnection, CurrentUserId, CurrentFirmId, CurrentBranchId).ToList();
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
    }
}
