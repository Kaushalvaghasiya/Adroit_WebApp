ALTER TABLE dbo.[CustomerAccountOpeningBalance]
	DROP CONSTRAINT [CK_CustomerAccountOpeningBalance]
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