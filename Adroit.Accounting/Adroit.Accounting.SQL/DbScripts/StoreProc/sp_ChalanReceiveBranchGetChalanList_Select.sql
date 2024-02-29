CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveBranchGetChalanList_Select]
(
	@LoginId INT,
	@FirmId INT,
	@BranchId INT,
	@SenderId INT
)
AS
BEGIN
	SELECT PurchaseBillMaster.Id AS Value, CAST(BillNumberBranch AS VARCHAR) + ' /' + CAST(YEAR(FinanceYear.YearFrom) AS VARCHAR) + '-' + SUBSTRING(CAST(YEAR(FinanceYear .YearTo) AS VARCHAR),3,2)  AS Text
	FROM [Z-PurchaseBillMaster-Z] AS PurchaseBillMaster
	INNER JOIN FinanceYear ON PurchaseBillMaster.YearId = FinanceYear.Id
	WHERE PurchaseBillMaster.Id NOT IN 
		(	
			SELECT DISTINCT [Z-ChalanReceive-Z].PurchaseBillMasterId 
			FROM [Z-ChalanReceive-Z] 
			WHERE FirmId = @FirmId
			AND BranchId = @BranchId 
			AND Deleted = 0
		)
	AND PurchaseBillMaster.BranchId = @SenderId
	AND PurchaseBillMaster.BranchIdTo = @BranchId
	AND PurchaseBillMaster.Deleted = 0 
END
GO