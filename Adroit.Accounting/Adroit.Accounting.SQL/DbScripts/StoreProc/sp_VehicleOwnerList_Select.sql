CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleOwnerList_Select] (
	@UserId int
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT Id As Value,[Name] As Text
	FROM [VehicleOwner]
	WHERE CustomerId = @CustomerId
	And Deleted = 0 AND Active = 1
	ORDER BY [Name]
END
GO