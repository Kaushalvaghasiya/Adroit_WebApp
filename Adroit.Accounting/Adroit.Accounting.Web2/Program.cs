using Adroit.Accounting.Model;
using Adroit.Accounting.Repository;
using Adroit.Accounting.Repository.IRepository;
using Adroit.Accounting.Utility;
using Adroit.Accounting.Web.Data;
using Adroit.Accounting.Web.Models;
using Adroit.Accounting.Web.Utility;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Localization;
using Microsoft.EntityFrameworkCore;
using NLog;
using NLog.Web;
using System.Globalization;
using System.Net;

var logger = LogManager.Setup().LoadConfigurationFromAppSettings().GetCurrentClassLogger();
logger.Debug("init main");

try
{
    var defaultCulture = new CultureInfo("en-GB");
    Thread.CurrentThread.CurrentCulture = defaultCulture;

    var builder = WebApplication.CreateBuilder(args);

    // NLog: Setup NLog for Dependency injection
    builder.Logging.ClearProviders();
    builder.Host.UseNLog();

    // Add services to the container.
    var connectionString = builder.Configuration.GetSection("ConfigurationData").GetValue<string>("DefaultConnection");
    builder.Services.AddDbContext<ApplicationDbContext>(options => options.UseSqlServer(connectionString));
    builder.Services.AddDatabaseDeveloperPageExceptionFilter();

    builder.Services.AddDefaultIdentity<IdentityUser>(options => options.SignIn.RequireConfirmedAccount = true)
        .AddEntityFrameworkStores<ApplicationDbContext>();
    builder.Services.AddAuthorization(options =>
    {
        // By default, all incoming requests will be authorized according to the default policy.
        options.FallbackPolicy = options.DefaultPolicy;
    });

    builder.Services
        .AddControllersWithViews()
        .AddJsonOptions(options =>
    {
        options.JsonSerializerOptions.Converters.Add(new CustomDateTimeConverter());
    });

    builder.Services.Configure<ConfigurationData>(builder.Configuration.GetSection("ConfigurationData"));
    builder.Services.Configure<EmailSettings>(builder.Configuration.GetSection("EmailSettings"));
    builder.Services.AddSingleton<IEmailService, EmailService>();
    builder.Services.AddSingleton<IUser, UserRepository>();
    builder.Services.AddSingleton<ICountry, CountryRepository>();
    builder.Services.AddSingleton<IVehicle, VehicleRepository>();
    builder.Services.AddSingleton<IVehicleModel, VehicleModelRepository>();
    builder.Services.AddSingleton<IVehicleOwner, VehicleOwnerRepository>();
    builder.Services.AddSingleton<IState, StateRepository>();
    builder.Services.AddSingleton<ICity, CityRepository>();
    builder.Services.AddSingleton<IDistrict, DistrictRepository>();
    builder.Services.AddSingleton<ITaluka, TalukaRepository>();
    builder.Services.AddSingleton<ICustomer, CustomerRepository>();
    builder.Services.AddSingleton<ICustomerAccount, CustomerAccountRepository>();
    builder.Services.AddSingleton<ICustomerAccountOpeningBalance, CustomerAccountOpeningBalanceRepository>();
    builder.Services.AddSingleton<ICustomerAccountGroup, CustomerAccountGroupRepository>();
    builder.Services.AddSingleton<ICustomerBrokerBranchMapping, CustomerBrokerBranchMappingRepository>();
    builder.Services.AddSingleton<IBusiness, BusinessRepository>();
    builder.Services.AddSingleton<IBookAdmin, BookAdminRepository>();
    builder.Services.AddSingleton<IAccountGroupHeaderAdmin, AccountGroupHeaderAdminRepository>();
    builder.Services.AddSingleton<IAccountGroupType, AccountGroupTypeRepository>();
    builder.Services.AddSingleton<IAccountAdmin, AccountAdminRepository>();
    builder.Services.AddSingleton<IAccountGroupAdmin, AccountGroupAdminRepository>();
    builder.Services.AddSingleton<IBillTypeAdmin, BillTypeAdminRepository>();
    builder.Services.AddSingleton<IBillEntryTypeAdmin, BillEntryTypeAdminRepository>();
    builder.Services.AddSingleton<IAdminCustomerFirm, AdminCustomerFirmRepository>();
    builder.Services.AddSingleton<IFirmType, FirmTypeRepository>();
    builder.Services.AddSingleton<IGSTFirmType, GSTFirmTypeRepository>();
    builder.Services.AddSingleton<ISoftware, SoftwareRepository>();
    builder.Services.AddSingleton<IAdminCustomerFirmBranch, AdminCustomerFirmBranchRepository>();
    builder.Services.AddSingleton<IAdminCustomerBranchToBranchMapping, AdminCustomerBranchToBranchMappingRepository>();
    builder.Services.AddSingleton<IBranchTypeAdmin, BranchTypeAdminRepository>();
    builder.Services.AddSingleton<IAdminCustomerUser, AdminCustomerUserRepository>();
    builder.Services.AddSingleton<ICustomerAccountGroupHeader, CustomerAccountGroupHeaderRepository>();
    builder.Services.AddSingleton<ISoftwarePlan, SoftwarePlanRepository>();
    builder.Services.AddSingleton<ICommon, CommonRepository>();
    builder.Services.AddSingleton<IBranchTypeAdmin, BranchTypeAdminRepository>();
    builder.Services.AddSingleton<IGSTCollection, GSTCollectionRepository>();
    builder.Services.AddSingleton<IColor, ColorRepository>();
    builder.Services.AddSingleton<IProductSizeAdmin, ProductSizeAdminRepository>();
    builder.Services.AddSingleton<IMenuSetting, MenuSettingRepository>();
    builder.Services.AddSingleton<IBoxSetting, BoxSettingRepository>();
    builder.Services.AddSingleton<IProductAmtCalcOn, ProductAmtCalcOnRepository>();
    builder.Services.AddSingleton<IProductStockType, ProductStockTypeRepository>();
    builder.Services.AddSingleton<IProductQualityType, ProductQualityTypeRepository>();
    builder.Services.AddSingleton<IBookTypeAdmin, BookTypeAdminRepository>();
    builder.Services.AddSingleton<IGSTRate, GSTRateRepository>();
    builder.Services.AddSingleton<IGSTInvoiceType, GSTInvoiceTypeRepository>();
    builder.Services.AddSingleton<IGSTPort, GSTPortRepository>();
    builder.Services.AddSingleton<ITransportPackingAdmin, TransportPackingAdminRepository>();
    builder.Services.AddSingleton<ISalesBillFromAdmin, SalesBillFromAdminRepository>();
    builder.Services.AddSingleton<ITransportPacking, TransportPackingRepository>();
    builder.Services.AddSingleton<IBroker, BrokerRepository>();
    builder.Services.AddSingleton<IDriver, DriverRepository>();
    builder.Services.AddSingleton<ICustomerFirmBranchTransportContractRateSetting, CustomerFirmBranchTransportContractRateSettingRepository>();
    builder.Services.AddSingleton<ITransportDesc, TransportDescRepository>();
    builder.Services.AddSingleton<IProductSize, ProductSizeRepository>();
    builder.Services.AddSingleton<IProductColor, ProductColorRepository>();
    builder.Services.AddSingleton<IProductFabric, ProductFabricRepository>();
    builder.Services.AddSingleton<IProductGroup, ProductGroupRepository>();
    builder.Services.AddSingleton<IProductSubGroup, ProductSubGroupRepository>();
    builder.Services.AddSingleton<IProductDesignNumber, ProductDesignNumberRepository>();
    builder.Services.AddSingleton<IDriverTypeAdmin, DriverTypeAdminRepository>();
    builder.Services.AddSingleton<IProductShadeNumber, ProductShadeNumberRepository>();
    builder.Services.AddSingleton<IProductPacking, ProductPackingRepository>();
    builder.Services.AddSingleton<ITransportDescAdmin, TransportDescAdminRepository>();
    builder.Services.AddSingleton<ITransportLRCharges, TransportLRChargesRepository>();
    builder.Services.AddSingleton<ILRBookingRange, LRBookingRangeRepository>();
    builder.Services.AddSingleton<ICustomerFirm, CustomerFirmRepository>();
    builder.Services.AddSingleton<ICustomerUser, CustomerUserRepository>();
    builder.Services.AddSingleton<ICustomerFirmBranch, CustomerFirmBranchRepository>();
    builder.Services.AddSingleton<ICustomerFirmBranchLRRate, CustomerFirmBranchLRRateRepository>();
    builder.Services.AddSingleton<IProduct, ProductRepository>();
    builder.Services.AddSingleton<IProductCategory, ProductCategoryRepository>();
    builder.Services.AddSingleton<IGSTUQC, GSTUQCRepository>();
    builder.Services.AddSingleton<IGSTCalculation, GSTCalculationRepository>();
    builder.Services.AddSingleton<ICustomerAccountBranchMapping, CustomerAccountBranchMappingRepository>();
    builder.Services.AddSingleton<ICustomerBook, CustomerBookRepository>();
    builder.Services.AddSingleton<ICustomerFirmTransportSetting, CustomerFirmTransportSettingRepository>();
    builder.Services.AddSingleton<ICustomerFirmBranchTransportSetting, CustomerFirmBranchTransportSettingRepository>();
    builder.Services.AddSingleton<ITransportLRRateOn, TransportLRRateOnRepository>();
    builder.Services.AddSingleton<ITransportLRPayType, TransportLRPayTypeRepository>();
    builder.Services.AddSingleton<ITransportLRBranchCityMapping, TransportLRBranchCityMappingRepository>();
    builder.Services.AddSingleton<ILRBooking, LRBookingRepository>();
    builder.Services.AddSingleton<ITransportLRDelivery, TransportLRDeliveryRepository>();
    builder.Services.AddSingleton<ITransportLRDeliveryType, TransportLRDeliveryTypeRepository>();
    builder.Services.AddSingleton<ILoginHandler, LoginHandler>();
    builder.Services.AddSingleton<IChalan, ChalanRepository>();
    builder.Services.AddSingleton<IFinanceYear, FinanceYearRepository>();
    builder.Services.AddSingleton<ICustomerInvoice, CustomerInvoiceRepository>();
    builder.Services.AddSingleton<ICustomerDeliveryInvoice, CustomerDeliveryInvoiceRepository>();
    builder.Services.AddSingleton<IChalanReceive, ChalanReceiveRepository>();
    builder.Services.AddSingleton<ILRBookingRangeRenew, LRBookingRangeRenewRepository>();
    builder.Services.AddSingleton<IReportLRBookingLRRegister, ReportLRBookingLRRegisterRepository>();
    builder.Services.AddSingleton<IReportLRBookingStockRegister, ReportLRBookingStockRegisterRepository>();
    builder.Services.AddSingleton<IReportLRBookingBookingRegister, ReportLRBookingBookingRegisterRepository>();
    builder.Services.AddSingleton<IReportLRBookingChalanLoadingReport, ReportLRBookingChalanLoadingReportRepository>();
    builder.Services.AddSingleton<IReportLRBookingChalanMonthlyReport, ReportLRBookingChalanMonthlyReportRepository>();
    builder.Services.AddSingleton<IReportLRBookingMonthlySummary, ReportLRBookingMonthlySummaryRepository>();
    builder.Services.AddSingleton<IReportLRBookingDailySummary, ReportLRBookingDailySummaryRepository>();
    builder.Services.AddSingleton<IReportLRDeliveryLRRegister, ReportLRDeliveryLRRegisterRepository>();
    builder.Services.AddSingleton<IChalanReceiveAgency, ChalanReceiveAgencyRepository>();
    builder.Services.AddSingleton<ICustomerGeneralExpensesMulti, CustomerGeneralExpensesMultiRepository>();
    builder.Services.AddSingleton<ICustomerPurchaseGeneralInvoice, CustomerPurchaseGeneralInvoiceRepository>();
    builder.Services.AddSingleton<ISalesBillMaster, SalesBillMasterRepository>();
    builder.Services.AddSession();

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
            options.LogoutPath = "/LogIn";
            options.AccessDeniedPath = "/Authentication/AccessDenied";
        });

    var app = builder.Build();
    app.ConfigureExceptionHandler(logger);
    app.UseRequestLocalization(new RequestLocalizationOptions
    {
        DefaultRequestCulture = new RequestCulture(defaultCulture),
        SupportedCultures = new List<CultureInfo> { defaultCulture },
        SupportedUICultures = new List<CultureInfo> { defaultCulture }
    });
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


    app.UseHttpsRedirection();
    app.UseStaticFiles();

    app.UseRouting();

    app.UseAuthentication();
    app.UseAuthorization();
	app.UseSession();

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