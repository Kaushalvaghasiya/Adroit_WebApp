IF EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'PurchaseBillNumber' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillMaster-Z] ALTER COLUMN PurchaseBillNumber VARCHAR(40) NOT NULL
END
GO

IF EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND CONSTRAINT_NAME = 'IX_PurchaseBillMaster_PurchaseBillNumber')
BEGIN 
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] DROP CONSTRAINT [IX_PurchaseBillMaster_PurchaseBillNumber];
END 
GO

IF NOT EXISTS (SELECT CONSTRAINT_NAME FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND CONSTRAINT_NAME = 'IX_PurchaseBillMaster_PurchaseBillNumber')
BEGIN 
ALTER TABLE [Z-PurchaseBillMaster-Z] ADD CONSTRAINT
		    [IX_PurchaseBillMaster_PurchaseBillNumber] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[AccountId] ASC,
		    	[PurchaseBillNumber] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
END
GO
