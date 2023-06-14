using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        protected readonly IBookAdmin _bookAdminRepository;
        protected readonly IAccountAdmin _accountAdminRepository;
        protected readonly ICustomer _customerRepository;
        protected readonly IBillTypeAdmin _billTypeAdminRepository;
        protected readonly IBillEntryTypeAdmin _billEntryTypeAdminRepository;
        protected readonly ConfigurationData _configurationData;
        protected readonly ICustomerFirm _customerFirmRepository;
        protected readonly ICustomerFirmBranch _customerFirmBranchRepository;
        protected readonly ICustomerUser _customerUserRepository;
        private readonly IEmailService _emailService;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly IUserStore<IdentityUser> _userStore;
        private readonly IUserEmailStore<IdentityUser> _emailStore;
        private readonly ISoftware _softwareRepository;
        private readonly ISoftwarePlan _softwarePlanRepository;
        private ICommon _commonRepository;

        public AdminController(
            IOptions<ConfigurationData> configurationData,
            IBookAdmin bookAdminRepository,
            IAccountAdmin accountAdminRepository,
            IBillTypeAdmin billTypeAdminRepository,
            IBillEntryTypeAdmin billEntryTypeAdminRepository,
            ICustomer customerRepository,
            ICustomerFirm customerFirmRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            ICustomerUser customerUserRepository,
            IEmailService emailService,
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            ISoftware softwareRepository,
            ISoftwarePlan softwarePlanRepository,
            ICommon commonRepository
            )

        {
            _configurationData = configurationData.Value;
            _bookAdminRepository = bookAdminRepository;
            _accountAdminRepository = accountAdminRepository;
            _customerRepository = customerRepository;
            _billTypeAdminRepository = billTypeAdminRepository;
            _billEntryTypeAdminRepository = billEntryTypeAdminRepository;
            _customerFirmRepository = customerFirmRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _customerUserRepository = customerUserRepository;
            _userManager = userManager;
            _emailService = emailService;
            _userStore = userStore;
            _emailStore = GetEmailStore();
            _softwareRepository = softwareRepository;
            _softwarePlanRepository = softwarePlanRepository;
            _commonRepository = commonRepository;
        }
    }
}