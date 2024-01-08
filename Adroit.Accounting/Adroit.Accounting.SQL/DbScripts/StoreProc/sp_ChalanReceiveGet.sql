CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanReceiveGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN
	
	SELECT PBMR.*
		,PBM.BillNumberBranch AS ChalanNumber
		,PBM.BranchId AS SenderId
	FROM [Z-PurchaseBillMaster-Z] PBM
	LEFT JOIN [Z-ChalanReceive-Z] PBMR on PBMR.PurchaseBillMasterId = PBM.Id AND PBMR.Deleted = 0 AND PBMR.BranchId = @BranchId
	WHERE PBMR.Id = @Id

END
GO