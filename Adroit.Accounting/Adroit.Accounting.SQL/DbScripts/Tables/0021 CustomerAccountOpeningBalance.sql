IF EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CK_CustomerAccountOpeningBalance]') AND type = 'C')
BEGIN
	ALTER TABLE dbo.[CustomerAccountOpeningBalance] DROP CONSTRAINT [CK_CustomerAccountOpeningBalance]
END
GO

ALTER TABLE dbo.[CustomerAccountOpeningBalance]
DROP COLUMN [Type]
GO 

ALTER TABLE [dbo].[CustomerAccountOpeningBalance] 
ADD [Credit] BIT not Null Default(0)
GO	

ALTER TABLE [dbo].[CustomerAccountOpeningBalance] 
ADD [OpeningDate] Datetime not null
GO	

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[IX_CustomerAccountOpeningBalance]') AND type = 'UQ')
BEGIN
	
	ALTER TABLE [dbo].[CustomerAccountOpeningBalance]
    ADD CONSTRAINT [IX_CustomerAccountOpeningBalance] UNIQUE NONCLUSTERED 
	(
		AccountBranchMappingId ASC,
		YearId ASC
	)
END
GO

