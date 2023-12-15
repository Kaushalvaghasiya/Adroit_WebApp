ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [CK_Z-SalesBillmaster-Z];
GO 

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_InvoiceMemo];
GO 

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN [InvoiceMemo];
GO

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [InvoiceMemo] [bit] NOT NULL;
GO