ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [BranchId] [int] NOT NULL;
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [FirmId] [int] NOT NULL;
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [YearId] [int] NOT NULL;
ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [IsAutoLedger] [bit] NOT NULL;

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_PurchaseBillMaster_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD CONSTRAINT
		    [IX_PurchaseBillMaster_Firm] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[BookBranchMappingId] ASC,
		    	[BillNumberFirm] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
Go

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD CONSTRAINT
		    [IX_PurchaseBillMaster_Branch] UNIQUE NONCLUSTERED 
		    (
		    	[BranchId] ASC,
		    	[YearId] ASC,
		    	[BookBranchMappingId] ASC,
		    	[BillNumberBranch] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
Go