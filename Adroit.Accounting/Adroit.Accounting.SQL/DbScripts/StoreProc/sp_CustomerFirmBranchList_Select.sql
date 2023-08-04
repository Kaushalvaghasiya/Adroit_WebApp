CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmBranchList_Select]
(@FirmId INT)
AS
BEGIN
	SELECT 
		CustomerFirmBranch.Id As Value, 
		CustomerFirmBranch.Title As Text
	FROM CustomerFirm 
	INNER JOIN CustomerFirmBranch on CustomerFirm.Id = CustomerFirmBranch.FirmId
	WHERE CustomerFirm.Id = @FirmId 
	AND CustomerFirm.IsDeleted = 0
	AND CustomerFirmBranch.IsDeleted = 0
	ORDER BY CustomerFirmBranch.Title
END
GO