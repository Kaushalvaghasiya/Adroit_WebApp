CREATE TABLE [Z-ChalanReceive-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseBillMasterId] [int] NOT NULL,
	[ReceiveDate] [datetime] NOT NULL,
	[BillNumberBranch] [int] NOT NULL,
	[BillNumberFirm] [int] NOT NULL,
	[BranchId] [int] NOT NULL,
	[FirmId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[UserId] [int] NOT NULL,
	[GoDownNumber] [int] NOT NULL,
	[ReceivedNote] [nvarchar](250) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
 CONSTRAINT [PK_Z-ChalanReceive-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceive_Branch] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC,
	[YearId] ASC,
	[BillNumberBranch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceive_Firm] UNIQUE NONCLUSTERED 
(
	[FirmId] ASC,
	[YearId] ASC,
	[BillNumberFirm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Z-ChalanReceive-Z] WITH CHECK ADD CONSTRAINT [FK_ChalanReceive_PurchaseBillMaster] FOREIGN KEY([PurchaseBillMasterId])
REFERENCES [dbo].[Z-PurchaseBillMaster-Z] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceive-Z] WITH CHECK ADD CONSTRAINT [FK_ChalanReceive_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceive-Z] WITH CHECK ADD CONSTRAINT [FK_ChalanReceive_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceive-Z] WITH CHECK ADD CONSTRAINT [FK_ChalanReceive_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceive-Z] WITH CHECK ADD CONSTRAINT [FK_ChalanReceive_CustomerUser] FOREIGN KEY([UserId])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

