CREATE TABLE [Z-ChalanReceiveAgencyDetail-Z](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ChalanReceiveAgencyMasterId] [int] NOT NULL,
	[SenderBranchAccountMappingid] [int] NOT NULL,
	[SrNumber] [int] NOT NULL,
	[EwayBillNo] [varchar](25) NULL,
	[LRNumber] [varchar](20) NULL,
	[LRDate] [datetime] NOT NULL,
	[PrivateMarka] [nvarchar](30) NULL,
	[CityIdFrom] [int] NOT NULL,
	[CityIdTo] [int] NOT NULL,
	[AccountBranchMappingId] [int] NOT NULL,
	[DeliveryAccountBranchMappingId] [int] NOT NULL,
	[LRPayTypeId] [tinyint] NOT NULL,
	[Parcel] [smallint] NULL,
	[ChargeWeight] [decimal](18, 3) NULL,
	[BillAccountBranchMappingId] [int] NULL,
	[NetAmount] [decimal](18, 3) NULL,
	[AddedOn] [datetime] NOT NULL,
	[AddedById] [int] NOT NULL,
	[ModifiedById] [int] NULL,
	[ModifiedOn] [datetime] NULL,
	[Deleted] [bit] NOT NULL,
	[DeletedById] [int] NULL,
	[DeletedOn] [datetime] NULL,
 CONSTRAINT [PK_Z-ChalanReceiveAgencyDetail-Z] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [IX_ChalanReceiveAgencyDetail_LRNumber] UNIQUE NONCLUSTERED 
(
	[SenderBranchAccountMappingid] ASC,
	[LRNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyDetail-Z_LRDate]  DEFAULT (getutcdate()) FOR [LRDate]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyDetail-Z_AddedOn]  DEFAULT (getutcdate()) FOR [AddedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyDetail-Z_ModifiedOn]  DEFAULT (getutcdate()) FOR [ModifiedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyDetail-Z_DeletedOn]  DEFAULT (getutcdate()) FOR [DeletedOn]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] ADD  CONSTRAINT [DF_Z-ChalanReceiveAgencyDetail-Z_Deleted]  DEFAULT ((0)) FOR [Deleted]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster] FOREIGN KEY([ChalanReceiveAgencyMasterId])
REFERENCES [dbo].[Z-ChalanReceiveAgencyDetail-Z] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_ChalanReceiveAgencyMaster]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping] FOREIGN KEY([SenderBranchAccountMappingid])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_City_From] FOREIGN KEY([CityIdFrom])
REFERENCES [dbo].[City] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_City_From]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_City_To] FOREIGN KEY([CityIdTo])
REFERENCES [dbo].[City] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_City_To]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping1] FOREIGN KEY([AccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping1]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping2] FOREIGN KEY([DeliveryAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping2]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_TransportLRPayType] FOREIGN KEY([LRPayTypeId])
REFERENCES [dbo].[TransportLRPayType] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_TransportLRPayType]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping3] FOREIGN KEY([BillAccountBranchMappingId])
REFERENCES [dbo].[CustomerAccountBranchMapping] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerAccountBranchMapping3]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser] FOREIGN KEY([AddedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser1] FOREIGN KEY([DeletedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser1]
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z]  WITH CHECK ADD  CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser2] FOREIGN KEY([ModifiedById])
REFERENCES [dbo].[CustomerUser] ([Id])
GO

ALTER TABLE [dbo].[Z-ChalanReceiveAgencyDetail-Z] CHECK CONSTRAINT [FK_Z-ChalanReceiveAgencyDetail-Z_CustomerUser2]
GO