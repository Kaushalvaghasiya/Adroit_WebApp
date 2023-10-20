CREATE OR ALTER FUNCTION [dbo].[fn_GetCustomerId]
(
	@UserId int
)
RETURNS int
AS
BEGIN
	DECLARE @CustomerId int
	SELECT
		@CustomerId = CustomerId
	FROM CustomerUser
	WHERE Id = @UserId

	RETURN @CustomerId;
END
GO
