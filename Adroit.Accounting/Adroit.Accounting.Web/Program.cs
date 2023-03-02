using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Web.Data;
using Adroit.Accounting.Web.Models;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.UI.Services;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
var connectionString = builder.Configuration.GetConnectionString("DatabaseConnectionString");
builder.Services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddDatabaseDeveloperPageExceptionFilter();

builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
    .AddEntityFrameworkStores<ApplicationDbContext>();
builder.Services.AddControllersWithViews();
builder.Services.Configure<ApplicationDbContext>(o =>
{
    o.Database.Migrate();
});
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

app.UseHttpsRedirection();
app.UseStaticFiles();

app.UseRouting();

app.UseAuthentication();
app.UseAuthorization();

app.UseEndpoints(endpoints =>
{
    endpoints.MapAreaControllerRoute(
        name: "Admin",
        areaName: "Admin",
        pattern: "Admin/{controller=CustomerAccount}/{action=Index}");

    endpoints.MapControllerRoute(
        name: "areaRoute",
        pattern: "{area:exists}/{controller}/{action}");

    endpoints.MapControllerRoute(
        name: "default",
        pattern: "{controller=Dashboard}/{action=Index}/{id?}");
});

app.MapRazorPages();

app.Run();
