IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[CustomerChalanBranchMapping]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].CustomerChalanBranchMapping(
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Branch] [int] NOT NULL,
	[SharedBranch] [int] NOT NULL,
 CONSTRAINT [PK_CustomerChalanBranchMapping] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IX_CustomerChalanBranchMapping] UNIQUE NONCLUSTERED 
(
	[Branch] ASC,
	[SharedBranch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
END

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerChalanBranchMapping_Branch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerChalanBranchMapping]'))
ALTER TABLE [dbo].[CustomerChalanBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerChalanBranchMapping_Branch] FOREIGN KEY([Branch])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerChalanBranchMapping_Branch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerChalanBranchMapping]'))
ALTER TABLE [dbo].[CustomerChalanBranchMapping] CHECK CONSTRAINT [FK_CustomerChalanBranchMapping_Branch]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerChalanBranchMapping_SharedBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerChalanBranchMapping]'))
ALTER TABLE [dbo].[CustomerChalanBranchMapping]  WITH CHECK ADD  CONSTRAINT [FK_CustomerChalanBranchMapping_SharedBranch] FOREIGN KEY([SharedBranch])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerChalanBranchMapping_SharedBranch]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerChalanBranchMapping]'))
ALTER TABLE [dbo].[CustomerChalanBranchMapping] CHECK CONSTRAINT [FK_CustomerChalanBranchMapping_SharedBranch]
GO