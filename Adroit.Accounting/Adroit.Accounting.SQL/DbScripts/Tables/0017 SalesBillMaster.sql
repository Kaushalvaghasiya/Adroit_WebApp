ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_InvoiceMemo];

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN [InvoiceMemo];

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [InvoiceMemo] [bit] NOT NULL;
GO