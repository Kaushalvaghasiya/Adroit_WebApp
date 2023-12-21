CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveBranchGetChalanList_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId INT,
	@SenderId INT
)
AS
BEGIN
	DECLARE @CustomerId INT = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT [Z-PurchaseBillMaster-Z].BillNumberBranch AS Text
	FROM [Z-PurchaseBillMaster-Z]
	WHERE [Z-PurchaseBillMaster-Z].Id NOT IN 
		(	
			SELECT DISTINCT [Z-ChalanReceive-Z].PurchaseBillMasterId 
			FROM [Z-ChalanReceive-Z] 
			WHERE [Z-ChalanReceive-Z].BranchId = @BranchId 
			AND [Z-ChalanReceive-Z].FirmId = @FirmId
			AND [Z-ChalanReceive-Z].YearId = @YearId
			AND [Z-ChalanReceive-Z].UserId = @CustomerId
			AND [Z-ChalanReceive-Z].Deleted = 0
		)
	AND [Z-PurchaseBillMaster-Z].[BranchId] = @SenderId
	AND [Z-PurchaseBillMaster-Z].YearId = @YearId 
	AND [Z-PurchaseBillMaster-Z].Deleted = 0 

END
GO