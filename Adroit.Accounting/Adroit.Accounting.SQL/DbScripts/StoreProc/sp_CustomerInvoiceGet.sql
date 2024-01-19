CREATE OR ALTER   PROCEDURE [dbo].[sp_CustomerInvoiceGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN

	SELECT 
		SBM.*,
		(SELECT STUFF((SELECT ',' + CAST(t1.LRBookingId AS VARCHAR) FROM [Z-SalesBillDetail-Z] t1
						WHERE t1.SalesBillMasterId = t.SalesBillMasterId FOR XML PATH('')),1,1,'') Concats
			FROM  [Z-SalesBillDetail-Z] t
			WHERE t.SalesBillMasterId = @Id GROUP BY t.SalesBillMasterId) AS LRNumberId,
			CASE ISNULL(CustomerAccount.[PrintName], '') 
				WHEN '' THEN CustomerAccount.[Name] 
				ELSE CustomerAccount.[PrintName] 
				END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As BillPartyName
	FROM [Z-SalesBillMaster-Z] SBM
	INNER JOIN CustomerAccountBranchMapping ON SBM.AccountBranchMappingId = CustomerAccountBranchMapping.Id
	INNER JOIN CustomerAccount ON CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	WHERE SBM.BranchId = @BranchId AND SBM.Id = @Id
	AND SBM.Deleted = 0

END
GO