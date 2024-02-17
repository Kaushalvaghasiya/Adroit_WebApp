IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'PurchaseBillNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillMaster-Z] ADD PurchaseBillNumber VARCHAR(20) NOT NULL
END
GO
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'AccountId' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillMaster-Z] ADD AccountId INT NOT NULL
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_CustomerBook]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [Z-PurchaseBillMaster-Z]  WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_CustomerBook] FOREIGN KEY([AccountId])
REFERENCES [CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_CustomerAccount]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_PurchaseBillMaster_CustomerAccount]
GO

IF NOT EXISTS (SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND CONSTRAINT_NAME = 'IX_PurchaseBillMaster_PurchaseBillNumber')
BEGIN 
ALTER TABLE [Z-PurchaseBillMaster-Z] ADD CONSTRAINT
		    [IX_PurchaseBillMaster_PurchaseBillNumber] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[AccountId] ASC,
		    	[BillNumberFirm] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO
