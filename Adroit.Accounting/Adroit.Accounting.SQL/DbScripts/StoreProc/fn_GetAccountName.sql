CREATE OR ALTER FUNCTION [fn_GetAccountName]
(
	@accountmappingId int
)
RETURNS varchar(max)
AS
BEGIN
	DECLARE @name varchar(100) = ''

	SELECT TOP 1 @name = CustomerAccount.Name
	FROM CustomerAccountBranchMapping
	INNER JOIN CustomerAccount ON CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
	WHERE CustomerAccountBranchMapping.Id = @accountmappingId 

	RETURN SUBSTRING(@name, 0, LEN(@name))
END