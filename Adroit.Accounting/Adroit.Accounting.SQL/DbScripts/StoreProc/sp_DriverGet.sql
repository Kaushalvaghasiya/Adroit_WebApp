CREATE OR ALTER PROCEDURE [dbo].[sp_DriverGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT 
		Driver.*
	FROM Driver
	WHERE Id = @Id And CustomerId = @CustomerId
END


GO


