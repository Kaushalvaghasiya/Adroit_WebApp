CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleList_Select] 
(
	@UserId INT
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT [Vehilcle].Id As Value
	,CONCAT(
        ISNULL([Vehilcle].VRN, ''),
        NULLIF(' | ' + ISNULL(VehicleOwner.Name, ''), ' | ')
    ) AS Text
	FROM [Vehilcle]
	INNER JOIN VehicleOwner on VehicleOwner.Id = [Vehilcle].OwnerId AND VehicleOwner.CustomerId = @CustomerId AND VehicleOwner.Active = 1 AND VehicleOwner.Deleted = 0
	WHERE [Vehilcle].Deleted = 0 AND [Vehilcle].Active = 1 AND [Vehilcle].CustomerId = @CustomerId
	ORDER BY [Vehilcle].VRN

END
GO