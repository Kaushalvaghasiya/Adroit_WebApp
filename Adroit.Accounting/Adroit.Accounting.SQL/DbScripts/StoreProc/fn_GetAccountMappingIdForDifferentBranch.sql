CREATE OR ALTER FUNCTION [dbo].[fn_GetAccountMappingIdForDifferentBranch]
(
	@accountmappingId int,
	@branchId int
)
RETURNS INT
AS
BEGIN
	DECLARE @name varchar(100) = ''
	DECLARE @accountId int

	SELECT TOP 1 @accountId = AccountId
	FROM CustomerAccountBranchMapping
	WHERE CustomerAccountBranchMapping.Id = @accountmappingId 

	SELECT TOP 1 @accountmappingId = CustomerAccountBranchMapping.Id
	FROM CustomerAccount
	INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.Id = @accountId 
	AND CustomerAccountBranchMapping.BranchId = @branchId

	RETURN @accountmappingId 
END