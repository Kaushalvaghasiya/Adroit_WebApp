IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PrintName] [nvarchar](100) NULL,
	[AccountGroupId] [int] NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [smallint] NULL,
	[Pincode] [varchar](10) NULL,
	[KM] [varchar](4) NULL,
	[ContactPersonName] [nvarchar](30) NULL,
	[Mobile] [varchar](15) NULL,
	[MobileAlternate] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[GSTNumber] [varchar](15) NULL,
	[PAN] [varchar](12) NULL,
	[AreaName] [varchar](20) NULL,
	[RateWithGST] [bit] NOT NULL,
	[GSTInvoiceTypeId] [tinyint] NOT NULL,
	[EximCode] [varchar](30) NULL,
	[IsIGST] [bit] NOT NULL,
	[GSTNumberTransport] [varchar](15) NULL,
	[TransportName] [varchar](50) NULL,
	[VehicleNumber] [varchar](15) NULL,
	[DeliveryId] [int] NULL,
	[ShippingId] [int] NULL,
	[BrokerId] [int] NULL,
	[CreditDays] [smallint] NOT NULL,
	[Discount] [decimal](18, 3) NOT NULL,
	[TDS] [decimal](18, 3) NOT NULL,
	[TCS] [decimal](18, 3) NOT NULL,
	[CreditLimit] [decimal](18, 0) NOT NULL,
	[InterestRate] [decimal](2, 2) NOT NULL,
	[Commission] [decimal](5, 3) NOT NULL,
	[IsEcommerce] [bit] NOT NULL,
	[AdharUID] [varchar](12) NULL,
	[TAN] [varchar](10) NULL,
	[CompositParty] [bit] NOT NULL,
	[RCMParty] [bit] NOT NULL,
	[CapitalPercentage] [decimal](5, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountGroupAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountGroupAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TypeId] [tinyint] NOT NULL,
	[AccountGroupHeaderId] [int] NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroupMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroupMaster] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroupMaster_1] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountGroupHeaderAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountGroupHeaderAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroupHeaderMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroupHeaderMaster] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AccountGroupType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[AccountGroupType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroupType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillEntryTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BillEntryTypeAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](50) NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Description] [nvarchar](250) NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BillEntryTypeAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BillTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BillTypeAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BillType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BillType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookAccountId] [int] NOT NULL,
	[BookTypeId] [tinyint] NOT NULL,
	[BoxLabel1] [nvarchar](50) NULL,
	[BoxLabel2] [nvarchar](50) NULL,
	[BoxLabel3] [nvarchar](50) NULL,
	[BoxLabel4] [nvarchar](50) NULL,
	[BoxLabel5] [nvarchar](50) NULL,
	[BoxLabel6] [nvarchar](50) NULL,
	[BillNoPrefix] [varchar](15) NULL,
	[BillNoPostFix] [varchar](15) NULL,
	[LRRequired] [bit] NOT NULL,
	[BillTypeID] [tinyint] NULL,
	[IsGeneralPurchase] [bit] NOT NULL,
	[IsItemDiscount] [bit] NOT NULL,
	[IsItemDiscountSp] [bit] NOT NULL,
	[IsCashPayAtBill] [bit] NOT NULL,
	[ItemDesc1] [nvarchar](15) NULL,
	[ItemDesc2] [nvarchar](15) NULL,
	[ItemDesc3] [nvarchar](15) NULL,
	[ItemDesc4] [nvarchar](15) NULL,
	[ItemDesc5] [nvarchar](15) NULL,
	[ItemDesc6] [nvarchar](15) NULL,
	[ShowSalesOrderBoxNumber] [bit] NOT NULL,
	[ShowPurcahseOrderBoxNumber] [bit] NOT NULL,
	[ShowQuotationBoxNumber] [bit] NOT NULL,
	[ShowPerformaInvoiceNumber] [bit] NOT NULL,
	[SalesBillFrom] [char](1) NOT NULL,
	[IsCalcMultiply] [bit] NOT NULL,
	[BookShortName] [nvarchar](10) NULL,
	[HeaderBox1] [nvarchar](15) NULL,
	[HeaderBox2] [nvarchar](15) NULL,
	[HeaderBox3] [nvarchar](15) NULL,
	[HeaderBox4] [nvarchar](15) NULL,
	[HeaderBox5] [nvarchar](15) NULL,
	[IsTDSAccount] [bit] NOT NULL,
	[TDSAccountId] [int] NULL,
	[IsTCSAccount] [bit] NOT NULL,
	[TCSAccountId] [int] NULL,
	[SGSTAccountId] [int] NOT NULL,
	[CGSTAccountId] [int] NOT NULL,
	[IGSTAccountId] [int] NOT NULL,
	[GSTStateCessAccountId] [int] NULL,
	[GSTCentralCessAccountId] [int] NULL,
	[RCMSGSTPayAccountId] [int] NULL,
	[RCMCGSTPayAccountId] [int] NULL,
	[RCMIGSTPayAccountId] [int] NULL,
	[RCMSGSTRecAccountId] [int] NULL,
	[RCMCGSTRecAccountId] [int] NULL,
	[RCMIGSTRecAccountId] [int] NULL,
	[RoundOffAccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BookAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookTypeAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BookType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BookType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Broker]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Broker](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[CityId] [int] NULL,
	[Pincode] [varchar](10) NULL,
	[ContactPersonName] [nvarchar](50) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[MobileAlternate] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[Brokerage] [decimal](16, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[OwnerBranchId] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[AdharUID] [varchar](12) NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Broker] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Business]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Business](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](200) NOT NULL,
	[OrderNumber] [smallint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BusinessMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BusinessSoftwareMapping](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[BusinessId] [smallint] NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
 CONSTRAINT [PK_BusinessSoftwareMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BusinessSoftwareMapping] UNIQUE NONCLUSTERED 
(
	[BusinessId] ASC,
	[SoftwareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[City]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[City](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[TalukaId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ColorAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ColorAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ColorAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ColorAdmin] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Country]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Country](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[PhoneCode] [varchar](5) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CountryMaster] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CountryMaster] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Customer](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [varchar](150) NOT NULL,
	[Address1] [varchar](200) NOT NULL,
	[Address2] [varchar](200) NULL,
	[Address3] [varchar](200) NULL,
	[CityId] [int] NOT NULL,
	[StateId] [int] NULL,
	[Pincode] [varchar](10) NULL,
	[ContactPersonName] [varchar](100) NOT NULL,
	[Mobile] [varchar](15) NOT NULL,
	[MobileAlternate] [varchar](15) NULL,
	[Phone] [varchar](20) NULL,
	[Email] [varchar](50) NOT NULL,
	[BusinessId] [smallint] NOT NULL,
	[Requirement] [nvarchar](max) NULL,
	[TotalFirm] [smallint] NULL,
	[CustomerType] [char](1) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AdharUID] [varchar](12) NULL,
	[TotalUsers] [smallint] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[EmailOTP] [varchar](6) NULL,
	[MobileOTP] [varchar](6) NULL,
	[StatusId] [tinyint] NOT NULL,
	[BusinessName] [nvarchar](250) NOT NULL,
	[AgreeTerms] [bit] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[AddedById] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccount]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccount](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[PrintName] [nvarchar](100) NULL,
	[AccountGroupId] [int] NOT NULL,
	[Address1] [nvarchar](100) NULL,
	[Address2] [nvarchar](100) NULL,
	[Address3] [nvarchar](100) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [smallint] NULL,
	[Pincode] [varchar](10) NULL,
	[KM] [varchar](4) NULL,
	[ContactPersonName] [nvarchar](30) NULL,
	[Mobile] [varchar](15) NULL,
	[MobileAlternate] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[GSTNumber] [varchar](15) NULL,
	[PAN] [varchar](12) NULL,
	[AreaName] [varchar](20) NULL,
	[RateWithGST] [bit] NOT NULL,
	[GSTInvoiceTypeId] [tinyint] NOT NULL,
	[EximCode] [varchar](30) NULL,
	[IsIGST] [bit] NOT NULL,
	[GSTNumberTransport] [varchar](15) NULL,
	[TransportName] [varchar](50) NULL,
	[VehicleNumber] [varchar](15) NULL,
	[DeliveryAccountBranchMappingId] [int] NULL,
	[ShippingAccountBranchMappingId] [int] NULL,
	[BrokerMappingId] [int] NULL,
	[CreditDays] [smallint] NOT NULL,
	[Discount] [decimal](18, 3) NOT NULL,
	[TDS] [decimal](18, 3) NOT NULL,
	[TCS] [decimal](18, 3) NOT NULL,
	[CreditLimit] [decimal](18, 0) NOT NULL,
	[InterestRate] [decimal](2, 2) NOT NULL,
	[Commission] [decimal](5, 3) NOT NULL,
	[IsEcommerce] [bit] NOT NULL,
	[AdharUID] [varchar](12) NULL,
	[TAN] [varchar](10) NULL,
	[CompositParty] [bit] NOT NULL,
	[RCMParty] [bit] NOT NULL,
	[CapitalPercentage] [decimal](5, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[OwnerBranchId] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Account] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccountBranchMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_AccountMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerAccountBranchMapping] UNIQUE NONCLUSTERED 
(
	[AccountId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccountGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[TypeId] [tinyint] NOT NULL,
	[AccountGroupHeaderId] [int] NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroup] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroup_1] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroupHeader]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccountGroupHeader](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AccountGroupHeader] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_AccountGroupHeader] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerAccountOpeningBalance](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[Type] [char](1) NOT NULL,
	[Amount] [decimal](18, 2) NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerAccountOpeningBalance] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerBook]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[BookAccountId] [int] NOT NULL,
	[BookTypeId] [tinyint] NOT NULL,
	[BoxLabel1] [nvarchar](50) NULL,
	[BoxLabel2] [nvarchar](50) NULL,
	[BoxLabel3] [nvarchar](50) NULL,
	[BoxLabel4] [nvarchar](50) NULL,
	[BoxLabel5] [nvarchar](50) NULL,
	[BoxLabel6] [nvarchar](50) NULL,
	[BillNoPrefix] [varchar](15) NULL,
	[BillNoPostFix] [varchar](15) NULL,
	[LRRequired] [bit] NOT NULL,
	[BillTypeID] [tinyint] NULL,
	[IsGeneralPurchase] [bit] NOT NULL,
	[IsItemDiscount] [bit] NOT NULL,
	[IsItemDiscountSp] [bit] NOT NULL,
	[IsCashPayAtBill] [bit] NOT NULL,
	[ItemDesc1] [nvarchar](15) NULL,
	[ItemDesc2] [nvarchar](15) NULL,
	[ItemDesc3] [nvarchar](15) NULL,
	[ItemDesc4] [nvarchar](15) NULL,
	[ItemDesc5] [nvarchar](15) NULL,
	[ItemDesc6] [nvarchar](15) NULL,
	[ShowSalesOrderBoxNumber] [bit] NOT NULL,
	[ShowPurcahseOrderBoxNumber] [bit] NOT NULL,
	[ShowQuotationBoxNumber] [bit] NOT NULL,
	[ShowPerformaInvoiceNumber] [bit] NOT NULL,
	[SalesBillFrom] [char](1) NOT NULL,
	[IsCalcMultiply] [bit] NOT NULL,
	[BookShortName] [nvarchar](10) NULL,
	[HeaderBox1] [nvarchar](15) NULL,
	[HeaderBox2] [nvarchar](15) NULL,
	[HeaderBox3] [nvarchar](15) NULL,
	[HeaderBox4] [nvarchar](15) NULL,
	[HeaderBox5] [nvarchar](15) NULL,
	[IsTDSAccount] [bit] NOT NULL,
	[TDSAccountId] [int] NULL,
	[IsTCSAccount] [bit] NOT NULL,
	[TCSAccountId] [int] NULL,
	[SGSTAccountId] [int] NOT NULL,
	[CGSTAccountId] [int] NOT NULL,
	[IGSTAccountId] [int] NOT NULL,
	[GSTStateCessAccountId] [int] NULL,
	[GSTCentralCessAccountId] [int] NULL,
	[RcmSGSTPayAccountId] [int] NULL,
	[RcmCGSTPayAccountId] [int] NULL,
	[RcmIGSTPayAccountId] [int] NULL,
	[RcmSGSTRecAccountId] [int] NULL,
	[RcmCGSTRecAccountId] [int] NULL,
	[RcmIGSTRecAccountId] [int] NULL,
	[RoundOffAccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[OwnerBranchId] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerBook] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[BookAccountId] ASC,
	[BillTypeID] ASC,
	[YearId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerBookBranchMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerBranchBookMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerBookBranchMapping] UNIQUE NONCLUSTERED 
(
	[BookId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerBrokerBranchMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BrokerId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerFirmBrokerMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerBrokerBranchMapping] UNIQUE NONCLUSTERED 
(
	[BrokerId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirm]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirm](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[BusinessId] [smallint] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[OwnerName] [nvarchar](100) NOT NULL,
	[TAN] [varchar](30) NULL,
	[IECCode] [varchar](30) NULL,
	[IsLutBond] [bit] NOT NULL,
	[LutBondNumber] [varchar](30) NULL,
	[IsGTA] [bit] NOT NULL,
	[FirmTypeId] [smallint] NOT NULL,
	[GstFirmTypeId] [tinyint] NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
	[BranchLimit] [smallint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[AddedById] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[AdharUID] [varchar](12) NULL,
	[LRResetOnYearEnd] [bit] NOT NULL,
	[CessRequired] [bit] NOT NULL,
 CONSTRAINT [PK_Firm] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirmBranch](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[PrintTitle] [nvarchar](100) NULL,
	[ShortTitle] [nvarchar](10) NULL,
	[FirmBranchTypeId] [tinyint] NOT NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[Address3] [nvarchar](200) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [smallint] NOT NULL,
	[Pincode] [varchar](12) NULL,
	[Phone] [varchar](50) NULL,
	[ContactPersonName] [nvarchar](30) NULL,
	[Mobile] [varchar](15) NULL,
	[MobileAlternate] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[GSTNumber] [varchar](15) NULL,
	[PAN] [varchar](10) NULL,
	[EWBAddress1] [nvarchar](200) NULL,
	[EWBAddress2] [nvarchar](200) NULL,
	[RenewalDate] [datetime] NOT NULL,
	[SetupPrice] [decimal](16, 2) NOT NULL,
	[RenewalPrice] [decimal](16, 2) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[SoftwarePlanId] [tinyint] NOT NULL,
 CONSTRAINT [PK_CustomerFirmBranch] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerFirmBranch] UNIQUE NONCLUSTERED 
(
	[FirmId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirmBranchLRRate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[RatePerKg] [decimal](9, 2) NULL,
	[RatePerParcel] [decimal](9, 2) NULL,
	[IsCrossingChargeApply] [bit] NOT NULL,
	[CrossingChargePercentOnFreight] [decimal](9, 2) NULL,
	[CrossingChargePerKg] [decimal](9, 2) NULL,
	[CrossingChargePerParcel] [decimal](9, 2) NULL,
	[IsCommissionApply] [bit] NOT NULL,
	[CommissionPercentOnFreight] [decimal](9, 2) NULL,
	[CommissionPerKg] [decimal](9, 2) NULL,
	[CommissionPerParcel] [decimal](9, 2) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerFirmBranchLRRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerFirmBranchLRRate] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC,
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[RatePerKG] [decimal](9, 2) NULL,
	[RatePerParcel] [decimal](9, 2) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerFirmBranchTransportContractRateSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirmBranchTransportSetting](
	[BranchId] [int] NOT NULL,
	[PurcahseBookBranchMappingId] [int] NOT NULL,
	[BookingSalesBookBranchMappingId] [int] NOT NULL,
	[DeliverySalesBookBranchMappingId] [int] NOT NULL,
	[ToPayAccountBranchMappingId] [int] NOT NULL,
	[CrossingAmountAccountBranchMappingId] [int] NULL,
	[CrossingCommissionAccountBranchMappingId] [int] NULL,
	[CrossingHamaliAccountBranchMappingId] [int] NULL,
	[CrossingDeliveryChargeAccountBranchMappingId] [int] NULL,
	[SalesAccountBranchMappingId] [int] NULL,
	[IsAutoJvEnableForChallan] [bit] NOT NULL,
	[IsFreightAddInToBillForDelivery] [bit] NOT NULL,
	[LRRateOnId] [tinyint] NOT NULL,
	[LRPayTypeId] [tinyint] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerFirmBranchTransportSetting_1] PRIMARY KEY CLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerFirmTransportSetting](
	[FirmId] [int] NOT NULL,
	[IsWeightRoundOff] [bit] NOT NULL,
	[IsPartyAndCityRateFromLastLR] [bit] NOT NULL,
	[LRBookChargeLable1] [nvarchar](20) NULL,
	[LRBookChargeLable2] [nvarchar](20) NULL,
	[LRBookChargeLable3] [nvarchar](20) NULL,
	[LRBookChargeLable4] [nvarchar](20) NULL,
	[LRBookChargeLable5] [nvarchar](20) NULL,
	[LRBookChargeLable6] [nvarchar](20) NULL,
	[DeliveryChargeLable1] [nvarchar](20) NULL,
	[DeliveryChargeLable2] [nvarchar](20) NULL,
	[DeliveryChargeLable3] [nvarchar](20) NULL,
	[DeliveryChargeLable4] [nvarchar](20) NULL,
	[DeliveryChargeLable5] [nvarchar](20) NULL,
	[DeliveryChargeLable6] [nvarchar](20) NULL,
	[ReverseChargeLimitForSalesGST] [decimal](6, 2) NOT NULL,
	[ReverseChargeApplyForURDParty] [bit] NOT NULL,
	[ProductIdForSales] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerFirmTransportSetting] PRIMARY KEY CLUSTERED 
(
	[FirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerUser]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsActive] [bit] NOT NULL,
	[IsLocked] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[OwnerBranchId] [int] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[FirstName] [varchar](50) NULL,
	[LastName] [varchar](50) NULL,
	[AllowUpdateUserMenuSettingToCustomer] [bit] NOT NULL,
 CONSTRAINT [PK_CustomerUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerUser] UNIQUE NONCLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerUserBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[CustomerUserBranchMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_CustomerUserBranchMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerUserBranchMapping] UNIQUE NONCLUSTERED 
(
	[UserId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[District]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[District](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[StateId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_District] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Driver]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Driver](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Address] [nvarchar](200) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[Pincode] [varchar](10) NULL,
	[LicenceIssuePlaceId] [int] NOT NULL,
	[LicenceNumber] [varchar](20) NOT NULL,
	[AdharUID] [varchar](12) NULL,
	[Mobile] [varchar](15) NULL,
	[LicenceExpiry] [datetime] NOT NULL,
	[DriverTypeId] [tinyint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Driver] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DriverTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[DriverTypeAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](15) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_DriverType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_DriverType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FinanceYear]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FinanceYear](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirmId] [int] NOT NULL,
	[Title] [varchar](10) NOT NULL,
	[YearFrom] [datetime] NOT NULL,
	[YearTo] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_FinanceYear] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FirmBranchTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FirmBranchTypeAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_FirmBranchType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[FirmTypeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[FirmTypeAdmin](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[OrderNumber] [smallint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_FirmType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_FirmType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTCalculation]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTCalculation](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTCalculation] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTCalculation] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTCollection]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTCollection](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GSTNumber] [varchar](15) NOT NULL,
	[Name] [nvarchar](200) NOT NULL,
	[Address1] [nvarchar](200) NULL,
	[Address2] [nvarchar](200) NULL,
	[Address3] [nvarchar](200) NULL,
	[City] [nvarchar](50) NULL,
	[Pincode] [varchar](10) NULL,
	[AddedOn] [datetime] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTCollection] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTCollection] UNIQUE NONCLUSTERED 
(
	[GSTNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTFirmType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTFirmType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTFirmType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTFirmType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTInvoiceType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTInvoiceType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[TitleB2B] [nvarchar](40) NOT NULL,
	[TitleEinvoice] [nvarchar](10) NOT NULL,
	[TitleCDNUR] [nvarchar](10) NOT NULL,
	[PayType] [nvarchar](10) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_InvoiceType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_InvoiceType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTPort]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTPort](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Code] [varchar](10) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTPort] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTPort] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTPort_1] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTRate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTRate](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Rate] [decimal](15, 3) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTRate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTReason]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTReason](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Code] [nvarchar](2) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTReason] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTTransportMode]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTTransportMode](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_GSTTransportMode] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_GSTTransportMode] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[GSTUQC]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[GSTUQC](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[Code] [varchar](3) NOT NULL,
	[CodeEWayBill] [varchar](20) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_UQC] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UQC] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UQC_1] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_UQC_2] UNIQUE NONCLUSTERED 
