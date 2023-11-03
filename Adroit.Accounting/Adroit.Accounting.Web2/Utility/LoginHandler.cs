using Adroit.Accounting.Model.Enums;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Security.Claims;
using System.Security.Principal;

namespace Adroit.Accounting.Web.Utility
{
    public class LoginHandler
    {
        public static async Task SetupLogin(HttpContext context, int userId, string userName, string fullName, UserType userType = UserType.Customer)
        {
            var claims = new List<Claim>
                    {
                        new Claim(ClaimTypes.SerialNumber, $"{userId}"),
                        new Claim(ClaimTypes.Name, userName),
                        new Claim(ClaimTypes.GivenName, string.IsNullOrWhiteSpace(fullName)?userName:fullName),
                        new Claim(ClaimTypes.Role, $"{userType}"),
                    };

            var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
            var authProperties = new AuthenticationProperties
            {
                //AllowRefresh = <bool>, // Refreshing the authentication session should be allowed.
                //ExpiresUtc = DateTimeOffset.UtcNow.AddMinutes(10), // The time at which the authentication ticket expires. A value set here overrides the ExpireTimeSpan option of CookieAuthenticationOptions set with AddCookie.
                //IsPersistent = true, // Whether the authentication session is persisted across multiple requests. When used with cookies, controls whether the cookie's lifetime is absolute (matching the lifetime of the authentication ticket) or session-based.
                //IssuedUtc = <DateTimeOffset>, The time at which the authentication ticket was issued.
                //RedirectUri = <string> // The full path or absolute URI to be used as an http redirect response value.
            };

            await context.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity), authProperties);
        }

        public static int GetUserId(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.SerialNumber);
            if (null != claim)
            {
                return Convert.ToInt32(claim.Value);
            }

            return 0;
        }

        public static int GetFirmId(IPrincipal user)
        {
            //var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.SerialNumber);
            //if (null != claim)
            //{
            //    return Convert.ToInt32(claim.Value);
            //}

            return 0;
        }
        public static int GetBranchId(IPrincipal user)
        {
            //var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.SerialNumber);
            //if (null != claim)
            //{
            //    return Convert.ToInt32(claim.Value);
            //}

            return 1;
        }

        public static string GetUserFullName(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.GivenName);
            if (null != claim)
            {
                return claim.Value;
            }

            return "";
        }

        public static string GetDisplayName(IPrincipal user, int? characters = null)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.GivenName);
            if (null != claim)
            {
                string title = claim.Value.Split(' ')[0].Trim();
                if (characters.HasValue && title.Length > characters.Value)
                {
                    return title.Substring(0, characters.Value).Trim();
                }

                return title;
            }

            return "";
        }

        public static string GetUserName(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.Name);
            if (null != claim)
            {
                return claim.Value;
            }

            return "";
        }

        public static string GetRole(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.Role);
            if (null != claim)
            {
                return claim.Value;
            }

            return "";
        }

        public static bool IsBackOfficeUser(IPrincipal user)
        {
            return (UserType)Convert.ToInt32(GetRole(user)) == UserType.BackOffice;
        }
    }
}