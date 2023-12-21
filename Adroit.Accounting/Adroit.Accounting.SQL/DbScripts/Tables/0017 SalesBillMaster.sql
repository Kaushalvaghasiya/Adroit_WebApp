IF EXISTS (SELECT * FROM sys.check_constraints WHERE object_id = OBJECT_ID(N'[dbo].[CK_Z-SalesBillmaster-Z]') AND parent_object_id = OBJECT_ID(N'[dbo].[Z-SalesBillMaster-Z]'))
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [CK_Z-SalesBillmaster-Z];
END
GO 

IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[DF_Z-SalesBillmaster-Z_InvoiceMemo]') AND type = 'D')
BEGIN
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_InvoiceMemo];
END
GO 

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN [InvoiceMemo];
GO

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [InvoiceMemo] [bit] NOT NULL;
GO