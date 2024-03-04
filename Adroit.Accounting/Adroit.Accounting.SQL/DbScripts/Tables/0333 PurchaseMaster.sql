IF NOT EXISTS (SELECT COLUMN_NAME FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Z-PurchaseBillMaster-Z' AND COLUMN_NAME = 'SalesBillFromId')
BEGIN
    ALTER TABLE [Z-PurchaseBillMaster-Z] ADD SalesBillFromId CHAR(1) NOT NULL
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_SalesBillFromAdmin]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
	ALTER TABLE [Z-PurchaseBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_SalesBillFromAdmin] 
		FOREIGN KEY(SalesBillFromId) REFERENCES [SalesBillFromAdmin] ([Id])

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_SalesBillFromAdmin]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
	ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_PurchaseBillMaster_SalesBillFromAdmin]
GO

