using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Options;
using System.Data;

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
        public AdminController(
           IOptions<ConfigurationData> configurationData,
           IBookAdmin bookAdminRepo,
           IAccountAdmin accountAdminRepo,
           IBillTypeAdmin billTypeAdminRepo,
           IBillEntryTypeAdmin billEntryTypeAdminRepo,
           ICustomer customerRepo,
           ICustomerFirm customerFirmRepo,
           ICustomerFirmBranch customerFirmBranchRepo
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
        }
    }
}