(
	[CodeEWayBill] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[LRBookingRange]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[LRBookingRange](
	[Id] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[StartNumber] [int] NOT NULL,
	[EndNumber] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_LRRange] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_LRRange] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[MenuSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[MenuSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
	[SoftwarePlanId] [tinyint] NOT NULL,
	[CustomerId] [int] NOT NULL,
	[CusomerFirmId] [int] NOT NULL,
	[CustomerFirmBranchId] [int] NOT NULL,
	[CustomerUserId] [int] NOT NULL,
	[Master__Adroit__Software__Software_Master] [bit] NOT NULL,
	[Master__Adroit__Software__Plan] [bit] NOT NULL,
	[Master__Adroit__Software__Businesses] [bit] NOT NULL,
	[Master__Adroit__Customer__Customers] [bit] NOT NULL,
	[Master__Adroit__Customer__Branch_Types] [bit] NOT NULL,
	[Master__Adroit__Customer__Menu_Setting] [bit] NOT NULL,
	[Master__Adroit__Customer__Box_Setting] [bit] NOT NULL,
	[Master__Adroit__Account__Accounts] [bit] NOT NULL,
	[Master__Adroit__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Adroit__Account__Books] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Types] [bit] NOT NULL,
	[Master__Adroit__Account__Bill_From] [bit] NOT NULL,
	[Master__Adroit__Account__Book_Settings] [bit] NOT NULL,
	[Master__Adroit__Location__City] [bit] NOT NULL,
	[Master__Adroit__Location__Taluka] [bit] NOT NULL,
	[Master__Adroit__Location__District] [bit] NOT NULL,
	[Master__Adroit__Location__State] [bit] NOT NULL,
	[Master__Adroit__Location__Country] [bit] NOT NULL,
	[Master__Adroit__GST__Rate] [bit] NOT NULL,
	[Master__Adroit__GST__Invoice_Types] [bit] NOT NULL,
	[Master__Adroit__GST__Ports] [bit] NOT NULL,
	[Master__Adroit__GST__Collections] [bit] NOT NULL,
	[Master__Adroit__Product__Colour] [bit] NOT NULL,
	[Master__Adroit__Product__Amount_Calculations] [bit] NOT NULL,
	[Master__Adroit__Product__Size] [bit] NOT NULL,
	[Master__Adroit__Product__Stock_Types] [bit] NOT NULL,
	[Master__Adroit__Product__Quality_Types] [bit] NOT NULL,
	[Master__Adroit__Transport__Packing] [bit] NOT NULL,
	[Master__Adroit__Transport__Description] [bit] NOT NULL,
	[Master__Adroit__Transport__LR_Charges] [bit] NOT NULL,
	[Master__Customer__Firms] [bit] NOT NULL,
	[Master__Customer__Branches] [bit] NOT NULL,
	[Master__Customer__Users] [bit] NOT NULL,
	[Master__Account__Add] [bit] NOT NULL,
	[Master__Account__Secondary_Account_Group] [bit] NOT NULL,
	[Master__Account__Primary_Account_Group] [bit] NOT NULL,
	[Master__Product__Add] [bit] NOT NULL,
	[Master__Product__Design] [bit] NOT NULL,
	[Master__Product__Colour] [bit] NOT NULL,
	[Master__Product__Size] [bit] NOT NULL,
	[Master__Product__Fabric] [bit] NOT NULL,
	[Master__Product__Group] [bit] NOT NULL,
	[Master__Product__Sub_Group] [bit] NOT NULL,
	[Master__Product__Shade] [bit] NOT NULL,
	[Master__Product__Packing] [bit] NOT NULL,
	[Master__Broker] [bit] NOT NULL,
	[Master__Machine] [bit] NOT NULL,
	[Master__Yarn_Shade] [bit] NOT NULL,
	[Master__Yarn_Recipes] [bit] NOT NULL,
	[Master__Process] [bit] NOT NULL,
	[Master__Cataloge] [bit] NOT NULL,
	[Master__Employee] [bit] NOT NULL,
	[Master__Location__City] [bit] NOT NULL,
	[Master__Location__Branch_City_Mapping] [bit] NOT NULL,
	[Master__Vehicles] [bit] NOT NULL,
	[Master__Drivers] [bit] NOT NULL,
	[Master__LR__Packing] [bit] NOT NULL,
	[Master__LR__Description] [bit] NOT NULL,
	[Transaction__Booking__LR] [bit] NOT NULL,
	[Transaction__Booking__Chalan] [bit] NOT NULL,
	[Transaction__Booking__Invoice] [bit] NOT NULL,
	[Transaction__Delivery__Chalan_Receive] [bit] NOT NULL,
	[Transaction__Delivery__Delivery_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Quotation] [bit] NOT NULL,
	[Transaction__Sales__Praforma_Invoice] [bit] NOT NULL,
	[Transaction__Sales__Sales_Order] [bit] NOT NULL,
	[Transaction__Sales__Chalan_Packing_Slip] [bit] NOT NULL,
	[Transaction__Sales__Sales] [bit] NOT NULL,
	[Transaction__Sales__Sales_Return] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Order] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Chalan] [bit] NOT NULL,
	[Transaction__Purchase__Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Jobwork_Purchase] [bit] NOT NULL,
	[Transaction__Purchase__Purchase_Return] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses] [bit] NOT NULL,
	[Transaction__Purchase__General_Expenses_Multi] [bit] NOT NULL,
	[Transaction__Credit_Note] [bit] NOT NULL,
	[Transaction__Debit_Note] [bit] NOT NULL,
	[Account__Payment__Bank_Payment] [bit] NOT NULL,
	[Account__Payment__Cash_Payment] [bit] NOT NULL,
	[Account__Receive__Bank_Receive] [bit] NOT NULL,
	[Account__Receive__Cash_Receive] [bit] NOT NULL,
	[Account__Account_Opening_Balance] [bit] NOT NULL,
	[Account__Product_Opening_Stock] [bit] NOT NULL,
	[Account__Journal_JV__General_JV] [bit] NOT NULL,
	[Account__Journal_JV__Bill_Base_JV] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_01] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_02_2A_2B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_03B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_04_4B] [bit] NOT NULL,
	[Account__GST_Filling__GSTR_09_9C] [bit] NOT NULL,
	[Account__GST_Filling__ITC_04] [bit] NOT NULL,
	[Account__Reconsilation] [bit] NOT NULL,
	[Account__Cash_Auto_Payment] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Sales_Quotation_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Detail_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Summary_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Item_Wise_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Monthly_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Chalan_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Aiging_Register] [bit] NOT NULL,
	[Reports__SalesAndPurchase__Outstanding__Interest_Calculator] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Booking_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__LR_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Stock_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report] [bit] NOT NULL,
	[Reports__BookAndRegister__Bank_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Cash_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Journal_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Day_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__Voucher_Book] [bit] NOT NULL,
	[Reports__BookAndRegister__TDSAndTCS_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Credit_Debit_Note_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Payroll_Register] [bit] NOT NULL,
	[Reports__BookAndRegister__Brokrage_Register] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Out_Detail] [bit] NOT NULL,
	[Reports__Stock__Stock_Statement] [bit] NOT NULL,
	[Reports__Stock__Item_Wise] [bit] NOT NULL,
	[Reports__Stock__Group_Wise] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Process] [bit] NOT NULL,
	[Reports__Stock__Stock_In_Ware_House] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Yarn] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Beam] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__Grey] [bit] NOT NULL,
	[Reports__ProdAndInventory__Prod_Register__General] [bit] NOT NULL,
	[Reports__ProdAndInventory__Batch_Master_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Issue_Register] [bit] NOT NULL,
	[Reports__ProdAndInventory__Receive_Register] [bit] NOT NULL,
	[Reports__Jobwork__Work_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Work_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Jobwork_Pending_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Issue_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Receive_Chalan_Reg] [bit] NOT NULL,
	[Reports__Jobwork__Mill_Pending_Reg] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_01] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_02_2A_2B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_03B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_04_4B] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_09_9C] [bit] NOT NULL,
	[Reports__GST_Register__ITC_04] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_SetOff] [bit] NOT NULL,
	[Reports__GST_Register__GSTR_Reconsilation] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Head_Print] [bit] NOT NULL,
	[Reports__Account_Register__Leadger] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Multi] [bit] NOT NULL,
	[Reports__Account_Register__Ledger_Month_Wise] [bit] NOT NULL,
	[Reports__Account_Register__Interest_Calculator] [bit] NOT NULL,
	[Reports__Account_Register__Payable_Receivable] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Summary] [bit] NOT NULL,
	[Reports__Financial_Reports__Trial_Balance_Detail] [bit] NOT NULL,
	[Reports__Financial_Reports__Trading_Account] [bit] NOT NULL,
	[Reports__Financial_Reports__ProfitAndLoss] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet] [bit] NOT NULL,
	[Reports__Financial_Reports__Balance_Sheet_Schedule] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Batch_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Yarn_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Grey_Master] [bit] NOT NULL,
	[Inventory__Production__Consumption_BOM__Saree_Master] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Yarn_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Beam_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Grey_Production] [bit] NOT NULL,
	[Inventory__Production__Gen_Prod__Saree_Production] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Yarn__Receive] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork] [bit] NOT NULL,
	[Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork] [bit] NOT NULL,
	[Inventory__Beam_Entry] [bit] NOT NULL,
	[Inventory__Inventory__Issue] [bit] NOT NULL,
	[Inventory__Inventory__Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Dispach] [bit] NOT NULL,
	[Inventory__Jobwork__Work_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Issue] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Receive] [bit] NOT NULL,
	[Inventory__Mill_Jobwork__Job_Issue] [bit] NOT NULL,
	[Inventory__Cutting_Process__Taka_to_Pcs] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Books] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Book_Setting__Multi_Print_Vocher] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Account_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Product_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Broker_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__City_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Vehicle_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Driver_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Packing_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Description_Master] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Merge] [bit] NOT NULL,
	[SettingsAndUtilities__Merge__Taka_Demerge] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Create_New_Year] [bit] NOT NULL,
	[SettingsAndUtilities__Year__Year_End_Process] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transfer_Next_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Stock] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Closing_Amount] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Issue] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Taka_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Delete_Previous_Year__Box_Production] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Firm] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Branch] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__Contract_Rate] [bit] NOT NULL,
	[SettingsAndUtilities__Transport_Setting__LR_Booking_Range] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_MenuSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_MenuSetting] UNIQUE NONCLUSTERED 
(
	[SoftwareId] ASC,
	[SoftwarePlanId] ASC,
	[CustomerId] ASC,
	[CusomerFirmId] ASC,
	[CustomerFirmBranchId] ASC,
	[CustomerUserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[PoductOpeningStock](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[Quantity] [decimal](18, 2) NOT NULL,
	[QuantityNos] [decimal](18, 2) NOT NULL,
	[QuantityLoose] [decimal](18, 2) NOT NULL,
	[FIFORate] [decimal](18, 2) NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_PoductOpeningStock] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Product](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[Code] [varchar](20) NOT NULL,
	[PrintName] [nvarchar](100) NULL,
	[TitleAlternate] [nvarchar](100) NULL,
	[DesignNumberId] [int] NULL,
	[ColourId] [int] NULL,
	[SizeId] [int] NULL,
	[PackingId] [int] NULL,
	[ShadeNumberId] [int] NULL,
	[FabricId] [int] NULL,
	[GroupId] [int] NULL,
	[SubGroupId] [int] NULL,
	[StockTypeId] [int] NOT NULL,
	[QualityTypeId] [int] NULL,
	[UQCId] [tinyint] NOT NULL,
	[HSNCode] [varchar](8) NULL,
	[CategoryId] [smallint] NULL,
	[DenierWeight] [decimal](5, 3) NULL,
	[RatePerMeter] [decimal](5, 3) NULL,
	[RateRetail] [decimal](5, 3) NULL,
	[Mrp] [decimal](5, 3) NULL,
	[DistributorRate] [decimal](5, 3) NULL,
	[DealerRate] [decimal](5, 3) NULL,
	[PurchaseRate] [decimal](5, 3) NULL,
	[Cut] [decimal](4, 2) NULL,
	[AveragePack] [decimal](5, 2) NULL,
	[BoxPack] [decimal](5, 2) NULL,
	[RolMin] [decimal](5, 2) NULL,
	[RolMax] [decimal](7, 2) NULL,
	[GSTCalculationId] [tinyint] NOT NULL,
	[GSTRateId] [tinyint] NOT NULL,
	[GstCentralCess] [decimal](5, 2) NOT NULL,
	[GstStateCess] [decimal](5, 2) NOT NULL,
	[AmountCalcId] [smallint] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[RateUpdate] [bit] NOT NULL,
	[Discount] [decimal](4, 2) NOT NULL,
	[HSNDesc] [nvarchar](50) NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Product] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Product_1] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductAmtCalcOn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductAmtCalcOn](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](25) NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductAmtCalcOn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductBranchMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_ProductBranchMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductBranchMapping] UNIQUE NONCLUSTERED 
(
	[ProductId] ASC,
	[BranchId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductCategory]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductCategory](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductCategory] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductCategory] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductColor]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductColor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductColor] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductDesignNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductDesignNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductDesignNumber] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductFabric]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductFabric](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductFabric] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductFabric] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](40) NOT NULL,
	[OrderNumber] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductGroup] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductPacking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductPacking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductPacking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductPacking] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductQualityType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductQualityType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductQltyType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductQltyType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductShadeNumber](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductShadeNumber] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductShadeNumber] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSize]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductSize](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductSize] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSizeAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductSizeAdmin](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductSizeAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductSizeAdmin] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductStockType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductStockType](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductStockType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductStockType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ProductSubGroup](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [int] NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ProductSubGroup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ProductSubGroup] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[ReportTemplate]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[ReportTemplate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[TemplateSubject] [nvarchar](100) NOT NULL,
	[TemplateBody] [nvarchar](max) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_ReportTemplate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_ReportTemplate] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC,
	[TemplateSubject] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SalesBillFromAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SalesBillFromAdmin](
	[Id] [char](1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SalesBillFromAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_SalesBillFromAdmin] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Software]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Software](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](20) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Software] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Software] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SoftwarePlan]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SoftwarePlan](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
	[Title] [varchar](100) NOT NULL,
	[Business] [varchar](20) NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[Cost] [decimal](16, 2) NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_SoftwarePlan] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_Code] UNIQUE NONCLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UC_SoftwareId_Title] UNIQUE NONCLUSTERED 
(
	[SoftwareId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[State]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[State](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[TitleGSTR] [nvarchar](100) NOT NULL,
	[TitleEWay] [nvarchar](100) NOT NULL,
	[Code] [varchar](5) NOT NULL,
	[CountryId] [smallint] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[SystemSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[SystemSetting](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[NewRegistrationFirmTypeId] [smallint] NOT NULL,
	[NewRegistrationGstFirmTypeId] [tinyint] NOT NULL,
	[NewRegistrationSoftwareId] [tinyint] NOT NULL,
	[NewRegistrationFirmBranchTypeId] [tinyint] NOT NULL,
	[NewRegistrationSoftwarePlanId] [tinyint] NOT NULL,
 CONSTRAINT [PK_SystemSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Taluka]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Taluka](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[DistrictId] [int] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Taluka] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportDesc]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportDesc](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportDesc] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportDesc] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportDescAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportDescAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportDescAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportDescAdmin] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRBranchCityMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[CityId] [int] NOT NULL,
	[OrderNumber] [int] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportBranchCityMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportBranchCityMapping] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC,
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRCharges]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRCharges](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportLRCharges] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportLRCharges] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRDelivery]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRDelivery](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportLRDelivery] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportLRDelivery] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRDeliveryType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRDeliveryType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](20) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportLRDeliveryType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportLRDeliveryType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRPayType]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRPayType](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportLRPayType] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportLRPayType] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRRateOn]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportLRRateOn](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](10) NOT NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportLRRateOn] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportPacking]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportPacking](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Title] [nvarchar](30) NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportPacking] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportPacking] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TransportPackingAdmin]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[TransportPackingAdmin](
	[Id] [tinyint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](30) NULL,
	[OrderNumber] [tinyint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_TransportPackingAdmin] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_TransportPackingAdmin] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleModel]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VehicleModel](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](100) NOT NULL,
	[OrderNumber] [smallint] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_VehcileModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_VehcileModel] UNIQUE NONCLUSTERED 
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[VehicleOwner]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[VehicleOwner](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[Name] [varchar](70) NOT NULL,
	[Address] [nvarchar](150) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[Pincode] [varchar](10) NULL,
	[Mobile] [varchar](15) NOT NULL,
	[PAN] [varchar](12) NULL,
	[AccountId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[AdharUID] [varchar](12) NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_VehicleOwner] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_VehicleOwner] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[PAN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_VehicleOwner_1] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Mobile] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Vehilcle]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Vehilcle](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerId] [int] NOT NULL,
	[VRN] [varchar](12) NOT NULL,
	[ModelId] [smallint] NOT NULL,
	[ChasisNumber] [varchar](30) NOT NULL,
	[EngineNumber] [varchar](30) NOT NULL,
	[RegistrationDate] [datetime] NOT NULL,
	[StateId] [int] NOT NULL,
	[StatePermitNumber] [varchar](50) NULL,
	[StatePermitIssueOn] [datetime] NULL,
	[StatePermitExpiry] [datetime] NULL,
	[NationalPermitNumber] [varchar](50) NULL,
	[NationalPermitIssueOn] [datetime] NULL,
	[NationalPermitExpiry] [datetime] NULL,
	[InsuranceNumber] [varchar](50) NULL,
	[InsuranceIssueOn] [datetime] NULL,
	[InsuranceExpiry] [datetime] NULL,
	[OwnerId] [int] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[IsActive] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Vehilcle] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Vehilcle] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[VRN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Vehilcle_1] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[ChasisNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Vehilcle_2] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[EngineNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-AccountOutStanding-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JournalDetailId] [int] NOT NULL,
	[BillId] [int] NOT NULL,
	[Type] [char](1) NOT NULL,
	[PaidAmount] [decimal](9, 2) NULL,
	[BillEnd] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-AccountOutStanding-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-CreditDebitNoteDetail-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CreditDebitNoteMasterId] [int] NOT NULL,
	[ProductBranchMappingId] [int] NOT NULL,
	[PurchaseBillNumberId] [int] NULL,
	[SalesBillNumberId] [int] NULL,
	[Rate] [decimal](10, 2) NOT NULL,
	[BasicAmount] [decimal](10, 2) NOT NULL,
	[BillNotes] [nvarchar](100) NULL,
	[BillOutstandingId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-CreditDebitNoteDetail-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-CreditDebitNoteMaster-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[AccountBranchMappingIdOther] [int] NOT NULL,
	[BookBranchMappingId] [int] NOT NULL,
	[BillNumber] [int] NOT NULL,
	[EntryTypeId] [tinyint] NOT NULL,
	[BillDate] [date] NOT NULL,
	[BillNumberBranch] [int] NOT NULL,
	[BillType] [char](1) NOT NULL,
	[PartyReferenceNo] [varchar](25) NULL,
	[SkipInGSTR] [bit] NOT NULL,
	[ReturnReasonId] [tinyint] NOT NULL,
	[ProductBranchMappingId] [int] NOT NULL,
	[TDSAccountBranchMappingId] [int] NULL,
	[TDSPercentage] [decimal](5, 2) NOT NULL,
	[TDSAmount] [decimal](10, 2) NOT NULL,
	[TCSPercentage] [decimal](5, 2) NOT NULL,
	[TCSAmount] [decimal](10, 2) NOT NULL,
	[SGSTPercentage] [decimal](5, 2) NOT NULL,
	[SGSTAmount] [decimal](10, 2) NOT NULL,
	[CGSTPercentage] [decimal](5, 2) NOT NULL,
	[CGSTAmount] [decimal](10, 2) NOT NULL,
	[IGSTPercentage] [decimal](5, 2) NOT NULL,
	[IGSTAmount] [decimal](10, 2) NOT NULL,
	[GSTStateCessPercentage] [decimal](5, 2) NOT NULL,
	[GSTStateCessAmount] [decimal](10, 2) NOT NULL,
	[GSTCentralCessPercentage] [decimal](5, 2) NOT NULL,
	[GSTCentralCessAmount] [decimal](10, 2) NOT NULL,
	[RoundOff] [decimal](2, 2) NOT NULL,
	[BillAmount] [decimal](10, 2) NOT NULL,
	[Notes] [nvarchar](250) NULL,
	[IRNNumber] [varchar](250) NULL,
	[AcknowledgementNumber] [varchar](50) NULL,
	[IRNDate] [datetime] NULL,
	[PurchaseBillMasterId] [int] NULL,
	[SalesBillMasterId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-CreditDebitNoteMaster-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-JournalDetail-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[JournalId] [int] NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[AccountBranchMappingIdOther] [int] NOT NULL,
	[Type] [char](1) NOT NULL,
	[Amount] [decimal](18, 3) NOT NULL,
	[ReceiptNumber] [varchar](30) NULL,
	[SubSRNumber] [smallint] NOT NULL,
	[IsBillSelected] [bit] NOT NULL,
	[Description1] [nvarchar](200) NULL,
	[Description2] [nvarchar](200) NULL,
	[IsAudit] [bit] NOT NULL,
	[ReconcileDate] [datetime] NULL,
	[BillNumberDetail] [nvarchar](400) NULL,
	[ParentJournalDetailId] [int] NULL,
 CONSTRAINT [PK_Z-JournalDetail-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-JournalMaster-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EntryTypeId] [tinyint] NOT NULL,
	[FirmVoucherNumber] [int] NOT NULL,
	[BranchVoucherNumber] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[Date] [datetime] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-JournalMst-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-LRBooking-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[BookBranchMappingId] [int] NOT NULL,
	[LRNumber] [int] NOT NULL,
	[LRDate] [datetime] NOT NULL,
	[VehicleId] [int] NULL,
	[CityIdFrom] [int] NOT NULL,
	[CityIdTo] [int] NOT NULL,
	[DeliveryAccountBranchMappingId] [int] NOT NULL,
	[BillAccountBranchMappingId] [int] NULL,
	[EwayBillNo] [varchar](25) NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[LRPayTypeId] [tinyint] NOT NULL,
	[InvoiceNo] [varchar](20) NULL,
	[InvoiceValue] [decimal](18, 0) NULL,
	[PrivateMarka] [nvarchar](30) NULL,
	[Parcel] [smallint] NULL,
	[ActualWeight] [decimal](18, 3) NULL,
	[ChargeWeight] [decimal](18, 3) NULL,
	[DescriptionId] [int] NULL,
	[PackingId] [int] NULL,
	[LRRateOnId] [tinyint] NOT NULL,
	[Rate] [decimal](18, 2) NULL,
	[Freight] [decimal](18, 2) NULL,
	[Charges1] [decimal](18, 2) NULL,
	[Charges2] [decimal](18, 2) NULL,
	[Charges3] [decimal](18, 2) NULL,
	[Charges4] [decimal](18, 2) NULL,
	[Charges5] [decimal](18, 2) NULL,
	[Charges6] [decimal](18, 2) NULL,
	[ProductBranchMappingId] [int] NOT NULL,
	[Remarks] [nvarchar](100) NULL,
	[LRDeliveryId] [tinyint] NOT NULL,
	[LRDeliveryTypeId] [tinyint] NOT NULL,
	[IsSaleBilled] [bit] NOT NULL,
	[ArrivalDate] [datetime] NULL,
	[DeliveryDate] [datetime] NULL,
	[IsDispatched] [bit] NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedById] [int] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-ChallanLR-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_Z-ChallanLR-Z] UNIQUE NONCLUSTERED 
