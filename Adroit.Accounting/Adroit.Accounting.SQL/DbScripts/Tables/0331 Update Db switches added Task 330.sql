--[CustomerFirm]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'IsBatchNumber' AND Object_ID = Object_ID(N'[CustomerFirm]'))
BEGIN
	ALTER TABLE [CustomerFirm] ADD IsBatchNumber BIT NOT NULL DEFAULT 0
END
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'SetSalesRateInPur' AND Object_ID = Object_ID(N'[CustomerFirm]'))
BEGIN
	ALTER TABLE [CustomerFirm] ADD SetSalesRateInPur BIT NOT NULL DEFAULT 0
END
