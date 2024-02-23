--[CustomerBook]

ALTER TABLE [CustomerBook] ALTER COLUMN BookTypeId varchar(30)
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerBook_BookType]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerBook]'))
	ALTER TABLE CustomerBook DROP CONSTRAINT [FK_CustomerBook_BookType];
GO

--[BookAdmin]

ALTER TABLE [BookAdmin] ALTER COLUMN BookTypeId varchar(30)
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdmin_BookTypeAdmin]') 
	AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdmin]'))
	ALTER TABLE BookAdmin DROP CONSTRAINT [FK_BookAdmin_BookType];
GO