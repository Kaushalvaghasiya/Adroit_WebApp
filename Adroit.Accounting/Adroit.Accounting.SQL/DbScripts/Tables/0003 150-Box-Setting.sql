IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BoxSetting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BoxSetting](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
	[CustomerId] [int] NULL,
	[CusomerFirmId] [int] NULL,
	[Product_ProductName] [bit] NOT NULL,
	[Product_ProductName2] [bit] NOT NULL,
	[Product_ProductName3] [bit] NOT NULL,
	[Product_CodeSKU] [bit] NOT NULL,
	[Product_Design] [bit] NOT NULL,
	[Product_Colour] [bit] NOT NULL,
	[Product_Size] [bit] NOT NULL,
	[Product_Fabric] [bit] NOT NULL,
	[Product_MRP] [bit] NOT NULL,
	[Product_DistributorRate] [bit] NOT NULL,
	[Product_DealerRate] [bit] NOT NULL,
	[Product_AvgPack] [bit] NOT NULL,
	[Product_BoxPack] [bit] NOT NULL,
	[Product_ProductPacking] [bit] NOT NULL,
	[Product_CentralCess] [bit] NOT NULL,
	[Product_StateCess] [bit] NOT NULL,
	[Product_Group] [bit] NOT NULL,
	[Product_SubGroup] [bit] NOT NULL,
	[Product_Discount] [bit] NOT NULL,
	[Product_FIFORate] [bit] NOT NULL,
	[Product_OpStockQty] [bit] NOT NULL,
	[Product_PurchaseRate] [bit] NOT NULL,
	[Product_CalculationOn] [bit] NOT NULL,
	[Product_Cut] [bit] NOT NULL,
	[Product_RolMin] [bit] NOT NULL,
	[Product_RolMax] [bit] NOT NULL,
	[Product_OpStockNos] [bit] NOT NULL,
	[Product_LooseQty] [bit] NOT NULL,
	[Product_PurchaseRateUpdate] [bit] NOT NULL,
	[Product_QualityType] [bit] NOT NULL,
	[Product_YarnDenierWt] [bit] NOT NULL,
	[Product_RateMeter] [bit] NOT NULL,
	[Product_YarnShadeNo] [bit] NOT NULL,
	[Account_Taluka] [bit] NOT NULL,
	[Account_District] [bit] NOT NULL,
	[Account_Country] [bit] NOT NULL,
	[Account_Area] [bit] NOT NULL,
	[Account_TransporterName] [bit] NOT NULL,
	[Account_TransporterGSTNo] [bit] NOT NULL,
	[Account_VehicleNumber] [bit] NOT NULL,
	[Account_Broker] [bit] NOT NULL,
	[Account_DeliveryParty] [bit] NOT NULL,
	[Account_HasteParty] [bit] NOT NULL,
	[Account_ShippingParty] [bit] NOT NULL,
	[GeneralExpenseMulti_Group] [bit] NOT NULL,
	[GeneralExpenseMulti_Discount] [bit] NOT NULL,
	[GeneralExpenseMulti_OtherCharges] [bit] NOT NULL,
	[GeneralExpenseMulti_Group2] [bit] NOT NULL,
	[GeneralExpenseMulti_Discount2] [bit] NOT NULL,
	[GeneralExpenseMulti_OtherCharges2] [bit] NOT NULL,
	[GeneralExpenseMulti_TDS] [bit] NOT NULL,
	[GeneralExpenseMulti_SGST] [bit] NOT NULL,
	[GeneralExpenseMulti_CGST] [bit] NOT NULL,
	[GeneralExpenseMulti_IGST] [bit] NOT NULL,
	[GeneralExpenseMulti_StateCess] [bit] NOT NULL,
	[GeneralExpenseMulti_CentralCess] [bit] NOT NULL,
	[GeneralExpenseMulti_TCS] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_BoxSetting] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BoxSetting] UNIQUE NONCLUSTERED 
(
	[SoftwareId] ASC,
	[CustomerId] ASC,
	[CusomerFirmId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BoxSetting_AddedOn]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BoxSetting] ADD  CONSTRAINT [DF_BoxSetting_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
END
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_BoxSetting_Active]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[BoxSetting] ADD  CONSTRAINT [DF_BoxSetting_Active]  DEFAULT ((1)) FOR [Active]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting]  WITH CHECK ADD  CONSTRAINT [FK_BoxSetting_Customer] FOREIGN KEY([CustomerId])
REFERENCES [dbo].[Customer] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_Customer]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting] CHECK CONSTRAINT [FK_BoxSetting_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting]  WITH CHECK ADD  CONSTRAINT [FK_BoxSetting_CustomerFirm] FOREIGN KEY([CusomerFirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerFirm]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting] CHECK CONSTRAINT [FK_BoxSetting_CustomerFirm]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting]  WITH CHECK ADD  CONSTRAINT [FK_BoxSetting_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerUser]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting] CHECK CONSTRAINT [FK_BoxSetting_CustomerUser]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting]  WITH CHECK ADD  CONSTRAINT [FK_BoxSetting_CustomerUser1] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_CustomerUser1]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting] CHECK CONSTRAINT [FK_BoxSetting_CustomerUser1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting]  WITH CHECK ADD  CONSTRAINT [FK_BoxSetting_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BoxSetting_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BoxSetting]'))
ALTER TABLE [dbo].[BoxSetting] CHECK CONSTRAINT [FK_BoxSetting_Software]
GO
