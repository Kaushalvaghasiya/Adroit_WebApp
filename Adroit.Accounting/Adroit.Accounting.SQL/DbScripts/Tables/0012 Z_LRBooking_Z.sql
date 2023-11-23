ALTER TABLE [dbo].[Z-LRBooking-Z] ADD [BranchId] [int] NOT NULL;

ALTER TABLE [dbo].[Z-LRBooking-Z] WITH CHECK ADD CONSTRAINT [FK_Z_LRBookingZ_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE [dbo].[Z-LRBooking-Z] ADD [YearId] [int] NOT NULL;

ALTER TABLE [dbo].[Z-LRBooking-Z] WITH CHECK ADD CONSTRAINT [FK_Z_LRBookingZ_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO