--[BillEntryTypeAdmin]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'BillEntryTypeAdminGroupId' AND Object_ID = Object_ID(N'[BillEntryTypeAdmin]'))
BEGIN
   ALTER TABLE [BillEntryTypeAdmin] ADD BillEntryTypeAdminGroupId tinyint not null DEFAULT(1)
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BillEntryTypeAdmin_BillEntryTypeAdminGroup]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[BillEntryTypeAdmin]'))
ALTER TABLE [dbo].[BillEntryTypeAdmin]  WITH CHECK ADD CONSTRAINT [FK_BillEntryTypeAdmin_BillEntryTypeAdminGroup] FOREIGN KEY([BillEntryTypeAdminGroupId])
REFERENCES [dbo].[BillEntryTypeAdminGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BillEntryTypeAdmin_BillEntryTypeAdminGroup]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[BillEntryTypeAdmin]'))
ALTER TABLE [dbo].[BillEntryTypeAdmin] CHECK CONSTRAINT [FK_BillEntryTypeAdmin_BillEntryTypeAdminGroup]
GO

--[Z-PurchaseBillMaster-Z]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'BillEntryTypeAdminGroupId' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillMaster-Z] ADD BillEntryTypeAdminGroupId tinyint not null DEFAULT(3)
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_BillEntryTypeAdminGroup]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_BillEntryTypeAdminGroup] FOREIGN KEY([BillEntryTypeAdminGroupId])
REFERENCES [dbo].[BillEntryTypeAdminGroup] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_BillEntryTypeAdminGroup]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_PurchaseBillMaster_BillEntryTypeAdminGroup]
GO

--Unique Key
IF EXISTS (SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND CONSTRAINT_NAME = 'IX_PurchaseBillMaster_Firm')
BEGIN 
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] DROP CONSTRAINT [IX_PurchaseBillMaster_Firm];
END 
GO
IF NOT EXISTS (SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND CONSTRAINT_NAME = 'IX_PurchaseBillMaster_Firm')
BEGIN 
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD CONSTRAINT
		    [IX_PurchaseBillMaster_Firm] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[BillEntryTypeAdminGroupId] ASC,
		    	[BillNumberFirm] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

--Z-SalesBillMaster-Z Add BookId
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'BookId' AND Object_ID = Object_ID(N'[Z-SalesBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-SalesBillMaster-Z] ADD BookId INT NOT NULL
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesBillMaster_CustomerBook]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z]  WITH CHECK ADD CONSTRAINT [FK_SalesBillMaster_CustomerBook] FOREIGN KEY([BookId])
REFERENCES [dbo].[CustomerBook] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesBillMaster_CustomerBook]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] CHECK CONSTRAINT [FK_SalesBillMaster_CustomerBook]
GO

--Z-SalesBillMaster-Z Unique Key
IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-SalesBillMaster-Z' AND CONSTRAINT_NAME = 'IX_SalesBillMaster_Firm')
BEGIN 
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [IX_SalesBillMaster_Firm];
END 
GO
IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-SalesBillMaster-Z' AND CONSTRAINT_NAME = 'IX_SalesBillMaster_Firm')
BEGIN 
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD CONSTRAINT
		    [IX_SalesBillMaster_Firm] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[BookId] ASC,
		    	[EntryTypeId] ASC,
		    	[BillNumber] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO

--SalesBillMaster HeaderBox5 allow nulls
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ALTER COLUMN [HeaderBox5] NVARCHAR(20) NULL 
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'DeliveryChDetailId' AND Object_ID = Object_ID(N'[Z-PurchaseBillDetail-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillDetail-Z] ADD [DeliveryChDetailId] INT NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'HeaderBox1' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [HeaderBox1] NVARCHAR(20) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'HeaderBox2' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [HeaderBox2] NVARCHAR(20) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'HeaderBox3' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [HeaderBox3] NVARCHAR(20) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'HeaderBox4' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [HeaderBox4] NVARCHAR(20) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'HeaderBox5' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [HeaderBox5] NVARCHAR(20) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TransportGSTNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [TransportGSTNumber] VARCHAR(15) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TransportLRNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [TransportLRNumber] VARCHAR(15) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TransportLRDate' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [TransportLRDate] date NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TransportName' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [TransportName] NVARCHAR(50) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'TransportModeId' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [TransportModeId] tinyint 
END
GO
--set fk for gsttranportmode 
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillmaster-Z_GSTTransportMode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-PurchaseBillmaster-Z_GSTTransportMode] FOREIGN KEY([TransportModeId])
REFERENCES [dbo].[GSTTransportMode] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Z-PurchaseBillmaster-Z_GSTTransportMode]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_Z-PurchaseBillmaster-Z_GSTTransportMode]
GO


IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IRNNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [IRNNumber] VARCHAR(250) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AcknowledgementNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [AcknowledgementNumber] VARCHAR(50) NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IRNDate' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [IRNDate] datetime NULL 
END
GO

IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'VehicleNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [VehicleNumber] VARCHAR(12) NULL 
END
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BookAdmin_SalesBillFrom]') AND type = 'D')
BEGIN
	ALTER TABLE [BookAdmin] DROP CONSTRAINT [DF_BookAdmin_SalesBillFrom] 
END

GO
ALTER TABLE [BookAdmin] ALTER COLUMN SalesBillFrom VARCHAR(20)
GO

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_CustomerBook_SalesBillFrom]') AND type = 'D')
BEGIN
	ALTER TABLE [CustomerBook] DROP CONSTRAINT [DF_CustomerBook_SalesBillFrom] 
END

GO
IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_SalesBillFromAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
BEGIN
	ALTER TABLE [CustomerBook] DROP CONSTRAINT [FK_CustomerBook_SalesBillFromAdmin]
END
GO

GO
ALTER TABLE [CustomerBook] ALTER COLUMN SalesBillFrom VARCHAR(20)
GO