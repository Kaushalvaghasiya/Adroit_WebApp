using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;
using System.Security.Claims;
using System.Security.Principal;

namespace Adroit.Accounting.Web.Utility
{
    public class LoginHandler : ILoginHandler
    {
        public readonly ICustomerFirm _customerFirmRepository;
        public readonly ICustomerFirmBranch _customerFirmBranchRepository;
        private readonly IMemoryCache? _memoryCache = null;
        public readonly ConfigurationData _configurationData;
        public readonly IUser _userRepository;
        public LoginHandler(IMemoryCache memoryCache,
            ICustomerFirm customerFirmRepository,
            ICustomerFirmBranch customerFirmBranchRepository,
            IUser userRepository,
            IOptions<ConfigurationData> configurationData)
        {
            _memoryCache = memoryCache;
            _customerFirmRepository = customerFirmRepository;
            _customerFirmBranchRepository = customerFirmBranchRepository;
            _userRepository = userRepository;
            _configurationData = configurationData.Value;
        }
        public async Task SetupLogin(HttpContext context, int userId, string userName, string fullName, UserType userType = UserType.Customer)
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
        public int GetUserId(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.SerialNumber);
            if (null != claim)
            {
                return Convert.ToInt32(claim.Value);
            }

            return 0;
        }
        public int GetLoggedInFirmId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheFirmId-{userid}";
            int firmId = 0;
            _memoryCache.TryGetValue(key, out firmId);

            if (firmId == 0)
            {
                firmId = _userRepository.GetLoggedInFirmId(userid, _configurationData.DefaultConnection);

                _memoryCache.Set(key, firmId);
            }

            return firmId;
        }
        public int GetLoggedInBranchId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheBrachId-{userid}";
            int branchId = 0;
            _memoryCache.TryGetValue(key, out branchId);

            if (branchId == 0)
            {
                branchId = _userRepository.GetLoggedInBranchId(userid, _configurationData.DefaultConnection);

                //var cacheEntryOptions = new MemoryCacheEntryOptions().SetSlidingExpiration(TimeSpan.FromSeconds(30));
                _memoryCache.Set(key, branchId);
            }

            return branchId;
        }
        public int GetLoggedInYearId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheYearId-{userid}";
            int yearId = 0;
            _memoryCache.TryGetValue(key, out yearId);

            if (yearId == 0)
            {
                yearId = _userRepository.GetLoggedInYearId(userid, _configurationData.DefaultConnection) ?? 0;

                //var cacheEntryOptions = new MemoryCacheEntryOptions().SetSlidingExpiration(TimeSpan.FromSeconds(30));
                _memoryCache.Set(key, yearId);
            }

            return yearId;
        }
        public string GetLoggedInBranchName(int branchId, int firmId)
        {
            var key = $"CacheBrachName-{branchId}";
            string branchName = "";
            _memoryCache.TryGetValue(key, out branchName);

            if (string.IsNullOrWhiteSpace(branchName))
            {
                branchName = _customerFirmBranchRepository.Get(branchId, firmId, _configurationData.DefaultConnection)?.Title ?? "";

                //var cacheEntryOptions = new MemoryCacheEntryOptions().SetSlidingExpiration(TimeSpan.FromSeconds(30));
                _memoryCache.Set(key, branchName);
            }

            return branchName;
        }
        public string GetLoggedInYear(int yearId, int firmId)
        {
            var key = $"CacheYear-{yearId}-{firmId}";
            string year = "";
            _memoryCache.TryGetValue(key, out year);

            if (string.IsNullOrWhiteSpace(year))
            {
                year = _customerFirmRepository.GetYear(yearId, firmId, _configurationData.DefaultConnection)?.Title ?? "";

                //var cacheEntryOptions = new MemoryCacheEntryOptions().SetSlidingExpiration(TimeSpan.FromSeconds(30));
                _memoryCache.Set(key, year);
            }

            return year;
        }
        public void ClearLoggedInFirmId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheFirmId-{userid}";
            _memoryCache?.Remove(key);
        }
        public void ClearLoggedInBranchId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheBrachId-{userid}";
            _memoryCache?.Remove(key);
        }
        public void ClearLoggedInYearId(IPrincipal user)
        {
            int userid = GetUserId(user);
            var key = $"CacheYearId-{userid}";
            _memoryCache?.Remove(key);
        }

        public string GetUserFullName(IPrincipal user)
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
        public string GetUserName(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.Name);
            if (null != claim)
            {
                return claim.Value;
            }

            return "";
        }
        public string GetRole(IPrincipal user)
        {
            var claim = (user.Identity as ClaimsIdentity)?.Claims.ToList().FirstOrDefault(p => p.Type == ClaimTypes.Role);
            if (null != claim)
            {
                return claim.Value;
            }

            return "";
        }
        public bool IsBackOfficeUser(IPrincipal user)
        {
            return (UserType)Convert.ToInt32(GetRole(user)) == UserType.BackOffice;
        }

    }
}