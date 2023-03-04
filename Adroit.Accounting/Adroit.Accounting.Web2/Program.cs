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

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DefaultConnection");
builder.Services.AddDbContext<ApplicationDbContext>(options =>
    options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddControllersWithViews();

builder.Services.Configure<ConfigurationData>(builder.Configuration.GetSection("ConnectionStrings"));
builder.Services.Configure<EmailSetup>(builder.Configuration.GetSection("EmailSetup"));
builder.Services.AddSingleton<ICountryRepository, CountryRepository>();
builder.Services.AddSingleton<IStateRepository, StateRepository>();
builder.Services.AddSingleton<ICityRepository, CityRepository>();
builder.Services.AddSingleton<IDistrictRepository, DistrictRepository>();
builder.Services.AddSingleton<ITalukaRepository, TalukaRepository>();
builder.Services.AddSingleton<ICustomerRepository, CustomerRepository>();
builder.Services.AddSingleton<ICustomerAccountRepository, CustomerAccountRepository>();
builder.Services.AddSingleton<ICustomerAccountGroupRepository, CustomerAccountGroupRepository>();
builder.Services.AddSingleton<IGSTInvoiceTypeRepository, GSTInvoiceTypeRepository>();
builder.Services.AddSingleton<ICustomerBrokerBranchMappingRepository, CustomerBrokerBranchMappingRepository>();
builder.Services.AddSingleton<IBusinessRepository, BusinessRepository>();

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

var logger = NLog.LogManager.Setup().LoadConfigurationFromAppSettings().GetCurrentClassLogger();
try
{
    // Run SQL Changes 
    Adroit.Accounting.SQL.SQLMigrate.ExecuteSQL(connectionString);
}
catch (Exception exception)
{
    logger.Debug("init main");
    logger.Error(exception, "Stopped program because of exception");
}
finally
{
    NLog.LogManager.Shutdown();
}

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
