ALTER TABLE [CustomerFirmBranch] ADD [SoftwarePlanId] [tinyint] NOT NULL DEFAULT(1)
GO

ALTER TABLE [dbo].[CustomerFirmBranch] WITH CHECK ADD CONSTRAINT [FK_CustomerFirmBranch_SoftwarePlan] FOREIGN KEY([SoftwarePlanId])
REFERENCES [dbo].[SoftwarePlan] ([Id])
GO
ALTER TABLE [dbo].[CustomerFirmBranch] CHECK CONSTRAINT [FK_CustomerFirmBranch_SoftwarePlan]
GO

--Unique Firm per customer constraint
IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirm]') AND name = N'IX_CustomerFirm')
ALTER TABLE [dbo].[CustomerFirm] ADD  CONSTRAINT [IX_CustomerFirm] UNIQUE NONCLUSTERED 
(
	[CustomerId] ASC,
	[Title] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
