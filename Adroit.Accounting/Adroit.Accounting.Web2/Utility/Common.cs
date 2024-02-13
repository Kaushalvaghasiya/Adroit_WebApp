using Adroit.Accounting.Model;
using Adroit.Accounting.Model.Enums;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.WebUtilities;
using System.Security.Claims;
using System.Security.Principal;
using System.Text.Encodings.Web;
using System.Text;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Model.ViewModel;
using Adroit.Accounting.Web.Controllers;

namespace Adroit.Accounting.Web.Utility
{
    public class Common
    {
        private static String[] units = { "Zero", "One", "Two", "Three",
                                "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Eleven",
                                "Twelve", "Thirteen", "Fourteen", "Fifteen", "Sixteen",
                                 "Seventeen", "Eighteen", "Nineteen" };
        private static String[] tens = { "", "", "Twenty", "Thirty", "Forty",
                                "Fifty", "Sixty", "Seventy", "Eighty", "Ninety" };

       
        public async static Task<(int id, string error)> RegisterCustomer(
            UserManager<IdentityUser> userManager,
            IUserStore<IdentityUser> userStore,
            IUserEmailStore<IdentityUser> emailStore,
            IEmailService emailService,
            ConfigurationData configurationData,
            HttpRequest request,
            ILogger logger,
            ICustomer customerRepository,
            Customer model
            )
        {
            int id = 0;
            string error = "";
            try
            {
                var user = await userManager.FindByNameAsync(model.Email);
                if (user != null)
                {
                    throw new Exception("This email is already associated with another account, please choose different email.");
                }

                Customer customer = customerRepository.Get(model.Email, configurationData.DefaultConnection);
                if (customer != null)
                {
                    throw new Exception("This email is already used, please choose different email.");
                }

                user = CreateUser();
                await userStore.SetUserNameAsync(user, model.Email, CancellationToken.None);
                await emailStore.SetEmailAsync(user, model.Email, CancellationToken.None);

                //Create membership user
                var res = await userManager.CreateAsync(user);
                if (res.Succeeded)
                {
                    var userId = await userManager.GetUserIdAsync(user);
                    customer = new Customer()
                    {
                        DefaultUserId = Guid.Parse(userId),
                        Name = model.Name,
                        BusinessName = model.BusinessName,
                        BusinessId = model.BusinessId,
                        Address1 = model.Address1,
                        Address2 = model.Address2,
                        Address3 = model.Address3,
                        AdharUID = model.AdharUID,
                        ContactPersonName = model.ContactPersonName,
                        Active = model.Active,
                        MobileAlternate = model.MobileAlternate,
                        Phone = model.Phone,
                        Pincode = model.Pincode,
                        TotalFirm = model.TotalFirm,
                        TotalUsers = model.TotalUsers,
                        StateId = model.StateId,
                        CityId = model.CityId,
                        Mobile = model.Mobile,
                        Email = model.Email,
                        Requirement = model.Requirement ?? "",
                        AgreeTerms = model.AgreeTerms,
                        EmailOtp = RandomNumber.SixDigigNumber(),
                        MobileOtp = RandomNumber.SixDigigNumber(),
                        CustomerType = model.CustomerType,
                        StatusId = model.StatusId,
                    };

                    try
                    {
                        id = customerRepository.Register(customer, configurationData.DefaultConnection);
                    }
                    catch (Exception ex)
                    {
                        logger.LogError(ex, "CustomerRepository.Register");

                        //Delete membership user
                        await userManager.DeleteAsync(user);

                        throw;
                    }
                    if (id > 0)
                    {
                        //send email
                        var code = await userManager.GeneratePasswordResetTokenAsync(user);
                        code = WebEncoders.Base64UrlEncode(Encoding.UTF8.GetBytes(code));

                        string url = $"{configurationData.SiteURL}/Authentication/VerifyOtpAndSetPassword?userId={userId}&code={code}";
                        var msgBody = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"EmailTemplate\OTPEmail.html"));
                        msgBody = msgBody.Replace("{Name}", !string.IsNullOrEmpty(model.Name) ? model.Name : "")
                                                .Replace("{OTP}", customer.EmailOtp)
                                                .Replace("{ResetUrl}", HtmlEncoder.Default.Encode(url));
                        emailService.SendEmail(model.Email, "Adroit Accounting System - Account Verification", msgBody);
                    }
                }
                else
                {
                    StringBuilder errors = new StringBuilder();
                    foreach (var item in res.Errors)
                    {
                        errors.AppendLine(item.Description);
                    }

                    error = string.Join(Environment.NewLine, errors.ToString());
                }
            }
            catch (Exception ex)
            {
                logger.LogError(ex, "Common.RegisterCustomer");

                error = ErrorHandler.GetError(ex);
            }

            return (id, error);
        }

        private static IdentityUser CreateUser()
        {
            try
            {
                return Activator.CreateInstance<IdentityUser>();
            }
            catch
            {
                throw new InvalidOperationException($"Can't create an instance of '{nameof(IdentityUser)}'. " +
                    $"Ensure that '{nameof(IdentityUser)}' is not an abstract class and has a parameterless constructor, or alternatively " +
                    $"override the register page in /Areas/Identity/Pages/Account/Register.cshtml");
            }
        }
        public static string GetLRPrint()
        {
                var LRPrint = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"LRPrint\LRPrint.html"));
                return LRPrint;
        }
        public static string GetChalanDetailPrint()
        {
            var ChalanDetail = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"LRPrint\ChalanDetailPrint.html"));
            return ChalanDetail;
        }
        public static string GetChalanLRDetailPrint()
        {
            var ChalanLRDetail = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"LRPrint\ChalanLRDetailPrint.html"));
            return ChalanLRDetail;
        }
        public static string GetChalanSummaryPrint()
        {
            var ChalanSummary = System.IO.File.ReadAllText(Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", @"LRPrint\ChalanSummaryPrint.html"));
            return ChalanSummary;
        }

        public static String ConvertAmount(double amount)
        {
            try
            {
                Int64 amount_int = (Int64)amount;
                Int64 amount_dec = (Int64)Math.Round((amount - (double)(amount_int)) * 100);
                if (amount_dec == 0)
                {
                    return Convert(amount_int) + " Only.";
                }
                else
                {
                    return Convert(amount_int) + " Point " + Convert(amount_dec) + " Only.";
                }
            }
            catch (Exception e)
            {
                // TODO: handle exception  
            }
            return "";
        }

        public static String Convert(Int64 i)
        {
            if (i < 20)
            {
                return units[i];
            }
            if (i < 100)
            {
                return tens[i / 10] + ((i % 10 > 0) ? " " + Convert(i % 10) : "");
            }
            if (i < 1000)
            {
                return units[i / 100] + " Hundred"
                        + ((i % 100 > 0) ? " And " + Convert(i % 100) : "");
            }
            if (i < 100000)
            {
                return Convert(i / 1000) + " Thousand "
                + ((i % 1000 > 0) ? " " + Convert(i % 1000) : "");
            }
            if (i < 10000000)
            {
                return Convert(i / 100000) + " Lakh "
                        + ((i % 100000 > 0) ? " " + Convert(i % 100000) : "");
            }
            if (i < 1000000000)
            {
                return Convert(i / 10000000) + " Crore "
                        + ((i % 10000000 > 0) ? " " + Convert(i % 10000000) : "");
            }
            return Convert(i / 1000000000) + " Arab "
                    + ((i % 1000000000 > 0) ? " " + Convert(i % 1000000000) : "");
        }
    }
}