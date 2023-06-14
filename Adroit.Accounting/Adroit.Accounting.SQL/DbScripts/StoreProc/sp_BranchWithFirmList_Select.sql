CREATE OR ALTER PROCEDURE [dbo].[sp_BranchWithFirmList_Select]
@customerId INT
AS
BEGIN
	SELECT branch.Id As Value, branch.Title + ' (' + firm.Title + ')' As Text
	FROM Customer as c
	INNER JOIN CustomerFirm as firm on c.Id=Firm.CustomerId
	INNER JOIN CustomerFirmBranch as branch on firm.Id=branch.FirmId
	WHERE c.id=@customerId
	AND c.IsDeleted = 0 AND c.IsActive = 1
	AND firm.IsDeleted = 0 AND firm.IsActive = 1
	AND branch.IsDeleted = 0 AND branch.IsActive = 1
	ORDER BY firm.Title, branch.Title
END
GO