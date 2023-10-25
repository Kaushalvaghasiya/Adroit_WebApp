CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountGroupHeaderList_Select] 
(	@UserId	INT)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

	SELECT Id As Value,Title As Text
	FROM CustomerAccountGroupHeader
	WHERE Deleted = 0 AND Active = 1 And CustomerId = @CustomerId
	ORDER BY Title
END
GO