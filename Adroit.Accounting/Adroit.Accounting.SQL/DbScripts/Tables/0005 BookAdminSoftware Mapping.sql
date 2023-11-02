IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BookAdminSoftwareMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BookAdminSoftwareMapping](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BookId] [int] NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
 CONSTRAINT [PK_BookAdminSoftwareMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BookAdminSoftwareMapping] UNIQUE NONCLUSTERED 
(
	[BookId] ASC,
	[SoftwareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdminSoftwareMapping_BookAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdminSoftwareMapping]'))
ALTER TABLE [dbo].[BookAdminSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BookAdminSoftwareMapping_BookAdmin] FOREIGN KEY([BookId])
REFERENCES [dbo].[BookAdmin] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdminSoftwareMapping_BookAdmin]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdminSoftwareMapping]'))
ALTER TABLE [dbo].[BookAdminSoftwareMapping] CHECK CONSTRAINT [FK_BookAdminSoftwareMapping_BookAdmin]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdminSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdminSoftwareMapping]'))
ALTER TABLE [dbo].[BookAdminSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BookAdminSoftwareMapping_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BookAdminSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BookAdminSoftwareMapping]'))
ALTER TABLE [dbo].[BookAdminSoftwareMapping] CHECK CONSTRAINT [FK_BookAdminSoftwareMapping_Software]
GO
