CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountBranchMappingListById]
(
	@CustomerAccountBranchMappingId INT,
	@BranchId INT
)
AS
BEGIN

	SELECT CustomerAccount.CreditDays As CreditDays
	,CustomerAccount.TDS As TDS
	,CustomerAccount.TCS As TCS
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccountBranchMapping.Id = @CustomerAccountBranchMappingId AND CustomerAccountBranchMapping.BranchId = @BranchId

END
GO