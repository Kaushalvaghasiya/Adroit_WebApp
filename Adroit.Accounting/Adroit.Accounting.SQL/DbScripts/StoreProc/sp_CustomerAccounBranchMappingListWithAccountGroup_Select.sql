CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccounBranchMappingListWithAccountGroup_Select]
(
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As [Value], 
	CustomerAccount.[Name] + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As [Text]
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN CustomerAccountGroup On CustomerAccountGroup.Id = CustomerAccount.AccountGroupId
	WHERE CustomerAccount.CustomerId = @CustomerId
	AND CustomerAccountBranchMapping.BranchId = @BranchId
	Order by CustomerAccount.[Name];
END
GO