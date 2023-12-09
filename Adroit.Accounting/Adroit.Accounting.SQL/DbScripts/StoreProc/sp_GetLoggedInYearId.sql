CREATE OR ALTER PROCEDURE [dbo].[sp_GetLoggedInYearId] 
(
	@LoginId INT
)
AS
BEGIN
	DECLARE @YearId int
	SELECT @YearId = dbo.fn_GetYearId(@LoginId)

	SELECT @YearId 
END

