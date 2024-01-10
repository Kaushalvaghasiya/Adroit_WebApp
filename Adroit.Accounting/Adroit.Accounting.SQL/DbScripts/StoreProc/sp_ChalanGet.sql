CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanGet]
(
	 @LoginId INT
	,@BranchId INT
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
			WHERE t.PurchaseBillMasterId = @Id GROUP BY t.PurchaseBillMasterId) AS LRNumberId,
		(SELECT Name From CustomerAccount 
			INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
			WHERE CustomerAccountBranchMapping.Id = [ToPayAccountBranchMappingId]) AS ToPayAccountBranchMappingLbl
	FROM [Z-PurchaseBillMaster-Z] PBM
	LEFT JOIN [CustomerAccountBranchMapping] CABM1 on CABM1.Id = PBM.ToPayAccountBranchMappingId AND CABM1.Deleted = 0
	LEFT JOIN [CustomerAccount] CA1 on CA1.Id = CABM1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
	WHERE PBM.BranchId = @BranchId AND PBM.Id = @Id
	AND PBM.Deleted = 0

END
GO