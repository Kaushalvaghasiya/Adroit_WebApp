ALTER TABLE [dbo].[Z-LRBooking-Z] ADD [NetAmount] DECIMAL(18,2) NOT NULL DEFAULT(0)
GO
UPDATE [dbo].[Z-LRBooking-Z] SET [NetAmount] = ISNULL([Z-LRBooking-Z].Freight,0) +
											ISNULL([Z-LRBooking-Z].Charges1,0) +
											ISNULL([Z-LRBooking-Z].Charges2,0) +
											ISNULL([Z-LRBooking-Z].Charges3,0) +
											ISNULL([Z-LRBooking-Z].Charges4,0) +
											ISNULL([Z-LRBooking-Z].Charges5,0) +
											ISNULL([Z-LRBooking-Z].Charges6,0)