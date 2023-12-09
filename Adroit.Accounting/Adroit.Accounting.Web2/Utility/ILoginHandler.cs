using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Repository.IRepository;
using System.Security.Principal;

namespace Adroit.Accounting.Web.Utility
{
    public interface ILoginHandler
    {
        public Task SetupLogin(HttpContext context, int userId, string userName, string fullName, UserType userType = UserType.Customer);
        public int GetUserId(IPrincipal user);
        public int GetLoggedInFirmId(IPrincipal user, IUser userRepository, string connectionString);
        public int GetLoggedInBranchId(IPrincipal user, IUser userRepository, string connectionString);
        public string GetUserFullName(IPrincipal user);
        public string GetUserName(IPrincipal user);
        public string GetRole(IPrincipal user);
        public bool IsBackOfficeUser(IPrincipal user);
    }
}