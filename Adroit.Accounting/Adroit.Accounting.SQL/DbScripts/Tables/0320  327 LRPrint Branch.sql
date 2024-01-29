ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [LRTemplate] [nvarchar](max) NOT NULL DEFAULT 0
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [LRCopy] [tinyint] NOT NULL DEFAULT 0
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [LRSubTitle] [nvarchar](250) NULL
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [LRSubject] [nvarchar](250) NULL

GO