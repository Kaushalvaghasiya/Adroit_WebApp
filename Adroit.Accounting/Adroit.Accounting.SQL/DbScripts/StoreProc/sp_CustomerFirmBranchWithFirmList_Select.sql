CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchWithFirmList_Select]
(@CustomerId INT)
AS
BEGIN
	SELECT branch.Id As Value, branch.Title + ' (' + firm.Title + ')' As Text
	FROM Customer as c
	INNER JOIN CustomerFirm as firm on c.Id = Firm.CustomerId
	INNER JOIN CustomerFirmBranch as branch on firm.Id = branch.FirmId
	WHERE c.id = @CustomerId
	AND c.IsDeleted = 0
	AND firm.IsDeleted = 0
	AND branch.IsDeleted = 0
	ORDER BY firm.Title, branch.Title
END
GO