CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanGet]
(
	 @loginId INT
	,@branchId INT
	,@Id INT
)
AS
BEGIN
	
	SELECT 
		PBM.*,
		CA1.Name AS ToPayAccount,
		(SELECT STUFF((SELECT ',' + CAST(t1.LRBookingId AS VARCHAR) FROM [Z-PurchaseBillDetail-Z] t1
						WHERE t1.PurchaseBillMasterId = t.PurchaseBillMasterId FOR XML PATH('')),1,1,'') Concats
			FROM  [Z-PurchaseBillDetail-Z] t
			WHERE t.PurchaseBillMasterId = @Id GROUP BY t.PurchaseBillMasterId) AS LRNumberId
	FROM [Z-PurchaseBillMaster-Z] PBM
	LEFT JOIN [CustomerAccountBranchMapping] CABM1 on CABM1.Id = PBM.ToPayAccountBranchMappingId
	LEFT JOIN [CustomerAccount] CA1 on CA1.Id = CABM1.AccountId
	WHERE PBM.BranchId = @branchId AND PBM.Id = @Id

END
GO