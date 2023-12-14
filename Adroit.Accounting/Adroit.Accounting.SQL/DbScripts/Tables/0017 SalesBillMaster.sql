ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [CK_Z-SalesBillmaster-Z];

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN [InvoiceMemo];

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [InvoiceMemo] [bit] NOT NULL;
GO