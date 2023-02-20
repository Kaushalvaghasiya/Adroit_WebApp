ALTER TABLE Customer ADD EmailOTP varchar(6)
GO
ALTER TABLE Customer ADD MobileOTP varchar(6)
GO
ALTER TABLE Customer ADD StatusId int
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_CustomerStatus] FOREIGN KEY([StatusId])
REFERENCES [dbo].[CustomerStatus] ([Id])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_CustomerStatus]
GO