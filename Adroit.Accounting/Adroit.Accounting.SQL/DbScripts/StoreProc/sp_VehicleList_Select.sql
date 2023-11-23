CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleList_Select] 
(
	@UserId INT
)
AS
BEGIN

	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT [Vehilcle].Id As Value, [Vehilcle].VRN As Text
	FROM [Vehilcle]
	WHERE Deleted = 0 AND Active = 1
	AND [Vehilcle].CustomerId = @CustomerId
	ORDER BY [Vehilcle].VRN

END
GO