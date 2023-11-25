CREATE OR ALTER FUNCTION [dbo].[fn_GetYearId]
(
	@FirmId int,
	@LoginId int = 0
)
RETURNS int
AS
BEGIN
	DECLARE @YearId int
	SET @YearId = (SELECT TOP 1 Id
	FROM FinanceYear
	WHERE Id = @FirmId)

	RETURN @YearId;
END
GO
