CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanCustomerAccounListWithGroup_Select]
(
	@FirmId INT,
	@BranchId INT,
	@VehicleId INT,
	@LoginId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

	SELECT CustomerAccountBranchMapping.Id As [Value], 		
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	From CustomerAccount
	INNER JOIN VehicleOwner on VehicleOwner.AccountId = CustomerAccount.Id AND VehicleOwner.CustomerId = @CustomerId AND VehicleOwner.Active = 0
	INNER JOIN Vehilcle on Vehilcle.OwnerId = VehicleOwner.Id AND Vehilcle.CustomerId = @CustomerId AND Vehilcle.Active = 0
	INNER JOIN CustomerAccountBranchMapping on VehicleOwner.AccountId = CustomerAccountBranchMapping.AccountId
	INNER JOIN [CustomerAccountGroup] on CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 
	LEFT JOIN [Z-LRBooking-Z] on CustomerAccount.Id = [Z-LRBooking-Z].BillAccountBranchMappingId 
	WHERE [Z-LRBooking-Z].Id NOT IN ( SELECT DISTINCT [Z-PurchaseBillDetail-Z].LRBookingId FROM [Z-PurchaseBillDetail-Z] WHERE [Z-PurchaseBillDetail-Z].Deleted = 0 ) 
		AND [Z-LRBooking-Z].[BranchId] = @BranchId
		AND [Z-LRBooking-Z].YearId = @YearId 
		AND CustomerAccount.CustomerId = @CustomerId 
		AND CustomerAccountBranchMapping.BranchId = @BranchId 
		AND Vehilcle.Id = @VehicleId 
		AND CustomerAccount.Active = 1 
		AND CustomerAccount.Deleted = 0
		AND [Z-LRBooking-Z].Deleted = 0 
	Order by CustomerAccount.[Name];
END
GO