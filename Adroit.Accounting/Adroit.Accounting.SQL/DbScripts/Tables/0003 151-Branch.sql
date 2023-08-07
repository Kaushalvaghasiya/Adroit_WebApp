IF NOT EXISTS (SELECT * FROM sys.indexes WHERE object_id = OBJECT_ID(N'[dbo].[CustomerFirmBranch]') 
	AND name = N'IX_CustomerFirmBranchShortTitle')
ALTER TABLE CustomerFirmBranch 
	ADD CONSTRAINT IX_CustomerFirmBranchShortTitle UNIQUE ([FirmId], [ShortTitle]);   
GO  
