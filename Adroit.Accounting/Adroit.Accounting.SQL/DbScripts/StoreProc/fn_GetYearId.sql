CREATE OR ALTER FUNCTION [dbo].[fn_GetYearId]
(
	@FirmId int
)
RETURNS int
AS
BEGIN
	DECLARE @YearId int
	SELECT
		@YearId = Id
	FROM FinanceYear
	WHERE Id = @FirmId

	RETURN @YearId;
END
GO