(
	[AccountBranchMappingId] ASC,
	[LRNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-PurchaseBillDetail-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseBillMasterId] [int] NOT NULL,
	[ProductBranchMappingId] [int] NOT NULL,
	[LRBookingId] [int] NOT NULL,
	[Quantity1] [decimal](9, 3) NULL,
	[Quantity2] [decimal](9, 3) NULL,
	[Quantity3] [decimal](9, 3) NULL,
	[Quantity4] [decimal](9, 3) NULL,
	[Quantity5] [decimal](9, 3) NULL,
	[Quantity6] [decimal](9, 3) NULL,
	[DiscountPercentage] [decimal](5, 2) NULL,
	[DiscountAmount] [decimal](9, 3) NULL,
	[Rate] [decimal](9, 3) NULL,
	[OtherCharges] [decimal](9, 3) NULL,
	[BasicAmount] [decimal](9, 3) NULL,
	[SGSTPercentage] [decimal](5, 2) NULL,
	[SGSTAmount] [decimal](9, 3) NULL,
	[CGSTPercentage] [decimal](5, 2) NULL,
	[CGSTAmount] [decimal](9, 3) NULL,
	[IGSTPercentage] [decimal](5, 2) NULL,
	[IGSTAmount] [decimal](9, 3) NULL,
	[GSTStateCessPercentage] [decimal](5, 2) NULL,
	[GSTStateCessAmount] [decimal](9, 3) NULL,
	[GSTCentralCessPercentage] [decimal](5, 2) NULL,
	[GSTCentralCessAmount] [decimal](9, 3) NULL,
	[BatchNumber] [varchar](30) NULL,
	[ExpiryDate] [datetime] NULL,
	[ItemDesc1] [nvarchar](100) NULL,
	[ItemDesc2] [nvarchar](100) NULL,
	[ItemDesc3] [nvarchar](100) NULL,
	[ItemDesc4] [nvarchar](100) NULL,
	[ItemDesc5] [nvarchar](100) NULL,
	[ItemDesc6] [nvarchar](100) NULL,
	[QuantityDiscountPercentage] [decimal](3, 2) NULL,
	[QuantityDiscountAmount] [decimal](9, 3) NULL,
	[SpecialDiscount1] [decimal](9, 3) NULL,
	[SpecialDiscount2] [decimal](9, 3) NULL,
	[SpecialDiscount3] [decimal](9, 3) NULL,
	[SalesQuantity] [decimal](9, 3) NULL,
	[SalesRate] [decimal](9, 3) NULL,
	[SalesDiscount] [decimal](9, 3) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-BillDetail-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-PurchaseBillMaster-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[BookBranchMappingId] [int] NOT NULL,
	[BillNumberFirm] [varchar](20) NOT NULL,
	[BillNumberTable] [varchar](30) NOT NULL,
	[BillNumberBranch] [int] NOT NULL,
	[BillNumberBranchTable] [varchar](30) NOT NULL,
	[EntryTypeId] [tinyint] NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[VehicleId] [int] NOT NULL,
	[CityIdFrom] [int] NULL,
	[CityIdTo] [int] NULL,
	[DriverId] [int] NULL,
	[DeliveryBranchId] [int] NOT NULL,
	[EwayBillNumber] [varchar](25) NULL,
	[ValidDateFrom] [datetime] NULL,
	[ValidDateTo] [datetime] NULL,
	[TaxableAmount] [decimal](9, 2) NULL,
	[TDSPercent] [decimal](9, 2) NULL,
	[TDSAmount] [decimal](9, 2) NULL,
	[AdvanceCash] [decimal](9, 2) NULL,
	[AdvanceNeft] [decimal](9, 2) NULL,
	[OtherLess] [decimal](9, 2) NULL,
	[ReceiveCash] [decimal](9, 2) NULL,
	[OtherPlus] [decimal](9, 2) NULL,
	[SGSTTotal] [decimal](9, 2) NULL,
	[CGSTTotal] [decimal](9, 2) NULL,
	[IGSTTotal] [decimal](9, 2) NULL,
	[GSTStateCessTotal] [decimal](9, 2) NULL,
	[GSTCentralCessTotal] [decimal](9, 2) NULL,
	[TCSPercent] [decimal](9, 2) NULL,
	[TCSAmount] [decimal](9, 2) NULL,
	[ToPayAmount] [decimal](9, 2) NULL,
	[CrossingAmount] [decimal](9, 2) NULL,
	[CrossingCommission] [decimal](9, 2) NULL,
	[CrossingHamali] [decimal](9, 2) NULL,
	[CrossingDeliveryCharge] [decimal](9, 2) NULL,
	[CreditDays] [decimal](9, 2) NULL,
	[RoundOff] [decimal](9, 2) NULL,
	[BillAmount] [decimal](9, 2) NULL,
	[BrokerBranchMappingId] [int] NULL,
	[BrokerAmount] [decimal](9, 2) NULL,
	[Notes] [nvarchar](250) NULL,
	[ToPayAccountBranchMappingId] [int] NULL,
	[CrossingAmountAccountBranchMappingId] [int] NULL,
	[CrossingCommissionAccountBranchMappingId] [int] NULL,
	[CrossingHamaliAccountBranchMappingId] [int] NULL,
	[CrossingDeliveryAccountBranchMappingId] [int] NULL,
	[SalesAccountBranchMappingId] [int] NULL,
	[GenaralPurchaseAccountBranchMappingId] [int] NULL,
	[SkipInGSTR] [bit] NOT NULL,
	[RCMId] [int] NULL,
	[RCMBillNumber] [int] NULL,
	[BillTypeID] [tinyint] NULL,
	[ReturnBillNumber] [varchar](50) NULL,
	[ReturnBillDate] [datetime] NULL,
	[ReturnReasonId] [tinyint] NULL,
	[PurchaseOrderRefNo] [varchar](30) NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-BillMaster-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetailExport-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-SalesBillDetailExport-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesBillMasterId] [int] NOT NULL,
	[PackingLength] [decimal](6, 2) NULL,
	[PackingWidth] [decimal](6, 2) NULL,
	[PackingHeight] [decimal](6, 2) NULL,
	[NetWeight] [decimal](6, 2) NULL,
	[GrossWeight] [decimal](6, 2) NULL,
	[Remarks] [nvarchar](20) NULL,
 CONSTRAINT [PK_Z-SalesBillDetailExport-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-SalesBillDetail-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SalesBillMasterId] [int] NOT NULL,
	[ProductBranchMappingId] [int] NOT NULL,
	[LRBookingId] [int] NOT NULL,
	[BillDetailId] [int] NULL,
	[DeliveryChDetailId] [int] NULL,
	[Quantity1] [int] NOT NULL,
	[Quantity2] [int] NOT NULL,
	[Quantity3] [int] NOT NULL,
	[Quantity4] [int] NOT NULL,
	[Quantity5] [int] NOT NULL,
	[Quantity6] [int] NOT NULL,
	[DiscountPercentage] [decimal](4, 2) NOT NULL,
	[DiscountAmount] [decimal](9, 2) NOT NULL,
	[Rate] [decimal](10, 2) NOT NULL,
	[NetRate] [decimal](10, 2) NOT NULL,
	[FreightAmount] [decimal](10, 2) NOT NULL,
	[OtherCharges] [decimal](10, 2) NOT NULL,
	[BasicAmount] [decimal](10, 2) NOT NULL,
	[SGSTPercentage] [decimal](4, 2) NOT NULL,
	[SGSTAmount] [decimal](10, 2) NOT NULL,
	[CGSTPercentage] [decimal](4, 2) NOT NULL,
	[CGSTAmount] [decimal](10, 2) NOT NULL,
	[IGSTPercentage] [decimal](4, 2) NOT NULL,
	[IGSTAmount] [decimal](10, 2) NOT NULL,
	[GSTStateCessPercentage] [decimal](4, 2) NOT NULL,
	[GSTStateCessAmount] [decimal](10, 2) NOT NULL,
	[GSTCentralCessPercentage] [decimal](4, 2) NOT NULL,
	[GSTCentralCessAmount] [decimal](10, 2) NOT NULL,
	[BatchNumber] [nvarchar](30) NULL,
	[ExpiryDate] [date] NULL,
	[ItemDescription1] [nvarchar](100) NULL,
	[ItemDescription2] [nvarchar](100) NULL,
	[ItemDescription3] [nvarchar](100) NULL,
	[ItemDescription4] [nvarchar](100) NULL,
	[ItemDescription5] [nvarchar](100) NULL,
	[ItemDescription6] [nvarchar](100) NULL,
	[QuantityDiscountPercentage] [decimal](4, 2) NOT NULL,
	[QuantityDiscountAmount] [decimal](10, 2) NOT NULL,
	[SpecialDiscount1] [decimal](10, 2) NOT NULL,
	[SpecialDiscount2] [decimal](10, 2) NOT NULL,
	[SpecialDiscount3] [decimal](10, 2) NOT NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-SalesBillDetail-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Z-SalesBillMaster-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[BookBranchMappingId] [int] NOT NULL,
	[BillNumber] [int] NOT NULL,
	[EntryTypeId] [tinyint] NOT NULL,
	[BillDate] [datetime] NOT NULL,
	[SerialNumberOfBranch] [int] NOT NULL,
	[InvoiceMemo] [varchar](1) NOT NULL,
	[SalesBillFromId] [char](1) NOT NULL,
	[ChalanDateFrom] [date] NULL,
	[ChalanDateTo] [date] NULL,
	[ChalanNo] [int] NULL,
	[SalesOrderNumber] [varchar](25) NULL,
	[BillTypeId] [tinyint] NOT NULL,
	[DeliveryPartyAccountBranchMappingId] [int] NOT NULL,
	[ShippingAccountBranchMappingId] [int] NULL,
	[HastePartyAccountBranchMappingId] [int] NULL,
	[DeliveryLRBookingId] [int] NULL,
	[SalesPartyName1] [nvarchar](100) NULL,
	[SalesPartyName2] [nvarchar](100) NULL,
	[CreditDays] [int] NOT NULL,
	[TaxableAmount] [decimal](10, 2) NOT NULL,
	[SGSTTotal] [decimal](10, 2) NOT NULL,
	[CGSTTotal] [decimal](10, 2) NOT NULL,
	[IGSTTotal] [decimal](10, 2) NOT NULL,
	[GSTStateCessTotal] [decimal](10, 2) NOT NULL,
	[GSTCentralCessTotal] [decimal](10, 2) NOT NULL,
	[TCSPercentage] [decimal](5, 3) NOT NULL,
	[TCSAmount] [decimal](10, 2) NOT NULL,
	[TDSPercentage] [decimal](5, 3) NOT NULL,
	[TDSAmount] [decimal](10, 2) NOT NULL,
	[ExtraAmount] [decimal](10, 2) NOT NULL,
	[RoundOff] [decimal](4, 2) NOT NULL,
	[BillAmount] [decimal](10, 2) NOT NULL,
	[BrokerBranchMappingId] [int] NULL,
	[Notes] [nvarchar](250) NULL,
	[EwayBillNumber] [varchar](20) NULL,
	[IRNNumber] [varchar](250) NULL,
	[AcknowledgementNumber] [varchar](50) NULL,
	[IRNDate] [datetime] NULL,
	[ReturnBillNumber] [varchar](50) NULL,
	[ReturnBillDate] [date] NULL,
	[ReturnReasonId] [tinyint] NULL,
	[VehicleNumber] [varchar](12) NULL,
	[TransportGSTNumber] [varchar](15) NULL,
	[TransportLRNumber] [varchar](15) NULL,
	[TransportLRDate] [date] NULL,
	[TransportName] [nvarchar](50) NULL,
	[TransportModeId] [tinyint] NULL,
	[ToStationCityId] [int] NULL,
	[HeaderBox1] [nvarchar](20) NULL,
	[HeaderBox2] [nvarchar](20) NULL,
	[HeaderBox3] [nvarchar](20) NULL,
	[HeaderBox4] [nvarchar](20) NULL,
	[HeaderBox5] [nvarchar](20) NOT NULL,
	[PaidAmount] [decimal](10, 2) NOT NULL,
	[UnPaidAmount] [decimal](10, 2) NOT NULL,
	[Charge1] [decimal](6, 2) NOT NULL,
	[Charge2] [decimal](6, 2) NOT NULL,
	[Charge3] [decimal](6, 2) NOT NULL,
	[Charge4] [decimal](6, 2) NOT NULL,
	[Charge5] [decimal](6, 2) NOT NULL,
	[Charge6] [decimal](6, 2) NOT NULL,
	[CreditNoteId] [int] NULL,
	[IsDeleted] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-SalesBillmaster-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Broker]') AND name = N'IX_Broker')
CREATE NONCLUSTERED INDEX [IX_Broker] ON [dbo].[Broker]
(
	[CustomerId] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]') AND name = N'IX_CustomerFirmBranchTransportContractRateSetting')
