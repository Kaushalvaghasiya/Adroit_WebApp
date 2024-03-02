CREATE OR ALTER PROCEDURE [dbo].[sp_InvoiceCustomerAccounListWithGroup_Select]
(
	@FirmId INT,
	@BranchId INT,
	@PayTypeId INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT DISTINCT CustomerAccountBranchMapping.Id As [Value], 		
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	From CustomerAccount
	INNER JOIN CustomerAccountBranchMapping on CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	LEFT JOIN [Z-LRBooking-Z] on CustomerAccountBranchMapping.Id = [Z-LRBooking-Z].BillAccountBranchMappingId 
	WHERE [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT ISNULL([Z-SalesBillDetail-Z].LRBookingId, 0) FROM [Z-SalesBillDetail-Z] WHERE [Z-SalesBillDetail-Z].Deleted = 0 ) 
		AND [Z-LRBooking-Z].[BranchId] = @BranchId
		--AND [Z-LRBooking-Z].YearId = @YearId 
		AND (
		        (@PayTypeId = '0' AND [Z-LRBooking-Z].LRPayTypeId IN ('2', '3'))
		        OR
		        (@PayTypeId <> '0' AND [Z-LRBooking-Z].LRPayTypeId = @PayTypeId)
		    )
		AND CustomerAccount.CustomerId = @CustomerId 
		AND CustomerAccountBranchMapping.BranchId = @BranchId 
		AND [Z-LRBooking-Z].Deleted = 0 
	Order by CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' 
END
GO