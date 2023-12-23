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
	DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId) , @VehicleOwnerId INT = 0;

	SELECT TOP 1 @VehicleOwnerId = OwnerId FROM Vehilcle WHERE Id = @VehicleId;

	SELECT CustomerAccountBranchMapping.Id As [Value], 		
		CASE ISNULL(CustomerAccount.[PrintName], '') WHEN '' THEN CustomerAccount.[Name] ELSE CustomerAccount.[PrintName] 
		END + ' (' + [CustomerAccountGroup].Title + ' - ' + [CustomerAccountGroup].Code + ')' As Text 
	FROM CustomerAccount
	INNER JOIN [CustomerAccountGroup] ON CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id 	
	INNER JOIN CustomerAccountBranchMapping ON CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
	INNER JOIN VehicleOwner ON VehicleOwner.AccountId = CustomerAccountBranchMapping.AccountId AND VehicleOwner.CustomerId = CustomerAccount.CustomerId
	LEFT JOIN [Z-LRBooking-Z] ON [Z-LRBooking-Z].BillAccountBranchMappingId = CustomerAccount.Id
	LEFT JOIN [Z-PurchaseBillDetail-Z] ON [Z-LRBooking-Z].Id = [Z-PurchaseBillDetail-Z].LRBookingId
	WHERE VehicleOwner.Id = @VehicleOwnerId 
		AND VehicleOwner.AccountId = CustomerAccount.Id
		AND CustomerAccount.AccountGroupId = [CustomerAccountGroup].Id  
		AND CustomerAccountBranchMapping.AccountId = CustomerAccount.Id
		AND ([Z-LRBooking-Z].Id IS NULL OR [Z-LRBooking-Z].Id NOT IN (SELECT LRBookingId FROM [Z-PurchaseBillDetail-Z]))
		AND CustomerAccountBranchMapping.BranchId = @BranchId 		
		AND CustomerAccount.CustomerId = @CustomerId 
		AND CustomerAccount.Active = 1 
		AND CustomerAccount.Deleted = 0
	ORDER BY CustomerAccount.[Name];
END
GO