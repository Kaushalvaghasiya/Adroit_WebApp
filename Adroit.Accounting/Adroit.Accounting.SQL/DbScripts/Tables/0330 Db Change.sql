IF EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_CustomerBook]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
	ALTER TABLE [Z-PurchaseBillMaster-Z]  DROP CONSTRAINT [FK_PurchaseBillMaster_CustomerBook]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_CustomerAccount]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
	ALTER TABLE [Z-PurchaseBillMaster-Z]  WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_CustomerAccount] FOREIGN KEY([AccountId]) REFERENCES [CustomerAccount] ([Id])

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_CustomerAccount]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
	ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_PurchaseBillMaster_CustomerAccount]
GO
