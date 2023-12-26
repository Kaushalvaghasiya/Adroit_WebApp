DROP INDEX [IX_LRRange] ON [dbo].[LRBookingRange]
GO

ALTER TABLE [dbo].[LRBookingRange] ADD [FirmId] [int] NOT NULL;
ALTER TABLE [dbo].[LRBookingRange] ADD [YearId] [int] NOT NULL;
ALTER TABLE [dbo].[LRBookingRange] ADD [NumberOfLR] [int] NOT NULL;

ALTER TABLE [dbo].[LRBookingRange] WITH CHECK ADD CONSTRAINT [FK_LRBookingRange_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO

ALTER TABLE [dbo].[LRBookingRange] WITH CHECK ADD CONSTRAINT [FK_LRBookingRange_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO