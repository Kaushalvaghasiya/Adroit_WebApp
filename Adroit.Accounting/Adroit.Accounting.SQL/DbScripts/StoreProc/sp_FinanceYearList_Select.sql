CREATE OR ALTER PROCEDURE [dbo].[sp_FinanceYearList_Select]
(
	@BranchId INT
)
AS
BEGIN
	SELECT FinanceYear.Id As Value, FinanceYear.Title As Text
	FROM CustomerFirmBranch
	INNER JOIN CustomerFirm on CustomerFirm.Id = CustomerFirmBranch.FirmId AND CustomerFirm.Deleted = 0
	INNER JOIN FinanceYear on FinanceYear.FirmId = CustomerFirm.Id AND FinanceYear.Deleted = 0 AND FinanceYear.Active = 1
	WHERE CustomerFirmBranch.Deleted = 0 AND CustomerFirmBranch.Active = 1 
	AND CustomerFirmBranch.Id = @BranchId 
	ORDER BY FinanceYear.Title
END
GO


