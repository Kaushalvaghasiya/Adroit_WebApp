CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleList_Select] 
(
	@LoginId INT
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerId(@LoginId);
	DECLARE @BranchId INT
	SET @BranchId = DBO.fn_GetLoggedInBranchId(@LoginId)

	SELECT 
	[Vehilcle].Id As Value,
	CONCAT(
        ISNULL([Vehilcle].VRN, ''),
        NULLIF(' | ' + ISNULL(VehicleOwner.Name, ''), ' | ')
    ) AS Text,
	ISNULL(CustomerAccountBranchMapping.Id, 0) AS Other
	FROM [Vehilcle]
	INNER JOIN VehicleOwner on VehicleOwner.Id = [Vehilcle].OwnerId 
	LEFT JOIN CustomerAccount ON VehicleOwner.AccountId = CustomerAccount.Id
	LEFT JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
	WHERE [Vehilcle].CustomerId = @CustomerId
	AND [Vehilcle].Deleted = 0 AND [Vehilcle].Active = 1 
	AND CustomerAccountBranchMapping.BranchId = @BranchId
	ORDER BY [Vehilcle].VRN

END
GO