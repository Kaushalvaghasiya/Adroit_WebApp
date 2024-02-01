ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ALTER COLUMN  [LRSubTitle] [nvarchar](max) NULL
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ALTER COLUMN [LRSubject] [nvarchar](max) NULL
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [ChalanDetailTemplate] [nvarchar](max) NOT NULL DEFAULT 0
ALTER TABLE [dbo].[CustomerFirmBranchTransportSetting] ADD [ChalanSummaryTemplate] [nvarchar](max) NOT NULL DEFAULT 0
GO