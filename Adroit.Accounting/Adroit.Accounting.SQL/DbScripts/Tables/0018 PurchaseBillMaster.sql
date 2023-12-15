ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD [BranchIdTo] [int] NULL;
GO

ALTER TABLE [dbo].[Z-PurchaseBillMaster-Z] ADD CONSTRAINT [FK_Z-PurchaseBillMaster-Z_BranchIdTo] FOREIGN KEY (BranchIdTo) 
REFERENCES [dbo].CustomerFirmBranch(Id) 
GO	