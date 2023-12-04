ALTER TABLE [dbo].[AccountAdmin] ADD CONSTRAINT
		    [IX_AccountAdmin] UNIQUE NONCLUSTERED 
		    (
		    	[Name]  ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO