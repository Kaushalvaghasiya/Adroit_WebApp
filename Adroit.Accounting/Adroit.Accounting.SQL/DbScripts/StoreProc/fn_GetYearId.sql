CREATE OR ALTER FUNCTION [dbo].[fn_GetYearId]
(
	@FirmId int = NULL,
	@LoginId int = 0
)
RETURNS int
AS
BEGIN
	DECLARE @YearId int

	SELECT @YearId = [FinanceYear].Id
	FROM [FinanceYear] 
	INNER JOIN CustomerUser ON [FinanceYear].Id = CustomerUser.LoggedInYear
	WHERE CustomerUser.Id = @LoginId

	RETURN @YearId;
END
GO
