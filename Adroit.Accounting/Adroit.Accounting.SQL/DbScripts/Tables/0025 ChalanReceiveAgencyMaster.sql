CREATE TABLE [Z-ChalanReceiveAgencyMaster-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BranchId] [int] NOT NULL,
	[FirmId] [int] NOT NULL,
	[YearId] [int] NOT NULL,
	[SenderBranchAccountMappingid] [int] NOT NULL,
	[ArrivalDate] [datetime] NOT NULL,
	[BillNumberBranch] [int] NOT NULL,
	[BillNumberFirm] [varchar](20) NOT NULL,
	[FirmChalanNumber] [varchar](30) NOT NULL,
	[FirmChalanDate] [datetime] NOT NULL,
	[CityIdFrom] [int] NOT NULL,
	[CityIdTo] [int] NOT NULL,
	[VehicleId] [int] NULL,
	[BillAccountBranchMappingId] [int] NULL,
	[DriverId] [int] NULL,
	[EwayBillNo] [varchar](25) NULL,
	[GoDownNumber] [int] NOT NULL,
	[ToPayAmount] [decimal](9, 2) NULL,
	[SalesAccountBranchMappingId] [int] NULL,
	[ToPayAccountBranchMappingId] [int] NULL,
	[CrossingAmount] [decimal](9, 2) NULL,
	[CrossingAmountAccountBranchMappingId] [int] NULL,
	[CrossingCommission] [decimal](9, 2) NULL,
	[CrossingCommissionAccountBranchMappingId] [int] NULL,
	[CrossingHamali] [decimal](9, 2) NULL,
	[CrossingHamaliAccountBranchMappingId] [int] NULL,
	[CrossingDeliveryCharge] [decimal](9, 2) NULL,
	[CrossingDeliveryAccountBranchMappingId] [int] NULL,
	[BrokerAmount] [decimal](9, 2) NULL,
	[BrokerBranchMappingId] [int] NULL,
	[TaxableAmount] [decimal](9, 2) NULL,
	[TDSPercent] [decimal](9, 2) NULL,
	[TDSAmount] [decimal](9, 2) NULL,
	[AdvanceCash] [decimal](9, 2) NULL,
	[AdvanceNeft] [decimal](9, 2) NULL,
	[OtherLess] [decimal](9, 2) NULL,
	[ReceiveCash] [decimal](9, 2) NULL,
	[OtherPlus] [decimal](9, 2) NULL,
	[NetAmount] [decimal](18, 3) NULL,
	[Notes] [nvarchar](250) NULL,
	[IsAutoLR] [bit] NOT NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-ChalanReceiveAgencyMaster-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceiveAgencyMaster_Branch] UNIQUE NONCLUSTERED 
(
	[BranchId] ASC,
	[YearId] ASC,
	[SenderBranchAccountMappingid] ASC,
	[BillNumberBranch] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceiveAgencyMaster_Firm] UNIQUE NONCLUSTERED 
(
	[FirmId] ASC,
	[YearId] ASC,
	[SenderBranchAccountMappingid] ASC,
	[BillNumberFirm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceiveAgencyMaster_FirmChalanNumber] UNIQUE NONCLUSTERED 
(
	[FirmId] ASC,
	[YearId] ASC,
	[SenderBranchAccountMappingid] ASC,
	[FirmChalanNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_ArrivalDate]  DEFAULT (getutcdate()) FOR [ArrivalDate]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_FirmChalanDate]  DEFAULT (getutcdate()) FOR [FirmChalanDate]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_ModifiedOn]  DEFAULT (getutcdate()) FOR [ModifiedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyMaster-Z_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_ChalanReceiveAgencyMaster_CustomerFirm] FOREIGN KEY([FirmId])
REFERENCES [dbo].[CustomerFirm] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_ChalanReceiveAgencyMaster_CustomerFirm]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_ChalanReceiveAgencyMaster_CustomerFirmBranch] FOREIGN KEY([BranchId])
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_ChalanReceiveAgencyMaster_CustomerFirmBranch]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_ChalanReceiveAgencyMaster_FinanceYear] FOREIGN KEY([YearId])
REFERENCES [dbo].[FinanceYear] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_ChalanReceiveAgencyMaster_FinanceYear]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping] FOREIGN KEY([SenderBranchAccountMappingid])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_City_From] FOREIGN KEY([CityIdFrom])
REFERENCES [dbo].[City] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_City_From]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_City_To] FOREIGN KEY([CityIdTo])
REFERENCES [dbo].[City] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_City_To]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_Vehilcle] FOREIGN KEY([VehicleId])
REFERENCES [dbo].[Vehilcle] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_Vehilcle]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping0] FOREIGN KEY([BillAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping0]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_Driver] FOREIGN KEY([DriverId])
REFERENCES [dbo].[Driver] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_Driver]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping1] FOREIGN KEY([ToPayAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping1]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping6] FOREIGN KEY([SalesAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping6]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping2] FOREIGN KEY([CrossingAmountAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping2]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping3] FOREIGN KEY([CrossingCommissionAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping3]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping4] FOREIGN KEY([CrossingHamaliAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping4]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping5] FOREIGN KEY([CrossingDeliveryAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerAccountBranchMapping5]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerBrokerBranchMapping] FOREIGN KEY([BrokerBranchMappingId])
REFERENCES [dbo].[CustomerBrokerBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerBrokerBranchMapping]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser1]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyMaster-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyMaster-Z_CustomerUser2]
GO
