CREATE OR ALTER PROCEDURE [dbo].[sp_BranchWithFirmList_Select]
@customerId INT
AS
BEGIN
	SELECT branch.Id,branch.Title+'('+firm.Title+')' as Title
	FROM Customer as c
	INNER JOIN CustomerFirm as firm on c.Id=Firm.CustomerId
	INNER JOIN CustomerFirmBranch as branch on firm.Id=branch.FirmId
	where c.id=@customerId
	ORDER BY branch.Title
END
GO