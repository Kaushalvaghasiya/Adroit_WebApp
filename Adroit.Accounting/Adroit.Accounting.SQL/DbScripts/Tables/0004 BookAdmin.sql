ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [SGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [CGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [IGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [RoundOffAccountId] [int] NULL

ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [SGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [CGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [IGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [RoundOffAccountId] [int] NULL
GO

ALTER TABLE [dbo].[BookAdmin] ADD CONSTRAINT
		    [IX_BookAdmin] UNIQUE NONCLUSTERED 
		    (
		    	[BookAccountId] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
Go
