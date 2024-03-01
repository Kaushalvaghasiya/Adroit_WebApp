ALTER TABLE [Z-SalesBillDetail-Z] ALTER COLUMN LRBookingId INT NULL 
ALTER TABLE [Z-SalesBillDetail-Z] ADD AgencyLRBookingId INT NULL

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesBillDetail_ChalanReceiveAgencyDetail]') 
				AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
	ALTER TABLE [Z-SalesBillDetail-Z]  WITH CHECK ADD CONSTRAINT [FK_SalesBillDetail_ChalanReceiveAgencyDetail] 
		FOREIGN KEY([AgencyLRBookingId]) REFERENCES [Z-ChalanReceiveAgencyDetail-Z] ([Id])

GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_SalesBillDetail_ChalanReceiveAgencyDetail]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillDetail-Z]'))
	ALTER TABLE [dbo].[Z-SalesBillDetail-Z] CHECK CONSTRAINT [FK_SalesBillDetail_ChalanReceiveAgencyDetail]
GO

