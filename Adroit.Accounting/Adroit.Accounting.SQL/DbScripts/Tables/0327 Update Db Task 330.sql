--[BookAdmin]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'SkipInGSTReport' AND Object_ID = Object_ID(N'[BookAdmin]'))
BEGIN
	ALTER TABLE [BookAdmin] ADD SkipInGSTReport BIT NOT NULL DEFAULT 0
END

--[CustomerBook]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'SkipInGSTReport' AND Object_ID = Object_ID(N'[CustomerBook]'))
BEGIN
	ALTER TABLE [CustomerBook] ADD SkipInGSTReport BIT NOT NULL DEFAULT 0
END

--[CustomerFirmBranchTransportSetting]
IF NOT EXISTS(SELECT 1 FROM sys.columns WHERE Name = N'GatePassBookBranchMappingId' AND Object_ID = Object_ID(N'[CustomerFirmBranchTransportSetting]'))
BEGIN
	ALTER TABLE [CustomerFirmBranchTransportSetting] ADD GatePassBookBranchMappingId INT NULL
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]') 
				AND parent_object_id = OBJECT_ID(N'[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting]  WITH CHECK ADD CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping] FOREIGN KEY(GatePassBookBranchMappingId)
REFERENCES [dbo].[CustomerBookBranchMapping] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranchTransportSetting]'))
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] CHECK CONSTRAINT [FK_CustomerFirmBranchTransportSetting_CustomerBookBranchMapping]
GO