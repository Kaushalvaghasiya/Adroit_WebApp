CREATE OR ALTER FUNCTION [dbo].[fn_GetYearId]
(
	@LoginId int = 0
)
RETURNS int
AS
BEGIN
	DECLARE @YearId int

	SELECT @YearId = LoggedInYear
	FROM CustomerUser
	WHERE CustomerUser.Id = @LoginId

	RETURN @YearId;
END
GO
