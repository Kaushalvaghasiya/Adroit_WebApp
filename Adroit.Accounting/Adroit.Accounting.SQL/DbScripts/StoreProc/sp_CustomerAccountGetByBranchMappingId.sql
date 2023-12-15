CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGetByBranchMappingId]
(
	@CustomerAccountBranchMappingId INT,
	@BranchId INT
)
AS
BEGIN

	SELECT CustomerAccount.*
	FROM CustomerAccount
		INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccountBranchMapping.Id = @CustomerAccountBranchMappingId AND CustomerAccountBranchMapping.BranchId = @BranchId

END
GO