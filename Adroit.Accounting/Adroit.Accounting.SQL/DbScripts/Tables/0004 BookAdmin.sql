ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [SGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [CGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [IGSTAccountId] [int] NULL
ALTER TABLE [dbo].[BookAdmin] ALTER COLUMN [RoundOffAccountId] [int] NULL

ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [SGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [CGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [IGSTAccountId] [int] NULL
ALTER TABLE [dbo].[CustomerBook] ALTER COLUMN [RoundOffAccountId] [int] NULL
GO