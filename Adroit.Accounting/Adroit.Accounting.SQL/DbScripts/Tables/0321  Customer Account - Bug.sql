--Broker
ALTER TABLE CustomerAccount DROP CONSTRAINT FK_Account_CustomerFirmBrokerMapping
GO
ALTER TABLE CustomerAccount DROP COLUMN BrokerMappingId
GO
ALTER TABLE CustomerAccount ADD BrokerId INT
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD CONSTRAINT [FK_Account_Broker] FOREIGN KEY([BrokerId])
REFERENCES [dbo].[Broker] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_Account_Broker]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_Account_Broker]
GO

--Delivery & Shipping
ALTER TABLE CustomerAccount DROP CONSTRAINT FK_Account_Account_Delivery
ALTER TABLE CustomerAccount DROP CONSTRAINT FK_Account_Account_Shipping
GO
ALTER TABLE CustomerAccount DROP COLUMN DeliveryAccountBranchMappingId
ALTER TABLE CustomerAccount DROP COLUMN ShippingAccountBranchMappingId
GO
ALTER TABLE CustomerAccount ADD DeliveryAccountId INT
ALTER TABLE CustomerAccount ADD ShippingAccountId INT
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Delivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_Delivery] FOREIGN KEY([DeliveryAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Delivery]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_Delivery]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount]  WITH CHECK ADD  CONSTRAINT [FK_CustomerAccount_Shipping] FOREIGN KEY([ShippingAccountId])
REFERENCES [dbo].[CustomerAccount] ([Id])
GO
IF  EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[dbo].[FK_CustomerAccount_Shipping]') AND parent_object_id = OBJECT_ID(N'[dbo].[CustomerAccount]'))
ALTER TABLE [dbo].[CustomerAccount] CHECK CONSTRAINT [FK_CustomerAccount_Shipping]
GO