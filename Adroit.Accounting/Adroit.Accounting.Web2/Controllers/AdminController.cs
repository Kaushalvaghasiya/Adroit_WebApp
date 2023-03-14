using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Model.Master;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.Extensions.Options;
using System.Data;

namespace Adroit.Accounting.Web.Controllers
{
    public partial class AdminController : Controller
    {
        protected readonly ICustomerAccountRepository _customerAccountRepo;
        protected readonly ICustomerBrokerBranchMappingRepository _customerBrokerBranchMappingRepo;
        protected readonly ICustomerAccountGroupRepository _customerAccountGroupRepo;
        protected readonly ConfigurationData _configurationData;
        private readonly IEmailService _emailService;
        public AdminController(ICustomerAccountRepository customerAccountRepo, 
                IOptions<ConfigurationData> configurationData,
                IEmailService emailService,
                ICustomerBrokerBranchMappingRepository customerBrokerBranchMappingRepo, 
                ICustomerAccountGroupRepository customerAccountGroupRepo)
        {
            _customerAccountRepo = customerAccountRepo;
            _configurationData = configurationData.Value;
            _emailService = emailService;
            _customerBrokerBranchMappingRepo = customerBrokerBranchMappingRepo;
            _customerAccountGroupRepo = customerAccountGroupRepo;
        }
    }
}
