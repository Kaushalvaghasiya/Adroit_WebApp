IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[BusinessSoftwareMapping](
	[Id] [smallint] IDENTITY(1,1) NOT NULL,
	[BusinessId] [smallint] NOT NULL,
	[SoftwareId] [tinyint] NOT NULL,
 CONSTRAINT [PK_BusinessSoftwareMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_BusinessSoftwareMapping] UNIQUE NONCLUSTERED 
(
	[BusinessId] ASC,
	[SoftwareId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessSoftwareMapping_Business] FOREIGN KEY([BusinessId])
REFERENCES [dbo].[Business] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Business]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping] CHECK CONSTRAINT [FK_BusinessSoftwareMapping_Business]
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping]  WITH CHECK ADD  CONSTRAINT [FK_BusinessSoftwareMapping_Software] FOREIGN KEY([SoftwareId])
REFERENCES [dbo].[Software] ([Id])
GO

IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_BusinessSoftwareMapping_Software]') AND parent_object_id = OBJECT_ID(N'[dbo].[BusinessSoftwareMapping]'))
ALTER TABLE [dbo].[BusinessSoftwareMapping] CHECK CONSTRAINT [FK_BusinessSoftwareMapping_Software]
GO
