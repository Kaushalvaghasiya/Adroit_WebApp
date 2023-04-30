using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;

namespace Adroit.Accounting.Web.Controllers
{
    public class AccessDeniedController : Controller
    {
        private readonly ILogger<AccessDeniedController> _logger;
        public AccessDeniedController(ILogger<AccessDeniedController> logger)
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