CREATE NONCLUSTERED INDEX [IX_CustomerFirmBranchTransportContractRateSetting] ON [dbo].[CustomerFirmBranchTransportContractRateSetting]
(
	[AccountBranchMappingId] ASC,
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[Driver]') AND name = N'IX_Driver')
CREATE NONCLUSTERED INDEX [IX_Driver] ON [dbo].[Driver]
(
	[CustomerId] ASC,
	[LicenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[ProductAmtCalcOn]') AND name = N'IX_ProductAmtCalcOn')
CREATE NONCLUSTERED INDEX [IX_ProductAmtCalcOn] ON [dbo].[ProductAmtCalcOn]
(
	[SoftwareId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO

IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[TransportLRRateOn]') AND name = N'IX_TransportLRRateOn')
CREATE NONCLUSTERED INDEX [IX_TransportLRRateOn] ON [dbo].[TransportLRRateOn]
(
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_CountryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_CountryId]  DEFAULT ((1)) FOR [CountryId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_RateWithGST]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_RateWithGST]  DEFAULT ((0)) FOR [RateWithGST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_IsGST]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_IsGST]  DEFAULT ((0)) FOR [IsIGST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_CreditDays]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_CreditDays]  DEFAULT ((0)) FOR [CreditDays]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_Discount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_Discount]  DEFAULT ((0)) FOR [Discount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_TDS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_TDS]  DEFAULT ((0)) FOR [TDS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_TCS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_TCS]  DEFAULT ((0)) FOR [TCS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_CreditLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_CreditLimit]  DEFAULT ((0)) FOR [CreditLimit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_InterestRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_InterestRate]  DEFAULT ((0)) FOR [InterestRate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_Commission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_Commission]  DEFAULT ((0)) FOR [Commission]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_IsEcommerce]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_IsEcommerce]  DEFAULT ((0)) FOR [IsEcommerce]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_CompositParty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_CompositParty]  DEFAULT ((0)) FOR [CompositParty]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_RcmParty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_RcmParty]  DEFAULT ((0)) FOR [RCMParty]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_CapitalPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_CapitalPercentage]  DEFAULT ((0)) FOR [CapitalPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountAdmin_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  CONSTRAINT [DF_AccountAdmin_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccountAd__Activ__55BFB948]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountAdmin] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupAdmin] ADD  CONSTRAINT [DF_AccountGroupMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupAdmin_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupAdmin] ADD  CONSTRAINT [DF_AccountGroupAdmin_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccountGr__Activ__589C25F3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupAdmin] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupHeaderMaster_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupHeaderAdmin] ADD  CONSTRAINT [DF_AccountGroupHeaderMaster_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupHeaderAdmin_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupHeaderAdmin] ADD  CONSTRAINT [DF_AccountGroupHeaderAdmin_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccountGr__Activ__5B78929E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupHeaderAdmin] ADD  CONSTRAINT [DF__AccountGr__Activ__5B78929E]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupType] ADD  CONSTRAINT [DF_AccountGroupType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__AccountGr__Activ__5D60DB10]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[AccountGroupType] ADD  CONSTRAINT [DF__AccountGr__Activ__5D60DB10]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BillEntry__Activ__5E54FF49]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BillEntryTypeAdmin] ADD  CONSTRAINT [DF__BillEntry__Activ__5E54FF49]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BillType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BillTypeAdmin] ADD  CONSTRAINT [DF_BillType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BillTypeA__Activ__603D47BB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BillTypeAdmin] ADD  CONSTRAINT [DF__BillTypeA__Activ__603D47BB]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_LRRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_LRRequired]  DEFAULT ((1)) FOR [LRRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsGeneralPurchase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsGeneralPurchase]  DEFAULT ((0)) FOR [IsGeneralPurchase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsItemDiscount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsItemDiscount]  DEFAULT ((0)) FOR [IsItemDiscount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsItemDiscountSp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsItemDiscountSp]  DEFAULT ((0)) FOR [IsItemDiscountSp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IscashPayAtBill]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IscashPayAtBill]  DEFAULT ((0)) FOR [IsCashPayAtBill]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_ShowSalesOrderBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_ShowSalesOrderBoxNumber]  DEFAULT ((0)) FOR [ShowSalesOrderBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_ShowPurcahseOrderBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_ShowPurcahseOrderBoxNumber]  DEFAULT ((0)) FOR [ShowPurcahseOrderBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_ShowQuotationBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_ShowQuotationBoxNumber]  DEFAULT ((0)) FOR [ShowQuotationBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_ShowPerformaInvoiceNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_ShowPerformaInvoiceNumber]  DEFAULT ((0)) FOR [ShowPerformaInvoiceNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_SalesBillFrom]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_SalesBillFrom]  DEFAULT ((1)) FOR [SalesBillFrom]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsCalcMultiply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsCalcMultiply]  DEFAULT ((0)) FOR [IsCalcMultiply]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsTDSAccount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsTDSAccount]  DEFAULT ((0)) FOR [IsTDSAccount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsTCSAccount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsTCSAccount]  DEFAULT ((0)) FOR [IsTCSAccount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  CONSTRAINT [DF_BookAdmin_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BookAdmin__Activ__6F7F8B4B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookAdmin] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookTypeAdmin] ADD  CONSTRAINT [DF_BookType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__BookTypeA__Activ__7167D3BD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BookTypeAdmin] ADD  CONSTRAINT [DF__BookTypeA__Activ__7167D3BD]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Broker_Brokerage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  CONSTRAINT [DF_Broker_Brokerage]  DEFAULT ((0)) FOR [Brokerage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Broker_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  CONSTRAINT [DF_Broker_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Broker_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  CONSTRAINT [DF_Broker_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Broker_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  CONSTRAINT [DF_Broker_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Broker_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  CONSTRAINT [DF_Broker_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Broker__Active__7720AD13]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Broker] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Business_OrderNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF_Business_OrderNumber]  DEFAULT ((0)) FOR [OrderNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Business_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF_Business_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Business__Active__79FD19BE]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Business] ADD  CONSTRAINT [DF__Business__Active__79FD19BE]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__City__Active__7AF13DF7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[City] ADD  CONSTRAINT [DF__City__Active__7AF13DF7]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ColorAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ColorAdmin] ADD  CONSTRAINT [DF_ColorAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ColorAdmi__Activ__7CD98669]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ColorAdmin] ADD  CONSTRAINT [DF__ColorAdmi__Activ__7CD98669]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Country__Active__7DCDAAA2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Country] ADD  CONSTRAINT [DF__Country__Active__7DCDAAA2]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_TotalFirm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalFirm]  DEFAULT ((1)) FOR [TotalFirm]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_CustomerType]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_CustomerType]  DEFAULT ((1)) FOR [CustomerType]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_TotalUsers]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_TotalUsers]  DEFAULT ((1)) FOR [TotalUsers]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Customer__Busine__149C0161]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__Busine__149C0161]  DEFAULT ('') FOR [BusinessName]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Customer__AgreeT__4356F04A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF__Customer__AgreeT__4356F04A]  DEFAULT ((0)) FOR [AgreeTerms]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Customer_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Customer] ADD  CONSTRAINT [DF_Customer_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccount_CountryId]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_CountryId]  DEFAULT ((1)) FOR [CountryId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_RateWithGST]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_RateWithGST]  DEFAULT ((0)) FOR [RateWithGST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_GSTEnable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_GSTEnable]  DEFAULT ((0)) FOR [IsIGST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_CreditDays]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_CreditDays]  DEFAULT ((0)) FOR [CreditDays]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_Discount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_Discount]  DEFAULT ((0)) FOR [Discount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_TDS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_TDS]  DEFAULT ((0)) FOR [TDS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_TCS]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_TCS]  DEFAULT ((0)) FOR [TCS]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_CreditLimit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_CreditLimit]  DEFAULT ((0)) FOR [CreditLimit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_InterestRate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_InterestRate]  DEFAULT ((0)) FOR [InterestRate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccount_Commission]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_Commission]  DEFAULT ((0)) FOR [Commission]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_IsEcommerce]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_IsEcommerce]  DEFAULT ((0)) FOR [IsEcommerce]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_CompositParty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_CompositParty]  DEFAULT ((0)) FOR [CompositParty]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_RcmParty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_RcmParty]  DEFAULT ((0)) FOR [RCMParty]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccount_CapitalPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_CapitalPercentage]  DEFAULT ((0)) FOR [CapitalPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Account_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_Account_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccount_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccount_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  CONSTRAINT [DF_CustomerAccount_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerA__Activ__178D7CA5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccount] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmAccountMapping_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmAccountMapping_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmAccountMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmAccountMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmAccountMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmAccountMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroup_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroup] ADD  CONSTRAINT [DF_AccountGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountGroup_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroup] ADD  CONSTRAINT [DF_CustomerAccountGroup_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountGroup_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroup] ADD  CONSTRAINT [DF_CustomerAccountGroup_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerA__Activ__1E3A7A34]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroup] ADD  CONSTRAINT [DF__CustomerA__Activ__1E3A7A34]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_AccountGroupHeader_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroupHeader] ADD  CONSTRAINT [DF_AccountGroupHeader_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountGroupHeader_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroupHeader] ADD  CONSTRAINT [DF_CustomerAccountGroupHeader_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountGroupHeader_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroupHeader] ADD  CONSTRAINT [DF_CustomerAccountGroupHeader_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerA__Activ__220B0B18]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountGroupHeader] ADD  CONSTRAINT [DF__CustomerA__Activ__220B0B18]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountOpeningBalance_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] ADD  CONSTRAINT [DF_CustomerAccountOpeningBalance_Amount]  DEFAULT ((0)) FOR [Amount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountOpeningBalance_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] ADD  CONSTRAINT [DF_CustomerAccountOpeningBalance_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerAccountOpeningBalance_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] ADD  CONSTRAINT [DF_CustomerAccountOpeningBalance_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_LRRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_LRRequired]  DEFAULT ((1)) FOR [LRRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsGeneralPurchase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsGeneralPurchase]  DEFAULT ((0)) FOR [IsGeneralPurchase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsItemDiscount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsItemDiscount]  DEFAULT ((0)) FOR [IsItemDiscount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsItemDiscountSp]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsItemDiscountSp]  DEFAULT ((0)) FOR [IsItemDiscountSp]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IscashPayAtBill]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IscashPayAtBill]  DEFAULT ((0)) FOR [IsCashPayAtBill]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_SalesOrderBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_SalesOrderBoxNumber]  DEFAULT ((0)) FOR [ShowSalesOrderBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_PurcahseOrderBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_PurcahseOrderBoxNumber]  DEFAULT ((0)) FOR [ShowPurcahseOrderBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_QuotationBoxNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_QuotationBoxNumber]  DEFAULT ((0)) FOR [ShowQuotationBoxNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_PerformaInvoiceNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_PerformaInvoiceNumber]  DEFAULT ((0)) FOR [ShowPerformaInvoiceNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_SalesBillFrom]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_SalesBillFrom]  DEFAULT ((1)) FOR [SalesBillFrom]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsCalcMultiply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsCalcMultiply]  DEFAULT ((0)) FOR [IsCalcMultiply]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsTDSAccount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsTDSAccount]  DEFAULT ((0)) FOR [IsTDSAccount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsTCSAccount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsTCSAccount]  DEFAULT ((0)) FOR [IsTCSAccount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF_CustomerBook_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerB__Activ__361203C5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBook] ADD  CONSTRAINT [DF__CustomerB__Activ__361203C5]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBranchBookMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBookBranchMapping] ADD  CONSTRAINT [DF_CustomerBranchBookMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBranchBookMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBookBranchMapping] ADD  CONSTRAINT [DF_CustomerBranchBookMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBrokerMapping_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmBrokerMapping_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBrokerMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmBrokerMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBrokerMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] ADD  CONSTRAINT [DF_CustomerFirmBrokerMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_IsLutBond]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_IsLutBond]  DEFAULT ((0)) FOR [IsLutBond]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_IsGTANumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_IsGTANumber]  DEFAULT ((1)) FOR [IsGTA]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_IsActivated]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_IsActivated]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_LRResetOnYearEnd]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_LRResetOnYearEnd]  DEFAULT ((1)) FOR [LRResetOnYearEnd]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirm_CessRequired]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [DF_CustomerFirm_CessRequired]  DEFAULT ((0)) FOR [CessRequired]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranch_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranch] ADD  CONSTRAINT [DF_CustomerFirmBranch_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranch_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranch] ADD  CONSTRAINT [DF_CustomerFirmBranch_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranch_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranch] ADD  CONSTRAINT [DF_CustomerFirmBranch_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranch_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranch] ADD  CONSTRAINT [DF_CustomerFirmBranch_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerF__Softw__473C8FC7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranch] ADD  DEFAULT ((1)) FOR [SoftwarePlanId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchLRRate_IsCrossingChargeApply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] ADD  CONSTRAINT [DF_CustomerFirmBranchLRRate_IsCrossingChargeApply]  DEFAULT ((0)) FOR [IsCrossingChargeApply]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchLRRate_IsCommissionApply]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] ADD  CONSTRAINT [DF_CustomerFirmBranchLRRate_IsCommissionApply]  DEFAULT ((0)) FOR [IsCommissionApply]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchLRRate_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] ADD  CONSTRAINT [DF_CustomerFirmBranchLRRate_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchTransportContractRateSetting_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting] ADD  CONSTRAINT [DF_CustomerFirmBranchTransportContractRateSetting_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchTransportSetting_IsAutoJvEnableForChallan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmBranchTransportSetting_IsAutoJvEnableForChallan]  DEFAULT ((0)) FOR [IsAutoJvEnableForChallan]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchTransportSetting_IsFreightAddInToBillForDelivery]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmBranchTransportSetting_IsFreightAddInToBillForDelivery]  DEFAULT ((0)) FOR [IsFreightAddInToBillForDelivery]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmBranchTransportSetting_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmBranchTransportSetting_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmTransportSetting_IsWeightRoundOff]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmTransportSetting_IsWeightRoundOff]  DEFAULT ((0)) FOR [IsWeightRoundOff]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmTransportSetting_IsPartyAndCityRateFromLastLR]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmTransportSetting_IsPartyAndCityRateFromLastLR]  DEFAULT ((0)) FOR [IsPartyAndCityRateFromLastLR]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmTransportSetting_ReverseChargeLimitForSalesGST]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmTransportSetting_ReverseChargeLimitForSalesGST]  DEFAULT ((0)) FOR [ReverseChargeLimitForSalesGST]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmTransportSetting_ReverseChargeApplyForURDParty]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmTransportSetting_ReverseChargeApplyForURDParty]  DEFAULT ((0)) FOR [ReverseChargeApplyForURDParty]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerFirmTransportSetting_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerFirmTransportSetting] ADD  CONSTRAINT [DF_CustomerFirmTransportSetting_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUser_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  CONSTRAINT [DF_CustomerUser_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUser_IsLocked]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  CONSTRAINT [DF_CustomerUser_IsLocked]  DEFAULT ((0)) FOR [IsLocked]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUser_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  CONSTRAINT [DF_CustomerUser_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUser_AddedOn_1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  CONSTRAINT [DF_CustomerUser_AddedOn_1]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUser_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  CONSTRAINT [DF_CustomerUser_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__CustomerU__Allow__44EA3301]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUser] ADD  DEFAULT ((0)) FOR [AllowUpdateUserMenuSettingToCustomer]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUserBranchMapping_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUserBranchMapping] ADD  CONSTRAINT [DF_CustomerUserBranchMapping_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUserBranchMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUserBranchMapping] ADD  CONSTRAINT [DF_CustomerUserBranchMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerUserBranchMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[CustomerUserBranchMapping] ADD  CONSTRAINT [DF_CustomerUserBranchMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__District__Active__48BAC3E5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[District] ADD  CONSTRAINT [DF__District__Active__48BAC3E5]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Driver_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Driver_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Driver_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF_Driver_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Driver__Active__4C8B54C9]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Driver] ADD  CONSTRAINT [DF__Driver__Active__4C8B54C9]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_DriverType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DriverTypeAdmin] ADD  CONSTRAINT [DF_DriverType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__DriverTyp__Activ__4E739D3B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[DriverTypeAdmin] ADD  CONSTRAINT [DF__DriverTyp__Activ__4E739D3B]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FinanceYear_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceYear] ADD  CONSTRAINT [DF_FinanceYear_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FinanceYe__Activ__505BE5AD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FinanceYear] ADD  CONSTRAINT [DF__FinanceYe__Activ__505BE5AD]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FirmBranchType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FirmBranchTypeAdmin] ADD  CONSTRAINT [DF_FirmBranchType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FirmBranc__Activ__52442E1F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FirmBranchTypeAdmin] ADD  CONSTRAINT [DF__FirmBranc__Activ__52442E1F]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_FirmType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FirmTypeAdmin] ADD  CONSTRAINT [DF_FirmType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__FirmTypeA__Activ__542C7691]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[FirmTypeAdmin] ADD  CONSTRAINT [DF__FirmTypeA__Activ__542C7691]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTCalculation_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTCalculation] ADD  CONSTRAINT [DF_GSTCalculation_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTCalcul__Activ__5614BF03]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTCalculation] ADD  CONSTRAINT [DF__GSTCalcul__Activ__5614BF03]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTCollection_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTCollection] ADD  CONSTRAINT [DF_GSTCollection_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTCollec__Activ__57FD0775]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTCollection] ADD  CONSTRAINT [DF__GSTCollec__Activ__57FD0775]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTFirmType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTFirmType] ADD  CONSTRAINT [DF_GSTFirmType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTFirmTy__Activ__59E54FE7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTFirmType] ADD  CONSTRAINT [DF__GSTFirmTy__Activ__59E54FE7]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTInvoiceType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTInvoiceType] ADD  CONSTRAINT [DF_GSTInvoiceType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTInvoic__Activ__5BCD9859]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTInvoiceType] ADD  CONSTRAINT [DF__GSTInvoic__Activ__5BCD9859]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTPort_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTPort] ADD  CONSTRAINT [DF_GSTPort_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTPort__Active__5DB5E0CB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTPort] ADD  CONSTRAINT [DF__GSTPort__Active__5DB5E0CB]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTRate_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTRate] ADD  CONSTRAINT [DF_GSTRate_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTRate__Active__5F9E293D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTRate] ADD  CONSTRAINT [DF__GSTRate__Active__5F9E293D]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTReason_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTReason] ADD  CONSTRAINT [DF_GSTReason_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTReason__Activ__618671AF]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTReason] ADD  CONSTRAINT [DF__GSTReason__Activ__618671AF]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTTransportMode_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTTransportMode] ADD  CONSTRAINT [DF_GSTTransportMode_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTTransp__Activ__636EBA21]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTTransportMode] ADD  CONSTRAINT [DF__GSTTransp__Activ__636EBA21]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_GSTUQC_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTUQC] ADD  CONSTRAINT [DF_GSTUQC_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__GSTUQC__Active__65570293]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[GSTUQC] ADD  CONSTRAINT [DF__GSTUQC__Active__65570293]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LRRange_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LRBookingRange] ADD  CONSTRAINT [DF_LRRange_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LRRange_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LRBookingRange] ADD  CONSTRAINT [DF_LRRange_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_LRRange_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LRBookingRange] ADD  CONSTRAINT [DF_LRRange_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__LRBooking__Activ__69279377]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[LRBookingRange] ADD  CONSTRAINT [DF__LRBooking__Activ__69279377]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Software__Software_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Software__Software_Master]  DEFAULT ((0)) FOR [Master__Adroit__Software__Software_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Software__Plan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Software__Plan]  DEFAULT ((0)) FOR [Master__Adroit__Software__Plan]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Software__Businesses]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Software__Businesses]  DEFAULT ((0)) FOR [Master__Adroit__Software__Businesses]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Customer__Customers]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Customer__Customers]  DEFAULT ((0)) FOR [Master__Adroit__Customer__Customers]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Customer__Branch_Types]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Customer__Branch_Types]  DEFAULT ((0)) FOR [Master__Adroit__Customer__Branch_Types]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Customer__Menu_Setting]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Customer__Menu_Setting]  DEFAULT ((0)) FOR [Master__Adroit__Customer__Menu_Setting]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Customer__Box_Setting]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Customer__Box_Setting]  DEFAULT ((0)) FOR [Master__Adroit__Customer__Box_Setting]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Accounts]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Accounts]  DEFAULT ((0)) FOR [Master__Adroit__Account__Accounts]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Secondary_Account_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Secondary_Account_Group]  DEFAULT ((0)) FOR [Master__Adroit__Account__Secondary_Account_Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Primary_Account_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Primary_Account_Group]  DEFAULT ((0)) FOR [Master__Adroit__Account__Primary_Account_Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Books]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Books]  DEFAULT ((0)) FOR [Master__Adroit__Account__Books]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Book_Types]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Book_Types]  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Types]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Bill_From]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Bill_From]  DEFAULT ((0)) FOR [Master__Adroit__Account__Bill_From]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Account__Book_Settings]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Account__Book_Settings]  DEFAULT ((0)) FOR [Master__Adroit__Account__Book_Settings]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Location__City]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Location__City]  DEFAULT ((0)) FOR [Master__Adroit__Location__City]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Location__Taluka]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Location__Taluka]  DEFAULT ((0)) FOR [Master__Adroit__Location__Taluka]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Location__District]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Location__District]  DEFAULT ((0)) FOR [Master__Adroit__Location__District]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Location__State]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Location__State]  DEFAULT ((0)) FOR [Master__Adroit__Location__State]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Location__Country]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Location__Country]  DEFAULT ((0)) FOR [Master__Adroit__Location__Country]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__GST__Rate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__GST__Rate]  DEFAULT ((0)) FOR [Master__Adroit__GST__Rate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__GST__Invoice_Types]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__GST__Invoice_Types]  DEFAULT ((0)) FOR [Master__Adroit__GST__Invoice_Types]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__GST__Ports]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__GST__Ports]  DEFAULT ((0)) FOR [Master__Adroit__GST__Ports]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__GST__Collections]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__GST__Collections]  DEFAULT ((0)) FOR [Master__Adroit__GST__Collections]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Product__Colour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Product__Colour]  DEFAULT ((0)) FOR [Master__Adroit__Product__Colour]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Product__Amount_Calculations]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Product__Amount_Calculations]  DEFAULT ((0)) FOR [Master__Adroit__Product__Amount_Calculations]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Product__Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Product__Size]  DEFAULT ((0)) FOR [Master__Adroit__Product__Size]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Product__Stock_Types]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Product__Stock_Types]  DEFAULT ((0)) FOR [Master__Adroit__Product__Stock_Types]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Product__Quality_Types]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Product__Quality_Types]  DEFAULT ((0)) FOR [Master__Adroit__Product__Quality_Types]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Transport__Packing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Transport__Packing]  DEFAULT ((0)) FOR [Master__Adroit__Transport__Packing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Transport__Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Transport__Description]  DEFAULT ((0)) FOR [Master__Adroit__Transport__Description]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Adroit__Transport__LR_Charges]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Adroit__Transport__LR_Charges]  DEFAULT ((0)) FOR [Master__Adroit__Transport__LR_Charges]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Customer__Firms]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Customer__Firms]  DEFAULT ((0)) FOR [Master__Customer__Firms]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Customer__Branches]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Customer__Branches]  DEFAULT ((0)) FOR [Master__Customer__Branches]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Customer__Users]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Customer__Users]  DEFAULT ((0)) FOR [Master__Customer__Users]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Account__Add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Account__Add]  DEFAULT ((0)) FOR [Master__Account__Add]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Account__Secondary_Account_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Account__Secondary_Account_Group]  DEFAULT ((0)) FOR [Master__Account__Secondary_Account_Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Account__Primary_Account_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Account__Primary_Account_Group]  DEFAULT ((0)) FOR [Master__Account__Primary_Account_Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Add]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Add]  DEFAULT ((0)) FOR [Master__Product__Add]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Design]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Design]  DEFAULT ((0)) FOR [Master__Product__Design]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Colour]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Colour]  DEFAULT ((0)) FOR [Master__Product__Colour]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Size]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Size]  DEFAULT ((0)) FOR [Master__Product__Size]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Fabric]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Fabric]  DEFAULT ((0)) FOR [Master__Product__Fabric]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Group]  DEFAULT ((0)) FOR [Master__Product__Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Sub_Group]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Sub_Group]  DEFAULT ((0)) FOR [Master__Product__Sub_Group]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Shade]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Shade]  DEFAULT ((0)) FOR [Master__Product__Shade]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Product__Packing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Product__Packing]  DEFAULT ((0)) FOR [Master__Product__Packing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Broker]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Broker]  DEFAULT ((0)) FOR [Master__Broker]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Machine]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Machine]  DEFAULT ((0)) FOR [Master__Machine]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Yarn_Shade]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Yarn_Shade]  DEFAULT ((0)) FOR [Master__Yarn_Shade]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Yarn_Recipes]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Yarn_Recipes]  DEFAULT ((0)) FOR [Master__Yarn_Recipes]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Process]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Process]  DEFAULT ((0)) FOR [Master__Process]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Cataloge]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Cataloge]  DEFAULT ((0)) FOR [Master__Cataloge]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Employee]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Employee]  DEFAULT ((0)) FOR [Master__Employee]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Location__City]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Location__City]  DEFAULT ((0)) FOR [Master__Location__City]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Location__Branch_City_Mapping]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Location__Branch_City_Mapping]  DEFAULT ((0)) FOR [Master__Location__Branch_City_Mapping]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Vehicles]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Vehicles]  DEFAULT ((0)) FOR [Master__Vehicles]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__Drivers]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__Drivers]  DEFAULT ((0)) FOR [Master__Drivers]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__LR__Packing]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__LR__Packing]  DEFAULT ((0)) FOR [Master__LR__Packing]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Master__LR__Description]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Master__LR__Description]  DEFAULT ((0)) FOR [Master__LR__Description]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Booking__LR]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Booking__LR]  DEFAULT ((0)) FOR [Transaction__Booking__LR]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Booking__Chalan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Booking__Chalan]  DEFAULT ((0)) FOR [Transaction__Booking__Chalan]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Booking__Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Booking__Invoice]  DEFAULT ((0)) FOR [Transaction__Booking__Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Delivery__Chalan_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Delivery__Chalan_Receive]  DEFAULT ((0)) FOR [Transaction__Delivery__Chalan_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Delivery__Delivery_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Delivery__Delivery_Invoice]  DEFAULT ((0)) FOR [Transaction__Delivery__Delivery_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Quotation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Quotation]  DEFAULT ((0)) FOR [Transaction__Sales__Quotation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Praforma_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Praforma_Invoice]  DEFAULT ((0)) FOR [Transaction__Sales__Praforma_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Sales_Order]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Sales_Order]  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Order]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Chalan_Packing_Slip]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Chalan_Packing_Slip]  DEFAULT ((0)) FOR [Transaction__Sales__Chalan_Packing_Slip]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Sales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Sales]  DEFAULT ((0)) FOR [Transaction__Sales__Sales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Sales__Sales_Return]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Sales__Sales_Return]  DEFAULT ((0)) FOR [Transaction__Sales__Sales_Return]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__Purchase_Order]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__Purchase_Order]  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Order]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__Purchase_Chalan]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__Purchase_Chalan]  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Chalan]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__Purchase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__Purchase]  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__Jobwork_Purchase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__Jobwork_Purchase]  DEFAULT ((0)) FOR [Transaction__Purchase__Jobwork_Purchase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__Purchase_Return]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__Purchase_Return]  DEFAULT ((0)) FOR [Transaction__Purchase__Purchase_Return]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__General_Expenses]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__General_Expenses]  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Purchase__General_Expenses_Multi]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Purchase__General_Expenses_Multi]  DEFAULT ((0)) FOR [Transaction__Purchase__General_Expenses_Multi]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Credit_Note]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Credit_Note]  DEFAULT ((0)) FOR [Transaction__Credit_Note]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Transaction__Debit_Note]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Transaction__Debit_Note]  DEFAULT ((0)) FOR [Transaction__Debit_Note]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Payment__Bank_Payment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Payment__Bank_Payment]  DEFAULT ((0)) FOR [Account__Payment__Bank_Payment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Payment__Cash_Payment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Payment__Cash_Payment]  DEFAULT ((0)) FOR [Account__Payment__Cash_Payment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Receive__Bank_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Receive__Bank_Receive]  DEFAULT ((0)) FOR [Account__Receive__Bank_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Receive__Cash_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Receive__Cash_Receive]  DEFAULT ((0)) FOR [Account__Receive__Cash_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Account_Opening_Balance]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Account_Opening_Balance]  DEFAULT ((0)) FOR [Account__Account_Opening_Balance]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Product_Opening_Stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Product_Opening_Stock]  DEFAULT ((0)) FOR [Account__Product_Opening_Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Journal_JV__General_JV]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Journal_JV__General_JV]  DEFAULT ((0)) FOR [Account__Journal_JV__General_JV]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Journal_JV__Bill_Base_JV]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Journal_JV__Bill_Base_JV]  DEFAULT ((0)) FOR [Account__Journal_JV__Bill_Base_JV]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__GSTR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__GSTR_01]  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_01]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__GSTR_02_2A_2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__GSTR_02_2A_2B]  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_02_2A_2B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__GSTR_03B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__GSTR_03B]  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_03B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__GSTR_04_4B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__GSTR_04_4B]  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_04_4B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__GSTR_09_9C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__GSTR_09_9C]  DEFAULT ((0)) FOR [Account__GST_Filling__GSTR_09_9C]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__GST_Filling__ITC_04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__GST_Filling__ITC_04]  DEFAULT ((0)) FOR [Account__GST_Filling__ITC_04]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Reconsilation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Reconsilation]  DEFAULT ((0)) FOR [Account__Reconsilation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Account__Cash_Auto_Payment]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Account__Cash_Auto_Payment]  DEFAULT ((0)) FOR [Account__Cash_Auto_Payment]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Detail_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Detail_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Detail_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Summary_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Summary_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Summary_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Item_Wise_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Item_Wise_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Item_Wise_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Monthly_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Monthly_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Monthly_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Chalan_Regsiter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Chalan_Regsiter]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Chalan_Regsiter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Order_Regsiter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Sales_Quotation_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Sales__Proforma_Invoice_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Detail_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Detail_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Detail_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Summary_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Summary_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Summary_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Item_Wise_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Item_Wise_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Item_Wise_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Monthly_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Monthly_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Monthly_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Chalan_Regsiter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Purchase__Purchase_Order_Regsiter]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Sales]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Sales]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Sales_Vs_Ledger]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Purchase]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Purchase]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Purchase_Vs_Ledger]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Aiging_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Aiging_Register]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Aiging_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Interest_Calculator]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__SalesAndPurchase__Outstanding__Interest_Calculator]  DEFAULT ((0)) FOR [Reports__SalesAndPurchase__Outstanding__Interest_Calculator]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__LR_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__LR_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__LR_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Stock_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Stock_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Stock_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Booking_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Booking_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Booking_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Daily_Summary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Monthly_Summary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Loading_Report]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Booking_Register__Chalan_Monthly_Report]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__LR_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__LR_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__LR_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Stock_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Delivery_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Daily_Summary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Monthly_Summary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Loading_Report]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]  DEFAULT ((0)) FOR [Reports__BookAndRegister__LR_Delivery_Register__Chalan_Monthly_Report]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Bank_Book]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Bank_Book]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Bank_Book]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Cash_Book]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Cash_Book]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Cash_Book]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Journal_Book]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Journal_Book]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Journal_Book]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Day_Book]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Day_Book]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Day_Book]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Voucher_Book]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Voucher_Book]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Voucher_Book]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__TDSAndTCS_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__TDSAndTCS_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__TDSAndTCS_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Credit_Debit_Note_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Credit_Debit_Note_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Credit_Debit_Note_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Payroll_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Payroll_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Payroll_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__BookAndRegister__Brokrage_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__BookAndRegister__Brokrage_Register]  DEFAULT ((0)) FOR [Reports__BookAndRegister__Brokrage_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Stock_In_Out_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Stock_In_Out_Detail]  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Out_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Stock_Statement]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Stock_Statement]  DEFAULT ((0)) FOR [Reports__Stock__Stock_Statement]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Item_Wise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Item_Wise]  DEFAULT ((0)) FOR [Reports__Stock__Item_Wise]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Group_Wise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Group_Wise]  DEFAULT ((0)) FOR [Reports__Stock__Group_Wise]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Stock_In_Process]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Stock_In_Process]  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Process]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Stock__Stock_In_Ware_House]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Stock__Stock_In_Ware_House]  DEFAULT ((0)) FOR [Reports__Stock__Stock_In_Ware_House]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Yarn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Yarn]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Yarn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Beam]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Beam]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Beam]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Grey]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__Grey]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__Grey]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__General]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Prod_Register__General]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Prod_Register__General]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Batch_Master_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Batch_Master_Register]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Batch_Master_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Issue_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Issue_Register]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Issue_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__ProdAndInventory__Receive_Register]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__ProdAndInventory__Receive_Register]  DEFAULT ((0)) FOR [Reports__ProdAndInventory__Receive_Register]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Work_Issue_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Work_Issue_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Issue_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Work_Receive_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Work_Receive_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Receive_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Work_Pending_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Work_Pending_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Work_Pending_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Jobwork_Receive_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Jobwork_Receive_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Receive_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Jobwork_Issue_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Jobwork_Issue_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Issue_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Jobwork_Pending_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Jobwork_Pending_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Jobwork_Pending_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Mill_Issue_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Mill_Issue_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Issue_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Mill_Receive_Chalan_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Mill_Receive_Chalan_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Receive_Chalan_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Jobwork__Mill_Pending_Reg]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Jobwork__Mill_Pending_Reg]  DEFAULT ((0)) FOR [Reports__Jobwork__Mill_Pending_Reg]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_01]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_01]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_01]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_02_2A_2B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_02_2A_2B]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_02_2A_2B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_03B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_03B]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_03B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_04_4B]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_04_4B]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_04_4B]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_09_9C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_09_9C]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_09_9C]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__ITC_04]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__ITC_04]  DEFAULT ((0)) FOR [Reports__GST_Register__ITC_04]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_SetOff]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_SetOff]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_SetOff]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__GST_Register__GSTR_Reconsilation]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__GST_Register__GSTR_Reconsilation]  DEFAULT ((0)) FOR [Reports__GST_Register__GSTR_Reconsilation]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Ledger_Head_Print]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Ledger_Head_Print]  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Head_Print]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Leadger]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Leadger]  DEFAULT ((0)) FOR [Reports__Account_Register__Leadger]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Ledger_Multi]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Ledger_Multi]  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Multi]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Ledger_Month_Wise]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Ledger_Month_Wise]  DEFAULT ((0)) FOR [Reports__Account_Register__Ledger_Month_Wise]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Interest_Calculator]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Interest_Calculator]  DEFAULT ((0)) FOR [Reports__Account_Register__Interest_Calculator]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Account_Register__Payable_Receivable]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Account_Register__Payable_Receivable]  DEFAULT ((0)) FOR [Reports__Account_Register__Payable_Receivable]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__Trial_Balance_Summary]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__Trial_Balance_Summary]  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Summary]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__Trial_Balance_Detail]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__Trial_Balance_Detail]  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trial_Balance_Detail]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__Trading_Account]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__Trading_Account]  DEFAULT ((0)) FOR [Reports__Financial_Reports__Trading_Account]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__ProfitAndLoss]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__ProfitAndLoss]  DEFAULT ((0)) FOR [Reports__Financial_Reports__ProfitAndLoss]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__Balance_Sheet]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__Balance_Sheet]  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Reports__Financial_Reports__Balance_Sheet_Schedule]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Reports__Financial_Reports__Balance_Sheet_Schedule]  DEFAULT ((0)) FOR [Reports__Financial_Reports__Balance_Sheet_Schedule]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Consumption_BOM__Batch_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Consumption_BOM__Batch_Master]  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Batch_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Consumption_BOM__Yarn_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Consumption_BOM__Yarn_Master]  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Yarn_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Consumption_BOM__Grey_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Consumption_BOM__Grey_Master]  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Grey_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Consumption_BOM__Saree_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Consumption_BOM__Saree_Master]  DEFAULT ((0)) FOR [Inventory__Production__Consumption_BOM__Saree_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Gen_Prod__Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Gen_Prod__Production]  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Gen_Prod__Yarn_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Gen_Prod__Yarn_Production]  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Yarn_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Gen_Prod__Beam_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Gen_Prod__Beam_Production]  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Beam_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Gen_Prod__Grey_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Gen_Prod__Grey_Production]  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Grey_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Production__Gen_Prod__Saree_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Production__Gen_Prod__Saree_Production]  DEFAULT ((0)) FOR [Inventory__Production__Gen_Prod__Saree_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Yarn__Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Yarn__Issue]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Yarn__Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Yarn__Receive]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Yarn__Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Issue_for_OutsideWork]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Beam__Receive_From_Yarn_Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Issue_for_OutsideWork]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]  DEFAULT ((0)) FOR [Inventory__IssueAndReceive__Grey__Receive_From_OutsideWork]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Beam_Entry]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Beam_Entry]  DEFAULT ((0)) FOR [Inventory__Beam_Entry]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Inventory__Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Inventory__Issue]  DEFAULT ((0)) FOR [Inventory__Inventory__Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Inventory__Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Inventory__Receive]  DEFAULT ((0)) FOR [Inventory__Inventory__Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Jobwork__Work_Dispach]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Jobwork__Work_Dispach]  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Dispach]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Jobwork__Work_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Jobwork__Work_Receive]  DEFAULT ((0)) FOR [Inventory__Jobwork__Work_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Jobwork__Job_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Jobwork__Job_Receive]  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Jobwork__Job_Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Jobwork__Job_Issue]  DEFAULT ((0)) FOR [Inventory__Jobwork__Job_Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Mill_Jobwork__Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Mill_Jobwork__Issue]  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Mill_Jobwork__Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Mill_Jobwork__Receive]  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Mill_Jobwork__Job_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Mill_Jobwork__Job_Receive]  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Mill_Jobwork__Job_Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Mill_Jobwork__Job_Issue]  DEFAULT ((0)) FOR [Inventory__Mill_Jobwork__Job_Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_Inventory__Cutting_Process__Taka_to_Pcs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_Inventory__Cutting_Process__Taka_to_Pcs]  DEFAULT ((0)) FOR [Inventory__Cutting_Process__Taka_to_Pcs]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Book_Setting__Books]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Book_Setting__Books]  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Books]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]  DEFAULT ((0)) FOR [SettingsAndUtilities__Book_Setting__Multi_Print_Vocher]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Account_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Account_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Account_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Product_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Product_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Product_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Broker_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Broker_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Broker_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__City_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__City_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__City_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Vehicle_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Vehicle_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Vehicle_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Driver_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Driver_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Driver_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Packing_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Packing_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Packing_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Description_Master]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Description_Master]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Description_Master]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Taka_Merge]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Taka_Merge]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Merge]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Merge__Taka_Demerge]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Merge__Taka_Demerge]  DEFAULT ((0)) FOR [SettingsAndUtilities__Merge__Taka_Demerge]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Year__Create_New_Year]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Year__Create_New_Year]  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Create_New_Year]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Year__Year_End_Process]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Year__Year_End_Process]  DEFAULT ((0)) FOR [SettingsAndUtilities__Year__Year_End_Process]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Closing_Amount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Sales_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Purchase_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Work_Dispach_For_Job]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Job_Receive_For_Work]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Mill_Job_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Taka_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Taka_Production]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Taka_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Box_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transfer_Next_Year__Box_Production]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transfer_Next_Year__Box_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Stock]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Closing_Amount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Sales_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Purchase_Invoice]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Work_Dispach_For_Job]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Job_Receive_For_Work]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Issue]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Mill_Job_Receive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Taka_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Taka_Production]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Taka_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Box_Production]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Delete_Previous_Year__Box_Production]  DEFAULT ((0)) FOR [SettingsAndUtilities__Delete_Previous_Year__Box_Production]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Firm]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Firm]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Firm]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Branch]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Branch]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Branch]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transport_Setting__LR_Rate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transport_Setting__LR_Rate]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Rate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Contract_Rate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transport_Setting__Contract_Rate]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__Contract_Rate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_SettingsAndUtilities__Transport_Setting__LR_Booking_Range]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_SettingsAndUtilities__Transport_Setting__LR_Booking_Range]  DEFAULT ((0)) FOR [SettingsAndUtilities__Transport_Setting__LR_Booking_Range]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_MenuSetting_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[MenuSetting] ADD  CONSTRAINT [DF_MenuSetting_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PoductOpeningStock_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PoductOpeningStock] ADD  CONSTRAINT [DF_PoductOpeningStock_Amount]  DEFAULT ((0)) FOR [Quantity]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PoductOpeningStock_QuantityNos]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PoductOpeningStock] ADD  CONSTRAINT [DF_PoductOpeningStock_QuantityNos]  DEFAULT ((0)) FOR [QuantityNos]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PoductOpeningStock_QuantityLoose]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PoductOpeningStock] ADD  CONSTRAINT [DF_PoductOpeningStock_QuantityLoose]  DEFAULT ((0)) FOR [QuantityLoose]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PoductOpeningStock_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PoductOpeningStock] ADD  CONSTRAINT [DF_PoductOpeningStock_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_PoductOpeningStock_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[PoductOpeningStock] ADD  CONSTRAINT [DF_PoductOpeningStock_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_GstCess]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_GstCess]  DEFAULT ((0)) FOR [GstCentralCess]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_GstStateCess]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_GstStateCess]  DEFAULT ((0)) FOR [GstStateCess]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Active]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_RateUpdate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_RateUpdate]  DEFAULT ((1)) FOR [RateUpdate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_Discount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_Discount]  DEFAULT ((0)) FOR [Discount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Product_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Product__Active__6304A5CD]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF__Product__Active__6304A5CD]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductAmtCalcOn_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductAmtCalcOn] ADD  CONSTRAINT [DF_ProductAmtCalcOn_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductAm__Activ__64ECEE3F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductAmtCalcOn] ADD  CONSTRAINT [DF__ProductAm__Activ__64ECEE3F]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductBranchMapping_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductBranchMapping] ADD  CONSTRAINT [DF_ProductBranchMapping_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductBranchMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductBranchMapping] ADD  CONSTRAINT [DF_ProductBranchMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductBranchMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductBranchMapping] ADD  CONSTRAINT [DF_ProductBranchMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductCategory_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF_ProductCategory_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductCa__Activ__69B1A35C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductCategory] ADD  CONSTRAINT [DF__ProductCa__Activ__69B1A35C]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductColor_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductColor_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductColor_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductColor_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF_ProductColor_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductCo__Activ__6E765879]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductColor] ADD  CONSTRAINT [DF__ProductCo__Activ__6E765879]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductDesignNumber_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDesignNumber] ADD  CONSTRAINT [DF_ProductDesignNumber_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductDesignNumber_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDesignNumber] ADD  CONSTRAINT [DF_ProductDesignNumber_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductDesignNumber_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDesignNumber] ADD  CONSTRAINT [DF_ProductDesignNumber_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductDe__Activ__7246E95D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductDesignNumber] ADD  CONSTRAINT [DF__ProductDe__Activ__7246E95D]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductFabric_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductFabric] ADD  CONSTRAINT [DF_ProductFabric_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductFabric_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductFabric] ADD  CONSTRAINT [DF_ProductFabric_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductFabric_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductFabric] ADD  CONSTRAINT [DF_ProductFabric_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductFabric_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductFabric] ADD  CONSTRAINT [DF_ProductFabric_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductFa__Activ__770B9E7A]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductFabric] ADD  CONSTRAINT [DF__ProductFa__Activ__770B9E7A]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductGroup_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductGroup_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductGroup_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductGroup_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF_ProductGroup_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductGr__Activ__7BD05397]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductGroup] ADD  CONSTRAINT [DF__ProductGr__Activ__7BD05397]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductPacking_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductPacking] ADD  CONSTRAINT [DF_ProductPacking_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductPacking_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductPacking] ADD  CONSTRAINT [DF_ProductPacking_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductPacking_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductPacking] ADD  CONSTRAINT [DF_ProductPacking_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductPacking_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductPacking] ADD  CONSTRAINT [DF_ProductPacking_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductPa__Activ__009508B4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductPacking] ADD  CONSTRAINT [DF__ProductPa__Activ__009508B4]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductQltyType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductQualityType] ADD  CONSTRAINT [DF_ProductQltyType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductQu__Activ__027D5126]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductQualityType] ADD  CONSTRAINT [DF__ProductQu__Activ__027D5126]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductShadeNumber_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductShadeNumber] ADD  CONSTRAINT [DF_ProductShadeNumber_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductShadeNumber_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductShadeNumber] ADD  CONSTRAINT [DF_ProductShadeNumber_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductShadeNumber_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductShadeNumber] ADD  CONSTRAINT [DF_ProductShadeNumber_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductShadeNumber_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductShadeNumber] ADD  CONSTRAINT [DF_ProductShadeNumber_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductSh__Activ__07420643]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductShadeNumber] ADD  CONSTRAINT [DF__ProductSh__Activ__07420643]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSize_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSize_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSize_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSize_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF_ProductSize_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductSi__Activ__0C06BB60]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSize] ADD  CONSTRAINT [DF__ProductSi__Activ__0C06BB60]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSizeAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSizeAdmin] ADD  CONSTRAINT [DF_ProductSizeAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductSi__Activ__0DEF03D2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSizeAdmin] ADD  CONSTRAINT [DF__ProductSi__Activ__0DEF03D2]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductStockType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductStockType] ADD  CONSTRAINT [DF_ProductStockType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductSt__Activ__0FD74C44]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductStockType] ADD  CONSTRAINT [DF__ProductSt__Activ__0FD74C44]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSubGroup_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSubGroup_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSubGroup_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ProductSubGroup_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF_ProductSubGroup_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ProductSu__Activ__149C0161]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ProductSubGroup] ADD  CONSTRAINT [DF__ProductSu__Activ__149C0161]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReportTemplate_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportTemplate] ADD  CONSTRAINT [DF_ReportTemplate_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReportTemplate_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportTemplate] ADD  CONSTRAINT [DF_ReportTemplate_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_ReportTemplate_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportTemplate] ADD  CONSTRAINT [DF_ReportTemplate_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__ReportTem__Activ__186C9245]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[ReportTemplate] ADD  CONSTRAINT [DF__ReportTem__Activ__186C9245]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SalesBillFromAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SalesBillFromAdmin] ADD  CONSTRAINT [DF_SalesBillFromAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SalesBill__Activ__1A54DAB7]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SalesBillFromAdmin] ADD  CONSTRAINT [DF__SalesBill__Activ__1A54DAB7]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Software_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Software] ADD  CONSTRAINT [DF_Software_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Software__Active__1C3D2329]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Software] ADD  CONSTRAINT [DF__Software__Active__1C3D2329]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoftwarePlan_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoftwarePlan] ADD  CONSTRAINT [DF_SoftwarePlan_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_SoftwarePlan_Cost]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoftwarePlan] ADD  CONSTRAINT [DF_SoftwarePlan_Cost]  DEFAULT ((0)) FOR [Cost]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SoftwareP__Activ__1F198FD4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SoftwarePlan] ADD  CONSTRAINT [DF__SoftwareP__Activ__1F198FD4]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__State__Active__200DB40D]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[State] ADD  CONSTRAINT [DF__State__Active__200DB40D]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__SystemSet__NewRe__2101D846]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[SystemSetting] ADD  DEFAULT ((1)) FOR [NewRegistrationSoftwarePlanId]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Taluka__Active__21F5FC7F]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Taluka] ADD  CONSTRAINT [DF__Taluka__Active__21F5FC7F]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportDesc_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDesc] ADD  CONSTRAINT [DF_TransportDesc_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportDesc_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDesc] ADD  CONSTRAINT [DF_TransportDesc_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportDesc_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDesc] ADD  CONSTRAINT [DF_TransportDesc_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportDesc_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDesc] ADD  CONSTRAINT [DF_TransportDesc_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__26BAB19C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDesc] ADD  CONSTRAINT [DF__Transport__Activ__26BAB19C]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportDescAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDescAdmin] ADD  CONSTRAINT [DF_TransportDescAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__28A2FA0E]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportDescAdmin] ADD  CONSTRAINT [DF__Transport__Activ__28A2FA0E]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Table_1_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRBranchCityMapping] ADD  CONSTRAINT [DF_Table_1_IsDeleted]  DEFAULT ((0)) FOR [OrderNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRBranchCityMapping_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRBranchCityMapping] ADD  CONSTRAINT [DF_TransportLRBranchCityMapping_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRBranchCityMapping_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRBranchCityMapping] ADD  CONSTRAINT [DF_TransportLRBranchCityMapping_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__2C738AF2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRBranchCityMapping] ADD  CONSTRAINT [DF__Transport__Activ__2C738AF2]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRCharges_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRCharges] ADD  CONSTRAINT [DF_TransportLRCharges_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__2E5BD364]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRCharges] ADD  CONSTRAINT [DF__Transport__Activ__2E5BD364]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRDelivery_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRDelivery] ADD  CONSTRAINT [DF_TransportLRDelivery_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__30441BD6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRDelivery] ADD  CONSTRAINT [DF__Transport__Activ__30441BD6]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRDeliveryType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRDeliveryType] ADD  CONSTRAINT [DF_TransportLRDeliveryType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__322C6448]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRDeliveryType] ADD  CONSTRAINT [DF__Transport__Activ__322C6448]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRPayType_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRPayType] ADD  CONSTRAINT [DF_TransportLRPayType_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__3414ACBA]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRPayType] ADD  CONSTRAINT [DF__Transport__Activ__3414ACBA]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportLRRateOn_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRRateOn] ADD  CONSTRAINT [DF_TransportLRRateOn_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__35FCF52C]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportLRRateOn] ADD  CONSTRAINT [DF__Transport__Activ__35FCF52C]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportPacking_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPacking] ADD  CONSTRAINT [DF_TransportPacking_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportPacking_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPacking] ADD  CONSTRAINT [DF_TransportPacking_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportPacking_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPacking] ADD  CONSTRAINT [DF_TransportPacking_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportPacking_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPacking] ADD  CONSTRAINT [DF_TransportPacking_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__3AC1AA49]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPacking] ADD  CONSTRAINT [DF__Transport__Activ__3AC1AA49]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_TransportPackingAdmin_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPackingAdmin] ADD  CONSTRAINT [DF_TransportPackingAdmin_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Transport__Activ__3CA9F2BB]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[TransportPackingAdmin] ADD  CONSTRAINT [DF__Transport__Activ__3CA9F2BB]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehcileModel_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleModel] ADD  CONSTRAINT [DF_VehcileModel_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehcileModel_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleModel] ADD  CONSTRAINT [DF_VehcileModel_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehcileModel_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleModel] ADD  CONSTRAINT [DF_VehcileModel_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehicleModel_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleModel] ADD  CONSTRAINT [DF_VehicleModel_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VehicleMo__Activ__416EA7D8]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleModel] ADD  CONSTRAINT [DF__VehicleMo__Activ__416EA7D8]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehicleOwner_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleOwner] ADD  CONSTRAINT [DF_VehicleOwner_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehicleOwner_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleOwner] ADD  CONSTRAINT [DF_VehicleOwner_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehicleOwner_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleOwner] ADD  CONSTRAINT [DF_VehicleOwner_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_VehicleOwner_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleOwner] ADD  CONSTRAINT [DF_VehicleOwner_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__VehicleOw__Activ__46335CF5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[VehicleOwner] ADD  DEFAULT ((0)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vehilcle_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehilcle] ADD  CONSTRAINT [DF_Vehilcle_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vehilcle_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehilcle] ADD  CONSTRAINT [DF_Vehilcle_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vehilcle_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehilcle] ADD  CONSTRAINT [DF_Vehilcle_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Vehilcle_IsActive]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehilcle] ADD  CONSTRAINT [DF_Vehilcle_IsActive]  DEFAULT ((1)) FOR [IsActive]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF__Vehilcle__Active__4AF81212]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Vehilcle] ADD  CONSTRAINT [DF__Vehilcle__Active__4AF81212]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-AccountOutStanding-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] ADD  CONSTRAINT [DF_Z-AccountOutStanding-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-AccountOutStanding-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] ADD  CONSTRAINT [DF_Z-AccountOutStanding-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-AccountOutStanding-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] ADD  CONSTRAINT [DF_Z-AccountOutStanding-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteDetail-Z_Rate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteDetail-Z_Rate]  DEFAULT ((0)) FOR [Rate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteDetail-Z_BasicAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteDetail-Z_BasicAmount]  DEFAULT ((0)) FOR [BasicAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteDetail-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteDetail-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteDetail-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteDetail-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteDetail-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteDetail-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_SkipInGSTR]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_SkipInGSTR]  DEFAULT ((0)) FOR [SkipInGSTR]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TDSPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TDSPercentage]  DEFAULT ((0)) FOR [TDSPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TDSAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TDSAmount]  DEFAULT ((0)) FOR [TDSAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TDSPercentage1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TDSPercentage1]  DEFAULT ((0)) FOR [TCSPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TDSAmount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TDSAmount1]  DEFAULT ((0)) FOR [TCSAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TCSPercentage1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TCSPercentage1]  DEFAULT ((0)) FOR [SGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_TCSAmount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_TCSAmount1]  DEFAULT ((0)) FOR [SGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_SGSTPercentage1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_SGSTPercentage1]  DEFAULT ((0)) FOR [CGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_SGSTAmount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_SGSTAmount1]  DEFAULT ((0)) FOR [CGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_CGSTPercentage1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_CGSTPercentage1]  DEFAULT ((0)) FOR [IGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_CGSTAmount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_CGSTAmount1]  DEFAULT ((0)) FOR [IGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage1]  DEFAULT ((0)) FOR [GSTStateCessPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTAmount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTAmount1]  DEFAULT ((0)) FOR [GSTStateCessAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage2]  DEFAULT ((0)) FOR [GSTCentralCessPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTAmount2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTAmount2]  DEFAULT ((0)) FOR [GSTCentralCessAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTPercentage3]  DEFAULT ((0)) FOR [RoundOff]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IGSTAmount3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IGSTAmount3]  DEFAULT ((0)) FOR [BillAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-CreditDebitNoteMaster-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] ADD  CONSTRAINT [DF_Z-CreditDebitNoteMaster-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalDetail-Z_Amount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalDetail-Z] ADD  CONSTRAINT [DF_Z-JournalDetail-Z_Amount]  DEFAULT ((0)) FOR [Amount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalDetail-Z_SubSRNumber]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalDetail-Z] ADD  CONSTRAINT [DF_Z-JournalDetail-Z_SubSRNumber]  DEFAULT ((1)) FOR [SubSRNumber]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalDetail-Z_IsBillSelected]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalDetail-Z] ADD  CONSTRAINT [DF_Z-JournalDetail-Z_IsBillSelected]  DEFAULT ((0)) FOR [IsBillSelected]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalDetail-Z_IsAudit]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalDetail-Z] ADD  CONSTRAINT [DF_Z-JournalDetail-Z_IsAudit]  DEFAULT ((0)) FOR [IsAudit]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalMst-Z_Date]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalMaster-Z] ADD  CONSTRAINT [DF_Z-JournalMst-Z_Date]  DEFAULT (getutcdate()) FOR [Date]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalMst-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalMaster-Z] ADD  CONSTRAINT [DF_Z-JournalMst-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalMst-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalMaster-Z] ADD  CONSTRAINT [DF_Z-JournalMst-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-JournalMst-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-JournalMaster-Z] ADD  CONSTRAINT [DF_Z-JournalMst-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_LRDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_LRDate]  DEFAULT (getutcdate()) FOR [LRDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_IsSaleBilled]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_IsSaleBilled]  DEFAULT ((0)) FOR [IsSaleBilled]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_IsDispatched]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_IsDispatched]  DEFAULT ((0)) FOR [IsDispatched]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-LRBooking-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-LRBooking-Z] ADD  CONSTRAINT [DF_Z-LRBooking-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillDetail-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] ADD  CONSTRAINT [DF_Z-BillDetail-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillDetail-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] ADD  CONSTRAINT [DF_Z-BillDetail-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillDetail-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] ADD  CONSTRAINT [DF_Z-BillDetail-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillMaster-Z_BillDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD  CONSTRAINT [DF_Z-BillMaster-Z_BillDate]  DEFAULT (getutcdate()) FOR [BillDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillMaster-Z_SkipInGSTR]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD  CONSTRAINT [DF_Z-BillMaster-Z_SkipInGSTR]  DEFAULT ((0)) FOR [SkipInGSTR]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillMaster-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD  CONSTRAINT [DF_Z-BillMaster-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillMaster-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD  CONSTRAINT [DF_Z-BillMaster-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-BillMaster-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD  CONSTRAINT [DF_Z-BillMaster-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity]  DEFAULT ((0)) FOR [Quantity1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity1]  DEFAULT ((0)) FOR [Quantity2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity2]  DEFAULT ((0)) FOR [Quantity3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity3]  DEFAULT ((0)) FOR [Quantity4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity4]  DEFAULT ((0)) FOR [Quantity5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Quantity5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Quantity5]  DEFAULT ((0)) FOR [Quantity6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_DiscountPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_DiscountPercentage]  DEFAULT ((0)) FOR [DiscountPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_DiscountRs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_DiscountRs]  DEFAULT ((0)) FOR [DiscountAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate]  DEFAULT ((0)) FOR [Rate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate1]  DEFAULT ((0)) FOR [NetRate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate2]  DEFAULT ((0)) FOR [FreightAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate3]  DEFAULT ((0)) FOR [OtherCharges]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate4]  DEFAULT ((0)) FOR [BasicAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate11]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate11]  DEFAULT ((0)) FOR [SGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate21]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate21]  DEFAULT ((0)) FOR [SGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate31]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate31]  DEFAULT ((0)) FOR [CGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate5]  DEFAULT ((0)) FOR [CGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate12]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate12]  DEFAULT ((0)) FOR [IGSTPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate22]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate22]  DEFAULT ((0)) FOR [IGSTAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate32]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate32]  DEFAULT ((0)) FOR [GSTStateCessPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate6]  DEFAULT ((0)) FOR [GSTStateCessAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate13]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate13]  DEFAULT ((0)) FOR [GSTCentralCessPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_Rate23]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_Rate23]  DEFAULT ((0)) FOR [GSTCentralCessAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_QuantityDiscountPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_QuantityDiscountPercentage]  DEFAULT ((0)) FOR [QuantityDiscountPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_QuantityDiscountRs]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_QuantityDiscountRs]  DEFAULT ((0)) FOR [QuantityDiscountAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_SpDiscount1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_SpDiscount1]  DEFAULT ((0)) FOR [SpecialDiscount1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_SpecialDiscount11]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_SpecialDiscount11]  DEFAULT ((0)) FOR [SpecialDiscount2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_SpecialDiscount12]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_SpecialDiscount12]  DEFAULT ((0)) FOR [SpecialDiscount3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillDetail-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD  CONSTRAINT [DF_Z-SalesBillDetail-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_BillDate]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_BillDate]  DEFAULT (getutcdate()) FOR [BillDate]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_InvoiceMemo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_InvoiceMemo]  DEFAULT ('D') FOR [InvoiceMemo]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_CreditDays]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_CreditDays]  DEFAULT ((0)) FOR [CreditDays]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_TaxableAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_TaxableAmount]  DEFAULT ((0)) FOR [TaxableAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_SGSTTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_SGSTTotal]  DEFAULT ((0)) FOR [SGSTTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_CGSTTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_CGSTTotal]  DEFAULT ((0)) FOR [CGSTTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_IGSTTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_IGSTTotal]  DEFAULT ((0)) FOR [IGSTTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_GSTStateCessTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_GSTStateCessTotal]  DEFAULT ((0)) FOR [GSTStateCessTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_GSTCentralCessTotal]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_GSTCentralCessTotal]  DEFAULT ((0)) FOR [GSTCentralCessTotal]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_TCSPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_TCSPercentage]  DEFAULT ((0)) FOR [TCSPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_TCSAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_TCSAmount]  DEFAULT ((0)) FOR [TCSAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_TDSPercentage]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_TDSPercentage]  DEFAULT ((0)) FOR [TDSPercentage]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_TDSAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_TDSAmount]  DEFAULT ((0)) FOR [TDSAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_ExtraAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_ExtraAmount]  DEFAULT ((0)) FOR [ExtraAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_RoundOff]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_RoundOff]  DEFAULT ((0)) FOR [RoundOff]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_BillAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_BillAmount]  DEFAULT ((0)) FOR [BillAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_PaidAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_PaidAmount]  DEFAULT ((0)) FOR [PaidAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_UnPaidAmount]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_UnPaidAmount]  DEFAULT ((0)) FOR [UnPaidAmount]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge1]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge1]  DEFAULT ((0)) FOR [Charge1]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge2]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge2]  DEFAULT ((0)) FOR [Charge2]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge3]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge3]  DEFAULT ((0)) FOR [Charge3]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge4]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge4]  DEFAULT ((0)) FOR [Charge4]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge5]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge5]  DEFAULT ((0)) FOR [Charge5]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_Charge6]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge6]  DEFAULT ((0)) FOR [Charge6]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillMaster-Z_IsDeleted]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillMaster-Z_IsDeleted]  DEFAULT ((0)) FOR [IsDeleted]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillMaster-Z_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillMaster-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillMaster-Z_DeletedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD  CONSTRAINT [DF_Z-SalesBillMaster-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_AccountGroupAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountAdmin_AccountGroupAdmin] FOREIGN KEY([AccountGroupId])
REFERENCES [dbo].[AccountGroupAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_AccountGroupAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin] CHECK CONSTRAINT [FK_AccountAdmin_AccountGroupAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountAdmin_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin] CHECK CONSTRAINT [FK_AccountAdmin_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountAdmin_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin] CHECK CONSTRAINT [FK_AccountAdmin_Country]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountAdmin_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountAdmin_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountAdmin]'))
ALTER TABLE [dbo].[AccountAdmin] CHECK CONSTRAINT [FK_AccountAdmin_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroupMaster_AccountGroupHeaderMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountGroupAdmin]'))
ALTER TABLE [dbo].[AccountGroupAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroupMaster_AccountGroupHeaderMaster] FOREIGN KEY([AccountGroupHeaderId])
REFERENCES [dbo].[AccountGroupHeaderAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroupMaster_AccountGroupHeaderMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountGroupAdmin]'))
ALTER TABLE [dbo].[AccountGroupAdmin] CHECK CONSTRAINT [FK_AccountGroupMaster_AccountGroupHeaderMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroupMaster_AccountGroupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountGroupAdmin]'))
ALTER TABLE [dbo].[AccountGroupAdmin]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroupMaster_AccountGroupType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[AccountGroupType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroupMaster_AccountGroupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[AccountGroupAdmin]'))
ALTER TABLE [dbo].[AccountGroupAdmin] CHECK CONSTRAINT [FK_AccountGroupMaster_AccountGroupType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin] FOREIGN KEY([BookAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin1] FOREIGN KEY([TDSAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin10]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin10] FOREIGN KEY([RCMIGSTPayAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin10]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin10]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin11]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin11] FOREIGN KEY([RCMSGSTRecAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin11]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin11]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin12]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin12] FOREIGN KEY([RCMCGSTRecAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin12]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin12]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin13]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin13] FOREIGN KEY([RCMIGSTRecAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin13]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin13]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin14]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin14] FOREIGN KEY([RoundOffAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin14]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin14]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin2]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin2] FOREIGN KEY([TCSAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin2]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin3]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin3] FOREIGN KEY([SGSTAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin3]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin4]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin4] FOREIGN KEY([CGSTAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin4]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin5]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin5] FOREIGN KEY([IGSTAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin5]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin6]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin6] FOREIGN KEY([GSTStateCessAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin6]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin7]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin7] FOREIGN KEY([GSTCentralCessAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin7]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin7]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin8]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin8] FOREIGN KEY([RCMSGSTPayAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin8]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin8]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin9]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_AccountAdmin9] FOREIGN KEY([RCMCGSTPayAccountId])
REFERENCES [dbo].[AccountAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_AccountAdmin9]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_AccountAdmin9]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_BillTypeAdmin] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[BillTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_BillTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_BookTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin]  WITH CHECK ADD  CONSTRAINT [FK_BookAdmin_BookTypeAdmin] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[BookTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_BookTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
ALTER TABLE [dbo].[BookAdmin] CHECK CONSTRAINT [FK_BookAdmin_BookTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_Broker] FOREIGN KEY([Id])
REFERENCES [dbo].[Broker] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_Broker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_CustomerFirmBranch] FOREIGN KEY([OwnerBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker]  WITH CHECK ADD  CONSTRAINT [FK_Broker_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Broker_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Broker]'))
ALTER TABLE [dbo].[Broker] CHECK CONSTRAINT [FK_Broker_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessSoftwareMapping_Business] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping] CHECK CONSTRAINT [FK_BusinessSoftwareMapping_Business]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessSoftwareMapping_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping] CHECK CONSTRAINT [FK_BusinessSoftwareMapping_Software]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Taluka]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City]  WITH CHECK ADD  CONSTRAINT [FK_City_Taluka] FOREIGN KEY([TalukaId])
REFERENCES [dbo].[Taluka] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_City_Taluka]') AND parent_object_id = OBJECT_ID(N'[dbo].[City]'))
ALTER TABLE [dbo].[City] CHECK CONSTRAINT [FK_City_Taluka]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Customer_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Customer]'))
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Account_Delivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_Delivery] FOREIGN KEY([DeliveryAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Account_Delivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_Account_Delivery]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Account_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_Account_Shipping] FOREIGN KEY([ShippingAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Account_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_Account_Shipping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_AccountGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_AccountGroup] FOREIGN KEY([AccountGroupId])
REFERENCES [dbo].[CustomerAccountGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_AccountGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_AccountGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_CustomerFirmBrokerMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_CustomerFirmBrokerMapping] FOREIGN KEY([BrokerMappingId])
REFERENCES [dbo].[CustomerBrokerBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_CustomerFirmBrokerMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_CustomerFirmBrokerMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_GSTInvoiceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_Account_GSTInvoiceType] FOREIGN KEY([GSTInvoiceTypeId])
REFERENCES [dbo].[GSTInvoiceType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_GSTInvoiceType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_GSTInvoiceType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_Country]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_CustomerFirmBranch] FOREIGN KEY([OwnerBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping] CHECK CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping] CHECK CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping] CHECK CONSTRAINT [FK_CustomerAccountBranchMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmAccountMapping_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmAccountMapping_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmAccountMapping_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountBranchMapping]'))
ALTER TABLE [dbo].[CustomerAccountBranchMapping] CHECK CONSTRAINT [FK_CustomerFirmAccountMapping_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_AccountGroupHeader]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroup_AccountGroupHeader] FOREIGN KEY([AccountGroupHeaderId])
REFERENCES [dbo].[CustomerAccountGroupHeader] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_AccountGroupHeader]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup] CHECK CONSTRAINT [FK_AccountGroup_AccountGroupHeader]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_AccountGroupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroup_AccountGroupType] FOREIGN KEY([TypeId])
REFERENCES [dbo].[AccountGroupType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_AccountGroupType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup] CHECK CONSTRAINT [FK_AccountGroup_AccountGroupType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_AccountGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_AccountGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup] CHECK CONSTRAINT [FK_AccountGroup_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountGroup_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup] CHECK CONSTRAINT [FK_CustomerAccountGroup_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountGroup_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroup]'))
ALTER TABLE [dbo].[CustomerAccountGroup] CHECK CONSTRAINT [FK_CustomerAccountGroup_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroupHeader_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroupHeader]'))
ALTER TABLE [dbo].[CustomerAccountGroupHeader]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountGroupHeader_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroupHeader_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroupHeader]'))
ALTER TABLE [dbo].[CustomerAccountGroupHeader] CHECK CONSTRAINT [FK_CustomerAccountGroupHeader_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroupHeader_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroupHeader]'))
ALTER TABLE [dbo].[CustomerAccountGroupHeader]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountGroupHeader_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountGroupHeader_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountGroupHeader]'))
ALTER TABLE [dbo].[CustomerAccountGroupHeader] CHECK CONSTRAINT [FK_CustomerAccountGroupHeader_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerFirmAccountMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerFirmAccountMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerFirmAccountMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] CHECK CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerFirmAccountMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] CHECK CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] CHECK CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser2] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccountOpeningBalance_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] CHECK CONSTRAINT [FK_CustomerAccountOpeningBalance_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_BillType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_BillType] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[BillTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_BillType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_BillType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_BookType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_BookType] FOREIGN KEY([BookTypeId])
REFERENCES [dbo].[BookTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_BookType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_BookType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount] FOREIGN KEY([BookAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_CentralCessAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_CentralCessAccountId] FOREIGN KEY([GSTCentralCessAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_CentralCessAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_CentralCessAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_CGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_CGSTAccountId] FOREIGN KEY([CGSTAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_CGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_CGSTAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_IGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_IGSTAccountId] FOREIGN KEY([IGSTAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_IGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_IGSTAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmCGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmCGSTPayAccountId] FOREIGN KEY([RcmCGSTPayAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmCGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmCGSTPayAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmCGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmCGSTRecAccountId] FOREIGN KEY([RcmCGSTRecAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmCGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmCGSTRecAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmIGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmIGSTPayAccountId] FOREIGN KEY([RcmIGSTPayAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmIGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmIGSTPayAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmIGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmIGSTRecAccountId] FOREIGN KEY([RcmIGSTRecAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmIGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmIGSTRecAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmSGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmSGSTPayAccountId] FOREIGN KEY([RcmSGSTPayAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmSGSTPayAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmSGSTPayAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmSGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmSGSTRecAccountId] FOREIGN KEY([RcmSGSTRecAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RcmSGSTRecAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RcmSGSTRecAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RoundOffAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_RoundOffAccountId] FOREIGN KEY([RoundOffAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_RoundOffAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_RoundOffAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_SGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_SGSTAccountId] FOREIGN KEY([SGSTAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_SGSTAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_SGSTAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_StateCessAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_StateCessAccountId] FOREIGN KEY([GSTStateCessAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_StateCessAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_StateCessAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_TCSAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_TCSAccountId] FOREIGN KEY([TCSAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_TCSAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_TCSAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_TDSAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerAccount_TDSAccountId] FOREIGN KEY([TDSAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerAccount_TDSAccountId]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerAccount_TDSAccountId]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerFirmBranch] FOREIGN KEY([OwnerBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_FinanceYear]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_SalesBillFromAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBook_SalesBillFromAdmin] FOREIGN KEY([SalesBillFrom])
REFERENCES [dbo].[SalesBillFromAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_SalesBillFromAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
ALTER TABLE [dbo].[CustomerBook] CHECK CONSTRAINT [FK_CustomerBook_SalesBillFromAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerBook]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBookBranchMapping_CustomerBook] FOREIGN KEY([BookId])
REFERENCES [dbo].[CustomerBook] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerBook]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping] CHECK CONSTRAINT [FK_CustomerBookBranchMapping_CustomerBook]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBookBranchMapping_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping] CHECK CONSTRAINT [FK_CustomerBookBranchMapping_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBookBranchMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping] CHECK CONSTRAINT [FK_CustomerBookBranchMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBookBranchMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBookBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBookBranchMapping]'))
ALTER TABLE [dbo].[CustomerBookBranchMapping] CHECK CONSTRAINT [FK_CustomerBookBranchMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] CHECK CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] CHECK CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBrokerBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] CHECK CONSTRAINT [FK_CustomerBrokerBranchMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBrokerMapping_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBrokerMapping_Broker] FOREIGN KEY([BrokerId])
REFERENCES [dbo].[Broker] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBrokerMapping_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBrokerBranchMapping]'))
ALTER TABLE [dbo].[CustomerBrokerBranchMapping] CHECK CONSTRAINT [FK_CustomerFirmBrokerMapping_Broker]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_Business] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_Business]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_CustomerUser] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_FirmType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_FirmType] FOREIGN KEY([FirmTypeId])
REFERENCES [dbo].[FirmTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_FirmType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_FirmType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_GSTFirmType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_GSTFirmType] FOREIGN KEY([GstFirmTypeId])
REFERENCES [dbo].[GSTFirmType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_GSTFirmType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_GSTFirmType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirm_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirm_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirm]'))
ALTER TABLE [dbo].[CustomerFirm] CHECK CONSTRAINT [FK_CustomerFirm_Software]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_Country]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_Country]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_CustomerFirm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_CustomerUser2] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_FirmBranchType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_FirmBranchType] FOREIGN KEY([FirmBranchTypeId])
REFERENCES [dbo].[FirmBranchTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_FirmBranchType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_FirmBranchType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_SoftwarePlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_SoftwarePlan] FOREIGN KEY([SoftwarePlanId])
REFERENCES [dbo].[SoftwarePlan] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_SoftwarePlan]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_SoftwarePlan]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranch_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranch_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]'))
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchLRRate_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] CHECK CONSTRAINT [FK_CustomerFirmBranchLRRate_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] CHECK CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] CHECK CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchLRRate_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchLRRate]'))
ALTER TABLE [dbo].[CustomerFirmBranchLRRate] CHECK CONSTRAINT [FK_CustomerFirmBranchLRRate_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportContractRateSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportContractRateSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportContractRateSetting_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping] FOREIGN KEY([ToPayAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping1] FOREIGN KEY([CrossingAmountAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping2] FOREIGN KEY([CrossingCommissionAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping3] FOREIGN KEY([CrossingHamaliAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping4]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping4] FOREIGN KEY([CrossingDeliveryChargeAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping4]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping5]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping5] FOREIGN KEY([SalesAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping5]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerAccountBranchMapping5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping] FOREIGN KEY([PurcahseBookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping1] FOREIGN KEY([BookingSalesBookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping2] FOREIGN KEY([DeliverySalesBookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_TransportLRPayType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_TransportLRPayType] FOREIGN KEY([LRPayTypeId])
REFERENCES [dbo].[TransportLRPayType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_TransportLRPayType]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_TransportLRPayType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_TransportLRRateOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmBranchTransportSetting_TransportLRRateOn] FOREIGN KEY([LRRateOnId])
REFERENCES [dbo].[TransportLRRateOn] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_TransportLRRateOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_TransportLRRateOn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerFirm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmTransportSetting_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFirmTransportSetting_Product] FOREIGN KEY([ProductIdForSales])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmTransportSetting_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmTransportSetting_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUser_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUser]'))
ALTER TABLE [dbo].[CustomerUser]  WITH CHECK ADD  CONSTRAINT [FK_CustomerUser_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUser_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUser]'))
ALTER TABLE [dbo].[CustomerUser] CHECK CONSTRAINT [FK_CustomerUser_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUser_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUser]'))
ALTER TABLE [dbo].[CustomerUser]  WITH CHECK ADD  CONSTRAINT [FK_CustomerUser_CustomerFirmBranch] FOREIGN KEY([OwnerBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUser_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUser]'))
ALTER TABLE [dbo].[CustomerUser] CHECK CONSTRAINT [FK_CustomerUser_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUserBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserBranchMapping]'))
ALTER TABLE [dbo].[CustomerUserBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerUserBranchMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUserBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserBranchMapping]'))
ALTER TABLE [dbo].[CustomerUserBranchMapping] CHECK CONSTRAINT [FK_CustomerUserBranchMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUserBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserBranchMapping]'))
ALTER TABLE [dbo].[CustomerUserBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerUserBranchMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerUserBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerUserBranchMapping]'))
ALTER TABLE [dbo].[CustomerUserBranchMapping] CHECK CONSTRAINT [FK_CustomerUserBranchMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_District_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[District]'))
ALTER TABLE [dbo].[District]  WITH CHECK ADD  CONSTRAINT [FK_District_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_District_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[District]'))
ALTER TABLE [dbo].[District] CHECK CONSTRAINT [FK_District_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_CustomerUser2] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_District]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_District] FOREIGN KEY([LicenceIssuePlaceId])
REFERENCES [dbo].[District] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_District]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_District]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_DriverType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_DriverType] FOREIGN KEY([DriverTypeId])
REFERENCES [dbo].[DriverTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_DriverType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_DriverType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver]  WITH CHECK ADD  CONSTRAINT [FK_Driver_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Driver_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Driver]'))
ALTER TABLE [dbo].[Driver] CHECK CONSTRAINT [FK_Driver_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FinanceYear_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[FinanceYear]'))
ALTER TABLE [dbo].[FinanceYear]  WITH CHECK ADD  CONSTRAINT [FK_FinanceYear_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_FinanceYear_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[FinanceYear]'))
ALTER TABLE [dbo].[FinanceYear] CHECK CONSTRAINT [FK_FinanceYear_CustomerFirm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange]  WITH CHECK ADD  CONSTRAINT [FK_LRBookingRange_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange] CHECK CONSTRAINT [FK_LRBookingRange_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange]  WITH CHECK ADD  CONSTRAINT [FK_LRBookingRange_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange] CHECK CONSTRAINT [FK_LRBookingRange_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange]  WITH CHECK ADD  CONSTRAINT [FK_LRBookingRange_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRBookingRange_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange] CHECK CONSTRAINT [FK_LRBookingRange_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRRange_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange]  WITH CHECK ADD  CONSTRAINT [FK_LRRange_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_LRRange_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[LRBookingRange]'))
ALTER TABLE [dbo].[LRBookingRange] CHECK CONSTRAINT [FK_LRRange_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MenuSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[MenuSetting]'))
ALTER TABLE [dbo].[MenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_MenuSetting_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MenuSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[MenuSetting]'))
ALTER TABLE [dbo].[MenuSetting] CHECK CONSTRAINT [FK_MenuSetting_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MenuSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MenuSetting]'))
ALTER TABLE [dbo].[MenuSetting]  WITH CHECK ADD  CONSTRAINT [FK_MenuSetting_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_MenuSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[MenuSetting]'))
ALTER TABLE [dbo].[MenuSetting] CHECK CONSTRAINT [FK_MenuSetting_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_FinanceYear]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock]  WITH CHECK ADD  CONSTRAINT [FK_PoductOpeningStock_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PoductOpeningStock_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[PoductOpeningStock]'))
ALTER TABLE [dbo].[PoductOpeningStock] CHECK CONSTRAINT [FK_PoductOpeningStock_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Color] FOREIGN KEY([ColourId])
REFERENCES [dbo].[ProductColor] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Color]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Color]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTCalculation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GSTCalculation] FOREIGN KEY([GSTCalculationId])
REFERENCES [dbo].[GSTCalculation] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTCalculation]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GSTCalculation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTRate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GSTRate] FOREIGN KEY([GSTRateId])
REFERENCES [dbo].[GSTRate] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTRate]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GSTRate]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTUQC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_GSTUQC] FOREIGN KEY([UQCId])
REFERENCES [dbo].[GSTUQC] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_GSTUQC]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_GSTUQC]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductAmtCalcOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductAmtCalcOn] FOREIGN KEY([AmountCalcId])
REFERENCES [dbo].[ProductAmtCalcOn] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductAmtCalcOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductAmtCalcOn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductCategory] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[ProductCategory] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductCategory]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductCategory]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductDesignNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductDesignNumber] FOREIGN KEY([DesignNumberId])
REFERENCES [dbo].[ProductDesignNumber] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductDesignNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductDesignNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductFabric]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductFabric] FOREIGN KEY([FabricId])
REFERENCES [dbo].[ProductFabric] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductFabric]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductFabric]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductGroup] FOREIGN KEY([GroupId])
REFERENCES [dbo].[ProductGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductPacking]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductPacking] FOREIGN KEY([PackingId])
REFERENCES [dbo].[ProductPacking] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductPacking]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductPacking]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductQualityType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductQualityType] FOREIGN KEY([QualityTypeId])
REFERENCES [dbo].[ProductQualityType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductQualityType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductQualityType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductShadeNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductShadeNumber] FOREIGN KEY([ShadeNumberId])
REFERENCES [dbo].[ProductShadeNumber] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductShadeNumber]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductShadeNumber]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSize] FOREIGN KEY([SizeId])
REFERENCES [dbo].[ProductSize] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductSize]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSize]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductStockType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductStockType] FOREIGN KEY([StockTypeId])
REFERENCES [dbo].[ProductStockType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductStockType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductStockType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductSubGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductSubGroup] FOREIGN KEY([SubGroupId])
REFERENCES [dbo].[ProductSubGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Product_ProductSubGroup]') AND parent_object_id = OBJECT_ID(N'[dbo].[Product]'))
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductSubGroup]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAmtCalcOn_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAmtCalcOn]'))
ALTER TABLE [dbo].[ProductAmtCalcOn]  WITH CHECK ADD  CONSTRAINT [FK_ProductAmtCalcOn_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductAmtCalcOn_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductAmtCalcOn]'))
ALTER TABLE [dbo].[ProductAmtCalcOn] CHECK CONSTRAINT [FK_ProductAmtCalcOn_Software]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductBranchMapping_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping] CHECK CONSTRAINT [FK_ProductBranchMapping_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductBranchMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping] CHECK CONSTRAINT [FK_ProductBranchMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductBranchMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping] CHECK CONSTRAINT [FK_ProductBranchMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_ProductBranchMapping_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductBranchMapping_Product]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductBranchMapping]'))
ALTER TABLE [dbo].[ProductBranchMapping] CHECK CONSTRAINT [FK_ProductBranchMapping_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor]  WITH CHECK ADD  CONSTRAINT [FK_ProductColor_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductColor_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductColor]'))
ALTER TABLE [dbo].[ProductColor] CHECK CONSTRAINT [FK_ProductColor_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductDesignNumber_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber] CHECK CONSTRAINT [FK_ProductDesignNumber_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductDesignNumber_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber] CHECK CONSTRAINT [FK_ProductDesignNumber_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductDesignNumber_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber] CHECK CONSTRAINT [FK_ProductDesignNumber_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductDesignNumber_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductDesignNumber_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductDesignNumber]'))
ALTER TABLE [dbo].[ProductDesignNumber] CHECK CONSTRAINT [FK_ProductDesignNumber_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric]  WITH CHECK ADD  CONSTRAINT [FK_ProductFabric_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric] CHECK CONSTRAINT [FK_ProductFabric_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric]  WITH CHECK ADD  CONSTRAINT [FK_ProductFabric_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric] CHECK CONSTRAINT [FK_ProductFabric_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric]  WITH CHECK ADD  CONSTRAINT [FK_ProductFabric_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric] CHECK CONSTRAINT [FK_ProductFabric_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric]  WITH CHECK ADD  CONSTRAINT [FK_ProductFabric_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductFabric_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductFabric]'))
ALTER TABLE [dbo].[ProductFabric] CHECK CONSTRAINT [FK_ProductFabric_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductGroup_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductGroup_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductGroup]'))
ALTER TABLE [dbo].[ProductGroup] CHECK CONSTRAINT [FK_ProductGroup_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking]  WITH CHECK ADD  CONSTRAINT [FK_ProductPacking_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking] CHECK CONSTRAINT [FK_ProductPacking_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking]  WITH CHECK ADD  CONSTRAINT [FK_ProductPacking_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking] CHECK CONSTRAINT [FK_ProductPacking_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking]  WITH CHECK ADD  CONSTRAINT [FK_ProductPacking_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking] CHECK CONSTRAINT [FK_ProductPacking_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking]  WITH CHECK ADD  CONSTRAINT [FK_ProductPacking_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductPacking_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductPacking]'))
ALTER TABLE [dbo].[ProductPacking] CHECK CONSTRAINT [FK_ProductPacking_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductShadeNumber_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber] CHECK CONSTRAINT [FK_ProductShadeNumber_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductShadeNumber_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber] CHECK CONSTRAINT [FK_ProductShadeNumber_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductShadeNumber_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber] CHECK CONSTRAINT [FK_ProductShadeNumber_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber]  WITH CHECK ADD  CONSTRAINT [FK_ProductShadeNumber_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductShadeNumber_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductShadeNumber]'))
ALTER TABLE [dbo].[ProductShadeNumber] CHECK CONSTRAINT [FK_ProductShadeNumber_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize]  WITH CHECK ADD  CONSTRAINT [FK_ProductSize_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSize_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSize]'))
ALTER TABLE [dbo].[ProductSize] CHECK CONSTRAINT [FK_ProductSize_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup]  WITH CHECK ADD  CONSTRAINT [FK_ProductSubGroup_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ProductSubGroup_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ProductSubGroup]'))
ALTER TABLE [dbo].[ProductSubGroup] CHECK CONSTRAINT [FK_ProductSubGroup_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate]  WITH CHECK ADD  CONSTRAINT [FK_ReportTemplate_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate] CHECK CONSTRAINT [FK_ReportTemplate_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate]  WITH CHECK ADD  CONSTRAINT [FK_ReportTemplate_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate] CHECK CONSTRAINT [FK_ReportTemplate_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate]  WITH CHECK ADD  CONSTRAINT [FK_ReportTemplate_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate] CHECK CONSTRAINT [FK_ReportTemplate_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate]  WITH CHECK ADD  CONSTRAINT [FK_ReportTemplate_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_ReportTemplate_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[ReportTemplate]'))
ALTER TABLE [dbo].[ReportTemplate] CHECK CONSTRAINT [FK_ReportTemplate_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwarePlan_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwarePlan]'))
ALTER TABLE [dbo].[SoftwarePlan]  WITH CHECK ADD  CONSTRAINT [FK_SoftwarePlan_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SoftwarePlan_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[SoftwarePlan]'))
ALTER TABLE [dbo].[SoftwarePlan] CHECK CONSTRAINT [FK_SoftwarePlan_Software]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_CountryMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[State]'))
ALTER TABLE [dbo].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_CountryMaster] FOREIGN KEY([CountryId])
REFERENCES [dbo].[Country] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_State_CountryMaster]') AND parent_object_id = OBJECT_ID(N'[dbo].[State]'))
ALTER TABLE [dbo].[State] CHECK CONSTRAINT [FK_State_CountryMaster]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taluka_District]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taluka]'))
ALTER TABLE [dbo].[Taluka]  WITH CHECK ADD  CONSTRAINT [FK_Taluka_District] FOREIGN KEY([DistrictId])
REFERENCES [dbo].[District] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Taluka_District]') AND parent_object_id = OBJECT_ID(N'[dbo].[Taluka]'))
ALTER TABLE [dbo].[Taluka] CHECK CONSTRAINT [FK_Taluka_District]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc]  WITH CHECK ADD  CONSTRAINT [FK_TransportDesc_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc] CHECK CONSTRAINT [FK_TransportDesc_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc]  WITH CHECK ADD  CONSTRAINT [FK_TransportDesc_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc] CHECK CONSTRAINT [FK_TransportDesc_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc]  WITH CHECK ADD  CONSTRAINT [FK_TransportDesc_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc] CHECK CONSTRAINT [FK_TransportDesc_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc]  WITH CHECK ADD  CONSTRAINT [FK_TransportDesc_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportDesc_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportDesc]'))
ALTER TABLE [dbo].[TransportDesc] CHECK CONSTRAINT [FK_TransportDesc_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransportLRBranchCityMapping_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping] CHECK CONSTRAINT [FK_TransportLRBranchCityMapping_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping] CHECK CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping] CHECK CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping]  WITH CHECK ADD  CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportLRBranchCityMapping_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportLRBranchCityMapping]'))
ALTER TABLE [dbo].[TransportLRBranchCityMapping] CHECK CONSTRAINT [FK_TransportLRBranchCityMapping_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking]  WITH CHECK ADD  CONSTRAINT [FK_TransportPacking_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking] CHECK CONSTRAINT [FK_TransportPacking_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking]  WITH CHECK ADD  CONSTRAINT [FK_TransportPacking_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking] CHECK CONSTRAINT [FK_TransportPacking_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking]  WITH CHECK ADD  CONSTRAINT [FK_TransportPacking_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking] CHECK CONSTRAINT [FK_TransportPacking_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking]  WITH CHECK ADD  CONSTRAINT [FK_TransportPacking_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_TransportPacking_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[TransportPacking]'))
ALTER TABLE [dbo].[TransportPacking] CHECK CONSTRAINT [FK_TransportPacking_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel]  WITH CHECK ADD  CONSTRAINT [FK_VehicleModel_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleModel_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleModel]'))
ALTER TABLE [dbo].[VehicleModel] CHECK CONSTRAINT [FK_VehicleModel_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_Account] FOREIGN KEY([AccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_Account]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner]  WITH CHECK ADD  CONSTRAINT [FK_VehicleOwner_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_VehicleOwner_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[VehicleOwner]'))
ALTER TABLE [dbo].[VehicleOwner] CHECK CONSTRAINT [FK_VehicleOwner_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_State] FOREIGN KEY([StateId])
REFERENCES [dbo].[State] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_State]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_State]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_VehcileModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_VehcileModel] FOREIGN KEY([ModelId])
REFERENCES [dbo].[VehicleModel] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_VehcileModel]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_VehcileModel]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_VehicleOwner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle]  WITH CHECK ADD  CONSTRAINT [FK_Vehilcle_VehicleOwner] FOREIGN KEY([OwnerId])
REFERENCES [dbo].[VehicleOwner] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Vehilcle_VehicleOwner]') AND parent_object_id = OBJECT_ID(N'[dbo].[Vehilcle]'))
ALTER TABLE [dbo].[Vehilcle] CHECK CONSTRAINT [FK_Vehilcle_VehicleOwner]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] CHECK CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] CHECK CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] CHECK CONSTRAINT [FK_Z-AccountOutStanding-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_Z-BillDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-AccountOutStanding-Z_Z-BillDetail-Z] FOREIGN KEY([JournalDetailId])
REFERENCES [dbo].[Z-PurchaseBillDetail-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-AccountOutStanding-Z_Z-BillDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] CHECK CONSTRAINT [FK_Z-AccountOutStanding-Z_Z-BillDetail-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_ProductBranchMapping] FOREIGN KEY([ProductBranchMappingId])
REFERENCES [dbo].[ProductBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_ProductBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-AccountOutStanding-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-AccountOutStanding-Z] FOREIGN KEY([BillOutstandingId])
REFERENCES [dbo].[Z-AccountOutStanding-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-AccountOutStanding-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-AccountOutStanding-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-CreditDebitNoteMaster-Z] FOREIGN KEY([CreditDebitNoteMasterId])
REFERENCES [dbo].[Z-CreditDebitNoteMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-CreditDebitNoteMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-PurchaseBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-PurchaseBillMaster-Z] FOREIGN KEY([PurchaseBillNumberId])
REFERENCES [dbo].[Z-PurchaseBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-PurchaseBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-PurchaseBillMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-SalesBillmaster-Z] FOREIGN KEY([SalesBillNumberId])
REFERENCES [dbo].[Z-SalesBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteDetail-Z_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteDetail-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteDetail-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteDetail-Z_Z-SalesBillmaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_BillEntryTypeAdmin] FOREIGN KEY([EntryTypeId])
REFERENCES [dbo].[BillEntryTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_BillEntryTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping1] FOREIGN KEY([AccountBranchMappingIdOther])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping2] FOREIGN KEY([TDSAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerAccountBranchMapping2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerBookBranchMapping] FOREIGN KEY([BookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerBookBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_GSTReason] FOREIGN KEY([ReturnReasonId])
REFERENCES [dbo].[GSTReason] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_GSTReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_ProductBranchMapping] FOREIGN KEY([ProductBranchMappingId])
REFERENCES [dbo].[ProductBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_ProductBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_Z-PurchaseBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_Z-PurchaseBillMaster-Z] FOREIGN KEY([PurchaseBillMasterId])
REFERENCES [dbo].[Z-PurchaseBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_Z-PurchaseBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_Z-PurchaseBillMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_Z-SalesBillmaster-Z] FOREIGN KEY([SalesBillMasterId])
REFERENCES [dbo].[Z-SalesBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-CreditDebitNoteMaster-Z_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [FK_Z-CreditDebitNoteMaster-Z_Z-SalesBillmaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalDetail-Z_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z] CHECK CONSTRAINT [FK_Z-JournalDetail-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalDetail-Z_CustomerAccountBranchMapping1] FOREIGN KEY([AccountBranchMappingIdOther])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z] CHECK CONSTRAINT [FK_Z-JournalDetail-Z_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_Z-JournalDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalDetail-Z_Z-JournalDetail-Z] FOREIGN KEY([ParentJournalDetailId])
REFERENCES [dbo].[Z-JournalDetail-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_Z-JournalDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z] CHECK CONSTRAINT [FK_Z-JournalDetail-Z_Z-JournalDetail-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_Z-JournalMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalDetail-Z_Z-JournalMaster-Z] FOREIGN KEY([JournalId])
REFERENCES [dbo].[Z-JournalMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalDetail-Z_Z-JournalMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z] CHECK CONSTRAINT [FK_Z-JournalDetail-Z_Z-JournalMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMaster-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMst-Z_BillEntryTypeAdmin] FOREIGN KEY([EntryTypeId])
REFERENCES [dbo].[BillEntryTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMst-Z_BillEntryTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMst-Z_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMst-Z_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-JournalMst-Z_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-JournalMst-Z_FinanceYear]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalMaster-Z]'))
ALTER TABLE [dbo].[Z-JournalMaster-Z] CHECK CONSTRAINT [FK_Z-JournalMst-Z_FinanceYear]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-ChallanLR-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChallanLR-Z_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-ChallanLR-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-ChallanLR-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_City] FOREIGN KEY([CityIdFrom])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_City1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_City1] FOREIGN KEY([CityIdTo])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_City1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_City1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerAccountBranchMapping] FOREIGN KEY([DeliveryAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerAccountBranchMapping1] FOREIGN KEY([BillAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerBookBranchMapping] FOREIGN KEY([BookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerBookBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser1] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser2] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser3] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_CustomerUser3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_CustomerUser3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_ProductBranchMapping] FOREIGN KEY([ProductBranchMappingId])
REFERENCES [dbo].[ProductBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_ProductBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_ProductPacking]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_ProductPacking] FOREIGN KEY([PackingId])
REFERENCES [dbo].[ProductPacking] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_ProductPacking]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_ProductPacking]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportDesc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_TransportDesc] FOREIGN KEY([DescriptionId])
REFERENCES [dbo].[TransportDesc] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportDesc]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_TransportDesc]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRDelivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_TransportLRDelivery] FOREIGN KEY([LRDeliveryId])
REFERENCES [dbo].[TransportLRDelivery] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRDelivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_TransportLRDelivery]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRDeliveryType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_TransportLRDeliveryType] FOREIGN KEY([LRDeliveryTypeId])
REFERENCES [dbo].[TransportLRDeliveryType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRDeliveryType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_TransportLRDeliveryType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRPayType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_TransportLRPayType] FOREIGN KEY([LRPayTypeId])
REFERENCES [dbo].[TransportLRPayType] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRPayType]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_TransportLRPayType]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRRateOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_TransportLRRateOn] FOREIGN KEY([LRRateOnId])
REFERENCES [dbo].[TransportLRRateOn] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_TransportLRRateOn]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_TransportLRRateOn]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_Vehilcle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-LRBooking-Z_Vehilcle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehilcle] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-LRBooking-Z_Vehilcle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-LRBooking-Z]'))
ALTER TABLE [dbo].[Z-LRBooking-Z] CHECK CONSTRAINT [FK_Z-LRBooking-Z_Vehilcle]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillDetail-Z_ProductBranchMapping] FOREIGN KEY([ProductBranchMappingId])
REFERENCES [dbo].[ProductBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-BillDetail-Z_ProductBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_Z-BillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillDetail-Z_Z-BillMaster-Z] FOREIGN KEY([PurchaseBillMasterId])
REFERENCES [dbo].[Z-PurchaseBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_Z-BillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-BillDetail-Z_Z-BillMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillDetail-Z_Z-LRBooking-Z] FOREIGN KEY([LRBookingId])
REFERENCES [dbo].[Z-LRBooking-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillDetail-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-BillDetail-Z_Z-LRBooking-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillDetail-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillDetail-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillDetail-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_BillEntryTypeAdmin] FOREIGN KEY([EntryTypeId])
REFERENCES [dbo].[BillEntryTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_BillEntryTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_BillTypeAdmin] FOREIGN KEY([BillTypeID])
REFERENCES [dbo].[BillTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_BillTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_City_From]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_City_From] FOREIGN KEY([CityIdFrom])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_City_From]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_City_From]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_City_To]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_City_To] FOREIGN KEY([CityIdTo])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_City_To]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_City_To]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping1] FOREIGN KEY([ToPayAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping2] FOREIGN KEY([CrossingAmountAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping3] FOREIGN KEY([CrossingCommissionAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping4]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping4] FOREIGN KEY([CrossingHamaliAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping4]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping4]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping5] FOREIGN KEY([CrossingDeliveryAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping5]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping5]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping6] FOREIGN KEY([SalesAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping6]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping6]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping7] FOREIGN KEY([GenaralPurchaseAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping7]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping7]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping8]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping8] FOREIGN KEY([RCMId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerAccountBranchMapping8]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerAccountBranchMapping8]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerBookBranchMapping] FOREIGN KEY([BookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerBookBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerBrokerBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerBrokerBranchMapping] FOREIGN KEY([BrokerBranchMappingId])
REFERENCES [dbo].[CustomerBrokerBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerBrokerBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerBrokerBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_CustomerFirmBranch] FOREIGN KEY([DeliveryBranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_CustomerFirmBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_CustomerFirmBranch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_Driver]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_Driver]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_Driver]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_GSTReason] FOREIGN KEY([ReturnReasonId])
REFERENCES [dbo].[GSTReason] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_GSTReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_Vehilcle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-BillMaster-Z_Vehilcle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehilcle] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-BillMaster-Z_Vehilcle]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-BillMaster-Z_Vehilcle]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillMaster-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetailExport-Z_Z-SalesBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetailExport-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetailExport-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetailExport-Z_Z-SalesBillMaster-Z] FOREIGN KEY([SalesBillMasterId])
REFERENCES [dbo].[Z-SalesBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetailExport-Z_Z-SalesBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetailExport-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetailExport-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetailExport-Z_Z-SalesBillMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_ProductBranchMapping] FOREIGN KEY([ProductBranchMappingId])
REFERENCES [dbo].[ProductBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_ProductBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_ProductBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-BillDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-BillDetail-Z] FOREIGN KEY([BillDetailId])
REFERENCES [dbo].[Z-PurchaseBillDetail-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-BillDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-BillDetail-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-LRBooking-Z] FOREIGN KEY([LRBookingId])
REFERENCES [dbo].[Z-LRBooking-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-LRBooking-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-SalesBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-SalesBillMaster-Z] FOREIGN KEY([SalesBillMasterId])
REFERENCES [dbo].[Z-SalesBillMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillDetail-Z_Z-SalesBillMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_Z-SalesBillDetail-Z_Z-SalesBillMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_BillEntryTypeAdmin] FOREIGN KEY([EntryTypeId])
REFERENCES [dbo].[BillEntryTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_BillEntryTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_BillEntryTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_BillTypeAdmin] FOREIGN KEY([BillTypeId])
REFERENCES [dbo].[BillTypeAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_BillTypeAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_BillTypeAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_City] FOREIGN KEY([ToStationCityId])
REFERENCES [dbo].[City] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_City]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_City]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping1] FOREIGN KEY([DeliveryPartyAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping2] FOREIGN KEY([ShippingAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping3] FOREIGN KEY([HastePartyAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping3]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerAccountBranchMapping3]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerBookBranchMapping] FOREIGN KEY([BookBranchMappingId])
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerBookBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerBookBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerBrokerBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerBrokerBranchMapping] FOREIGN KEY([BrokerBranchMappingId])
REFERENCES [dbo].[CustomerBrokerBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_CustomerBrokerBranchMapping]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_CustomerBrokerBranchMapping]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_CustomerUser2]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_CustomerUser2]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_GSTReason] FOREIGN KEY([ReturnReasonId])
REFERENCES [dbo].[GSTReason] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_GSTReason]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_GSTReason]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_GSTTransportMode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_GSTTransportMode] FOREIGN KEY([TransportModeId])
REFERENCES [dbo].[GSTTransportMode] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_GSTTransportMode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_GSTTransportMode]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_SalesBillFromAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_SalesBillFromAdmin] FOREIGN KEY([SalesBillFromId])
REFERENCES [dbo].[SalesBillFromAdmin] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_SalesBillFromAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_SalesBillFromAdmin]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillMaster-Z_Z-CreditDebitNoteMaster-Z] FOREIGN KEY([CreditNoteId])
REFERENCES [dbo].[Z-CreditDebitNoteMaster-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillMaster-Z_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillMaster-Z_Z-CreditDebitNoteMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-SalesBillmaster-Z_Z-LRBooking-Z] FOREIGN KEY([DeliveryLRBookingId])
REFERENCES [dbo].[Z-LRBooking-Z] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-SalesBillmaster-Z_Z-LRBooking-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_Z-SalesBillmaster-Z_Z-LRBooking-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_CustomerAccountOpeningBalance]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance]  WITH CHECK ADD  CONSTRAINT [CK_CustomerAccountOpeningBalance] CHECK  (([Type]='C' OR [Type]='D'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_CustomerAccountOpeningBalance]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccountOpeningBalance]'))
ALTER TABLE [dbo].[CustomerAccountOpeningBalance] CHECK CONSTRAINT [CK_CustomerAccountOpeningBalance]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-AccountOutStanding-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z]  WITH CHECK ADD  CONSTRAINT [CK_Z-AccountOutStanding-Z] CHECK  (([Type]='P' OR [Type]='S'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-AccountOutStanding-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-AccountOutStanding-Z]'))
ALTER TABLE [dbo].[Z-AccountOutStanding-Z] CHECK CONSTRAINT [CK_Z-AccountOutStanding-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [CK_Z-CreditDebitNoteMaster-Z] CHECK  (([BillType]='P' OR [BillType]='S'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-CreditDebitNoteMaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [CK_Z-CreditDebitNoteMaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-CreditDebitNoteMaster-Z_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z]  WITH CHECK ADD  CONSTRAINT [CK_Z-CreditDebitNoteMaster-Z_1] CHECK  (([TDSPercentage]<=(100)))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-CreditDebitNoteMaster-Z_1]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-CreditDebitNoteMaster-Z]'))
ALTER TABLE [dbo].[Z-CreditDebitNoteMaster-Z] CHECK CONSTRAINT [CK_Z-CreditDebitNoteMaster-Z_1]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-JournalDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z]  WITH CHECK ADD  CONSTRAINT [CK_Z-JournalDetail-Z] CHECK  (([Type]='D' OR [Type]='C'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-JournalDetail-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-JournalDetail-Z]'))
ALTER TABLE [dbo].[Z-JournalDetail-Z] CHECK CONSTRAINT [CK_Z-JournalDetail-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [CK_Z-SalesBillmaster-Z] CHECK  (([InvoiceMemo]='D' OR [InvoiceMemo]='C'))
GO
IF  EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [CK_Z-SalesBillmaster-Z]
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'BookAdmin', N'COLUMN',N'SalesBillFrom'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Chalan 2 = Issue 3 = Receive	' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'BookAdmin', @level2type=N'COLUMN',@level2name=N'SalesBillFrom'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Customer', N'COLUMN',N'CustomerType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1. Inquiry 2. Demo 3. FOC 4. Regular	' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Customer', @level2type=N'COLUMN',@level2name=N'CustomerType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'CustomerBook', N'COLUMN',N'SalesBillFrom'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1 = Chalan 2 = Issue 3 = Receive	' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CustomerBook', @level2type=N'COLUMN',@level2name=N'SalesBillFrom'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'FirmBranchTypeAdmin', N'COLUMN',N'Title'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'1. Main Branch, 2. Sub Branch 3. Agent 4. Outside Company' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'FirmBranchTypeAdmin', @level2type=N'COLUMN',@level2name=N'Title'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Z-CreditDebitNoteMaster-Z', N'COLUMN',N'BillType'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'S=Sales, P= Purchase ' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z-CreditDebitNoteMaster-Z', @level2type=N'COLUMN',@level2name=N'BillType'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Z-JournalDetail-Z', N'COLUMN',N'Type'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'D= Debit ,C= Credit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z-JournalDetail-Z', @level2type=N'COLUMN',@level2name=N'Type'
GO
IF NOT EXISTS (SELECT * FROM sys.fn_listextendedproperty(N'MS_Description' , N'SCHEMA',N'dbo', N'TABLE',N'Z-SalesBillMaster-Z', N'COLUMN',N'InvoiceMemo'))
	EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'C= Cash D=Debit' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Z-SalesBillMaster-Z', @level2type=N'COLUMN',@level2name=N'InvoiceMemo'
GO
