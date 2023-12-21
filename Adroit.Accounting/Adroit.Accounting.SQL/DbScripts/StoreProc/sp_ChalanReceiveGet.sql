CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN
	
	SELECT 
		PBMR.*,PBM.BillNumberBranch AS BillNumberBranch
	FROM [Z-ChalanReceive-Z] PBMR
	INNER JOIN [Z-PurchaseBillMaster-Z] PBM on PBM.Id = PBMR.PurchaseBillMasterId AND PBM.Deleted = 0 AND PBM.BranchId = @BranchId
	WHERE PBMR.BranchId = @BranchId AND PBMR.Id = @Id
	AND PBMR.Deleted = 0

END
GO