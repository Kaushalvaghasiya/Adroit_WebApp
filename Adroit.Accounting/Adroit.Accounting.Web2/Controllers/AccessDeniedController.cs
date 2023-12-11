using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class AccessDeniedController : MasterController
    {
        private readonly ILogger<AccessDeniedController> _logger;
        public AccessDeniedController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData, ILogger<AccessDeniedController> logger)
            : base(loginHandler, userRepository, configurationData)
        {
            _logger = logger;
        }
        public async Task<IActionResult> Index()
        {
            // Clear the existing external cookie to ensure a clean login process
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);

            return View();
        }
    }
}
