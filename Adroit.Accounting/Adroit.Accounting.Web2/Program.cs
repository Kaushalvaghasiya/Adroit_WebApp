using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Adroit.Accounting.Web.Data;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using System.Net;
using NLog.Web;
using NLog;
using Adroit.Accounting.Web2.Utility;
using Adroit.Accounting.Model;
using Adroit.Accounting.Utility;
using System;

var logger = NLog.LogManager.Setup().LoadConfigurationFromAppSettings().GetCurrentClassLogger();
logger.Debug("init main");

try
{
    var builder = WebApplication.CreateBuilder(args);

    // NLog: Setup NLog for Dependency injection
    builder.Logging.ClearProviders();
    builder.Host.UseNLog();

    // Add services to the container.
    var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
    builder.Services.AddDbContext<ApplicationDbContext>(options =>
        options.UseSqlServer(connectionString));
    builder.Services.AddDatabaseDeveloperPageExceptionFilter();

    builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
        .AddEntityFrameworkStores<ApplicationDbContext>();
    builder.Services.AddControllersWithViews();

    builder.Services.Configure<ConfigurationData>(builder.Configuration.GetSection("ConnectionStrings"));
    builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));
    builder.Services.AddSingleton<IEmailService, EmailService>();
    builder.Services.AddSingleton<ICountry, Adroit.Accounting.Repository.CountryRepository>();
    builder.Services.AddSingleton<IState, Adroit.Accounting.Repository.StateRepository>();
    builder.Services.AddSingleton<ICity, Adroit.Accounting.Repository.CityRepository>();
    builder.Services.AddSingleton<IDistrict, Adroit.Accounting.Repository.DistrictRepository>();
    builder.Services.AddSingleton<ITaluka, Adroit.Accounting.Repository.TalukaRepository>();
    builder.Services.AddSingleton<ICustomer, Adroit.Accounting.Repository.CustomerRepository>();
    builder.Services.AddSingleton<ICustomerAccount, Adroit.Accounting.Repository.CustomerAccountRepository>();
    builder.Services.AddSingleton<ICustomerAccountGroup, Adroit.Accounting.Repository.CustomerAccountGroupRepository>();
    builder.Services.AddSingleton<IGSTInvoiceType, Adroit.Accounting.Repository.GSTInvoiceTypeRepository>();
    builder.Services.AddSingleton<ICustomerBrokerBranchMapping, Adroit.Accounting.Repository.CustomerBrokerBranchMappingRepository>();
    builder.Services.AddSingleton<IBusiness, Adroit.Accounting.Repository.BusinessRepository>();

    if (!builder.Environment.IsDevelopment())
    {
        builder.Services.AddHttpsRedirection(options =>
        {
            options.RedirectStatusCode = (int)HttpStatusCode.PermanentRedirect;
            options.HttpsPort = 443;
        });
    }

    //builder.Services.AddSingleton<UserManager>();

    // If you don't want the cookie to be automatically authenticated and assigned HttpContext.User, 
    // remove the CookieAuthenticationDefaults.AuthenticationScheme parameter passed to AddAuthentication.
    builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
        .AddCookie(options =>
        {
            options.LoginPath = "/LogIn";
            options.LogoutPath = "/Account/LogOff";
            options.AccessDeniedPath = "/AccessDenied";
        });

    var app = builder.Build();

    // Configure the HTTP request pipeline.
    if (app.Environment.IsDevelopment())
    {
        app.UseMigrationsEndPoint();
    }
    else
    {
        app.UseExceptionHandler("/Home/Error");
        // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
        app.UseHsts();
    }

    // Run SQL Changes 
    Adroit.Accounting.SQL.SQLMigrate.ExecuteSQL(connectionString);

    app.ConfigureExceptionHandler(logger);

    app.UseHttpsRedirection();
    app.UseStaticFiles();

    app.UseRouting();

    app.UseAuthentication();
    app.UseAuthorization();

    app.MapControllerRoute(
        name: "default",
        pattern: "{controller=Home}/{action=Index}/{id?}");
    app.MapRazorPages();

    app.Run();

}
catch (Exception ex)
{
    // NLog: catch setup errors
    logger.Error(ex, "Stopped program because of exception");
    throw;

}
finally
{
    // Ensure to flush and stop internal timers/threads before application-exit (Avoid segmentation fault on Linux)
    NLog.LogManager.Shutdown();

}