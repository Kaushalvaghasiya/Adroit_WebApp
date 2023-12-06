CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountListByBranchiMapping_Select]
(
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirmId(@FirmId);

	SELECT CustomerAccountBranchMapping.Id As [Value], CustomerAccount.[Name] As [Text]
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE CustomerAccount.CustomerId = @CustomerId
	AND CustomerAccountBranchMapping.BranchId = @BranchId
	Order by CustomerAccount.[Name];
END
GO