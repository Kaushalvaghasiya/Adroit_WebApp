CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmBranchListByCustomer_Select]
(@CustomerId INT)
AS
BEGIN
	SELECT branch.Id As Value, branch.Title As Text
	FROM Customer as c
	INNER JOIN CustomerFirm as firm on c.Id = Firm.CustomerId
	INNER JOIN CustomerFirmBranch as branch on firm.Id = branch.FirmId
	WHERE c.Id = @CustomerId
	AND c.Deleted = 0
	AND firm.Deleted = 0
	AND branch.Deleted = 0
	ORDER BY firm.Title, branch.Title
END
GO