CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveBranchGetChalanList_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId INT,
	@SenderId INT
)
AS
BEGIN
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);
	DECLARE @BookBranchMappingId INT 
	SELECT @BookBranchMappingId = PurcahseBookBranchMappingId 
		FROM CustomerFirmBranchTransportSetting 
		WHERE CustomerFirmBranchTransportSetting.BranchId = @SenderId 

	SELECT [Z-PurchaseBillMaster-Z].BillNumberBranch AS Text
	FROM [Z-PurchaseBillMaster-Z]
	WHERE [Z-PurchaseBillMaster-Z].Id NOT IN 
		(	
			SELECT DISTINCT [Z-ChalanReceive-Z].PurchaseBillMasterId 
			FROM [Z-ChalanReceive-Z] 
			WHERE FirmId = @FirmId
			AND BranchId = @BranchId 
			AND YearId = @YearId
			AND Deleted = 0
		)
	AND BranchId = @SenderId
	AND BranchIdTo = @BranchId
	AND YearId = @YearId 
	AND BookBranchMappingId = @BookBranchMappingId
	AND Deleted = 0 
END
GO