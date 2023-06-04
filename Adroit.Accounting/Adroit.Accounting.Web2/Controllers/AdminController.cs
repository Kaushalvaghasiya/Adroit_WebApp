using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        protected readonly IBookAdmin BookAdminRepo;
        protected readonly IAccountAdmin AccountAdminRepo;
        protected readonly ICustomer CustomerRepo;
        protected readonly IBillTypeAdmin BillTypeAdminRepo;
        protected readonly IBillEntryTypeAdmin BillEntryTypeAdminRepo;
        protected readonly ConfigurationData ConfigurationData;
        protected readonly ICustomerFirm CustomerFirmRepo;
        protected readonly ICustomerFirmBranch CustomerFirmBranchRepo;
        protected readonly ICustomerUser CustomerUserRepo;
        private readonly IEmailService EmailService;
        private readonly UserManager<IdentityUser> UserManager;
        private readonly IUserStore<IdentityUser> UserStore;
        private readonly IUserEmailStore<IdentityUser> EmailStore;
        private readonly ISoftwareType SoftwareTypeRepo;
        private readonly ISoftwarePlan softwarePlanRepo;

        public AdminController(
           IOptions<ConfigurationData> configurationData,
           IBookAdmin bookAdminRepo,
           IAccountAdmin accountAdminRepo,
           IBillTypeAdmin billTypeAdminRepo,
           IBillEntryTypeAdmin billEntryTypeAdminRepo,
           ICustomer customerRepo,
           ICustomerFirm customerFirmRepo,
           ICustomerFirmBranch customerFirmBranchRepo,
           ICustomerUser customerUserRepo,
           IEmailService emailService,
           UserManager<IdentityUser> userManager,
           IUserStore<IdentityUser> userStore,
           ISoftwareType softwareType,
           ISoftwarePlan softwarePlan

            )

        {
            ConfigurationData = configurationData.Value;
            BookAdminRepo = bookAdminRepo;
            AccountAdminRepo = accountAdminRepo;
            CustomerRepo = customerRepo;
            BillTypeAdminRepo = billTypeAdminRepo;
            BillEntryTypeAdminRepo = billEntryTypeAdminRepo;
            CustomerFirmRepo = customerFirmRepo;
            CustomerFirmBranchRepo = customerFirmBranchRepo;
            CustomerUserRepo = customerUserRepo;
            UserManager = userManager;
            EmailService = emailService;
            UserStore = userStore;
            EmailStore = GetEmailStore();
            SoftwareTypeRepo = softwareType;
            softwarePlanRepo = softwarePlan;
        }
    }
}