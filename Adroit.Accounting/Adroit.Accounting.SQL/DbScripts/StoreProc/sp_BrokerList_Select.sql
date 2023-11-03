CREATE OR ALTER PROCEDURE [dbo].[sp_BrokerList_Select]
(
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT 
		[Broker].Id As Value,
		ISNULL([Broker].Name , '')  As Text
	FROM [Customer]
	INNER JOIN [Broker] on [Customer].Id = [Broker].CustomerId
	WHERE [Customer].Id = @CustomerId
	AND [Customer].Deleted = 0
	AND [Broker].Deleted = 0
	ORDER BY [Broker].Name
END


GO


