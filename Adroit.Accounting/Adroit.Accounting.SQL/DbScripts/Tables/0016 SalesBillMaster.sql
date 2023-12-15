ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge1];
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge2];
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge3];
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge4];
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge5];
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP CONSTRAINT [DF_Z-SalesBillmaster-Z_Charge6];

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge1;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge2;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge3;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge4;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge5;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] DROP COLUMN Charge6;

ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge1] [decimal](6,2) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge2] [decimal](6,2) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge3] [decimal](6,2) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge4] [decimal](6,2) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge5] [decimal](6,2) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillDetail-Z] ADD [Charge6] [decimal](6,2) NOT NULL;

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [Prefix] [varchar](15) NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [Postfix] [varchar](15) NOT NULL;

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [BranchId] [int] NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [FirmId] [int] NOT NULL;
ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD [YearId] [int] NOT NULL;

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_SalesBillMaster_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_SalesBillMaster_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] WITH CHECK ADD CONSTRAINT [FK_SalesBillMaster_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD CONSTRAINT
		    [IX_SalesBillMaster_Firm] UNIQUE NONCLUSTERED 
		    (
		    	[FirmId] ASC,
		    	[YearId] ASC,
		    	[BookBranchMappingId] ASC,
		    	[BillNumber] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
Go

ALTER TABLE [dbo].[Z-SalesBillMaster-Z] ADD CONSTRAINT
		    [IX_SalesBillMaster_Branch] UNIQUE NONCLUSTERED 
		    (
		    	[BranchId] ASC,
		    	[YearId] ASC,
		    	[BookBranchMappingId] ASC,
		    	[SerialNumberOfBranch] ASC
		    )WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
Go