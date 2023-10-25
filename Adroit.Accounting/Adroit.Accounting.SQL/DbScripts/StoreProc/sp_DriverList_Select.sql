CREATE OR ALTER PROCEDURE [dbo].[sp_DriverList_Select]
(
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT 
		Driver.Id As Value,
		ISNULL(Driver.Name , '')  As Text
	FROM [Customer]
	INNER JOIN Driver on [Customer].Id = Driver.CustomerId
	WHERE [Customer].Id = @CustomerId
	AND [Customer].Deleted = 0
	AND Driver.Deleted = 0
	ORDER BY Driver.Name
END


GO


