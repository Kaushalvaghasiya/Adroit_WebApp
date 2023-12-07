ALTER TABLE dbo.[Z-LRBooking-Z]
	DROP CONSTRAINT [FK_Z-LRBooking-Z_ProductPacking]
GO 

ALTER TABLE [dbo].[Z-LRBooking-Z] ADD CONSTRAINT [FK_Z-LRBooking-Z_ProductPacking] FOREIGN KEY (PackingId) 
REFERENCES [dbo].TransportPacking(Id) 
GO	