CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerGeneralExpenceMultiGetCustomerAccountListByBranchMappingId]
(
	@CustomerAccountBranchMappingId INT,
	@branchId INT
)
AS
BEGIN

	SELECT CustomerAccount.*
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccountBranchMapping.Id = @CustomerAccountBranchMappingId AND CustomerAccountBranchMapping.BranchId = @branchId

END
GO