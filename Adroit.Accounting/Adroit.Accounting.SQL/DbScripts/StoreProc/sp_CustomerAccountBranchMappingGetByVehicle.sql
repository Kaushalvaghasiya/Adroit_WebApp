CREATE OR ALTER PROCEDURE [sp_CustomerAccountBranchMappingGetByVehicle]
(
	@LoginId INT,
	@VehicleId INT
)
AS
BEGIN
	DECLARE @BranchId INT
	SET @BranchId = DBO.fn_GetLoggedInBranchId(@LoginId)

	Select CustomerAccountBranchMapping.Id
	,COALESCE(NULLIF([CustomerAccount].PrintName, ''), [CustomerAccount].[Name])
	from CustomerAccount
	INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	INNER JOIN VehicleOwner ON VehicleOwner.AccountId = CustomerAccount.Id
	INNER JOIN Vehilcle ON Vehilcle.OwnerId = VehicleOwner.Id
	WHERE CustomerAccountBranchMapping.BranchId = @BranchId
	AND Vehilcle.Id = @VehicleId
END