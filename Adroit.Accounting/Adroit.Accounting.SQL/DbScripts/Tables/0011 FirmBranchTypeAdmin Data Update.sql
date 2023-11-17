SET IDENTITY_INSERT [dbo].[FirmBranchTypeAdmin] ON 
GO
UPDATE [FirmBranchTypeAdmin] SET [Title] = 'Head Office', [OrderNumber] = 1 WHERE ID = 1
GO
UPDATE [FirmBranchTypeAdmin] SET [Title] = 'Main Branch', [OrderNumber] = 2 WHERE ID = 2
GO
UPDATE [FirmBranchTypeAdmin] SET [Title] = 'Sub Branch', [OrderNumber] = 3 WHERE ID = 3
GO
UPDATE [FirmBranchTypeAdmin] SET [Title] = 'Company Agent', [OrderNumber] = 4 WHERE ID = 4
GO
INSERT [FirmBranchTypeAdmin] ([Id], [Title], [OrderNumber], [Deleted]) VALUES (5, N'Other Company', 5, 0)
GO
SET IDENTITY_INSERT [dbo].[FirmBranchTypeAdmin] OFF
GO