CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccounBranchMappingList_Select]
(
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As [Value], 		
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	WHERE CustomerAccount.CustomerId = @CustomerId AND CustomerAccount.Active = 1 AND CustomerAccount.Deleted = 0
	Order by CustomerAccount.[Name];
END
GO