ALTER TABLE CustomerUser ADD LoggedInBranchId INT NULL, LoggedInTime datetime NULL, LoggedInYear INT
GO

ALTER TABLE CustomerUser WITH CHECK ADD CONSTRAINT [FK_CustomerUser_CustomerFirmBranch_LoggedInBranchId] FOREIGN KEY(LoggedInBranchId)
REFERENCES [dbo].[CustomerFirmBranch] ([Id])
GO

ALTER TABLE CustomerUser WITH CHECK ADD CONSTRAINT [FK_CustomerUser_FinanceYear_LoggedInYear] FOREIGN KEY(LoggedInYear)
REFERENCES [dbo].[FinanceYear] ([Id])
GO

