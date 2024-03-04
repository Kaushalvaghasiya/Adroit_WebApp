IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'FromStationCityId' AND Object_ID = Object_ID(N'[Z-PurchaseBillMaster-Z]'))
BEGIN
   ALTER TABLE [Z-PurchaseBillMaster-Z] ADD FromStationCityId INT
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_City]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [Z-PurchaseBillMaster-Z]  WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_City] FOREIGN KEY([FromStationCityId])
REFERENCES [City] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_PurchaseBillMaster_City]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-PurchaseBillMaster-Z]'))
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] CHECK CONSTRAINT [FK_PurchaseBillMaster_City]
GO