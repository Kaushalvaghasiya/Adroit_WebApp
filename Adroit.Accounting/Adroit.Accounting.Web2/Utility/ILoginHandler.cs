﻿using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Repository.IRepository;
using System.Security.Principal;

namespace Adroit.Accounting.Web.Utility
{
    public interface ILoginHandler
    {
        public Task SetupLogin(HttpContext context, int userId, string userName, string fullName, UserType userType = UserType.Customer);
        public int GetUserId(IPrincipal user);
        public int GetLoggedInFirmId(IPrincipal user);
        public int GetLoggedInBranchId(IPrincipal user);
        public int GetLoggedInYearId(IPrincipal user);
        public string GetLoggedInBranchName(int branchId, int firmId);
        public string GetLoggedInYear(int yearId, int firmId);
        public string GetUserFullName(IPrincipal user);
        public string GetUserName(IPrincipal user);
        public string GetRole(IPrincipal user);
        public bool IsBackOfficeUser(IPrincipal user);
        void ClearLoggedInFirmId(IPrincipal user);
        void ClearLoggedInBranchId(IPrincipal user);
        void ClearLoggedInYearId(IPrincipal user);
    }
}