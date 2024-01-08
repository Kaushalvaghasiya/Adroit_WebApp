IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'Z-SalesBillDetail-Z' AND COLUMN_NAME = 'GSTCentralCess')
BEGIN 
	ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [GSTCentralCess] decimal(5,0) NULL;
END
GO