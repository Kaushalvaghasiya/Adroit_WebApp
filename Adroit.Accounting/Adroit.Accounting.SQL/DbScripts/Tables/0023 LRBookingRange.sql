IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IX_LRRange]'))
BEGIN
    ALTER TABLE [dbo].[LRBookingRange] DROP CONSTRAINT [IX_LRRange];
END
GO 

IF NOT EXISTS (SELECT COLUMN_NAME
               FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_NAME = 'LRBookingRange'
                 AND COLUMN_NAME = 'FirmId')
BEGIN
    ALTER TABLE [dbo].[LRBookingRange] ADD [FirmId] [int] NOT NULL;
END

IF NOT EXISTS (SELECT COLUMN_NAME
               FROM INFORMATION_SCHEMA.COLUMNS
               WHERE TABLE_NAME = 'LRBookingRange'
                 AND COLUMN_NAME = 'YearId')
BEGIN
    ALTER TABLE [dbo].[LRBookingRange] ADD [YearId] [int] NOT NULL;
END

IF NOT EXISTS (SELECT CONSTRAINT_NAME
               FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
                 AND TABLE_NAME = 'LRBookingRange'
                 AND CONSTRAINT_NAME = 'FK_LRBookingRange_FinanceYear')
BEGIN
    ALTER TABLE [dbo].[LRBookingRange] WITH CHECK ADD CONSTRAINT [FK_LRBookingRange_FinanceYear] FOREIGN KEY([YearId])
    REFERENCES [dbo].[FinanceYear] ([Id])
END
GO

IF NOT EXISTS (SELECT CONSTRAINT_NAME
               FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS
               WHERE CONSTRAINT_TYPE = 'FOREIGN KEY'
                 AND TABLE_NAME = 'LRBookingRange'
                 AND CONSTRAINT_NAME = 'FK_LRBookingRange_CustomerFirm')
BEGIN
    ALTER TABLE [dbo].[LRBookingRange] WITH CHECK ADD CONSTRAINT [FK_LRBookingRange_CustomerFirm] FOREIGN KEY([FirmId])
    REFERENCES [dbo].[CustomerFirm] ([Id])
END
GO