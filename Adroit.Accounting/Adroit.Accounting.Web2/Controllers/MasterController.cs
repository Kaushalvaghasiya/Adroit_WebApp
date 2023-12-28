using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Mvc;
using Microsoft.CodeAnalysis.Options;
using Microsoft.Extensions.Caching.Memory;
using Microsoft.Extensions.Options;

namespace Adroit.Accounting.Web.Controllers
{
    public class MasterController : Controller
    {
        public readonly ILoginHandler _loginHandler;
        public readonly IUser _userRepository;
        public readonly ConfigurationData _configurationData;
        public MasterController(ILoginHandler loginHandler, IUser userRepository, IOptions<ConfigurationData> configurationData)
        {
            _loginHandler = loginHandler;
            _userRepository = userRepository;
            _configurationData = configurationData.Value;
        }
        public int CurrentFirmId
        {
            get
            {
                return _loginHandler.GetLoggedInFirmId(User);
            }
        }
        public int CurrentBranchId
        {
            get
            {
                return _loginHandler.GetLoggedInBranchId(User);
            }
        }
        public int CurrentUserId
        {
            get
            {
                return _loginHandler.GetUserId(User);
            }
        }
        public int CurrentYearId
        {
            get
            {
                return _loginHandler.GetLoggedInYearId(User);
            }
        }
        public void ClearCurrentFirmId()
        {
            _loginHandler.ClearLoggedInFirmId(User);
        }
        public void ClearLoggedInBranchId()
        {
            _loginHandler.ClearLoggedInBranchId(User);
        }
        public void ClearLoggedInYearId()
        {
            _loginHandler.ClearLoggedInYearId(User);
        }
    }
}