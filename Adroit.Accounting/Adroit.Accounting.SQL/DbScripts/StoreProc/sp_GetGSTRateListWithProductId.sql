CREATE OR ALTER PROCEDURE [dbo].[sp_GetGSTRateListWithProductId]
(
	@ProductId INT
)
AS
BEGIN
	SELECT [GSTRate].Rate AS Rate
	FROM [Product]
	INNER JOIN [GSTRate] ON [GSTRate].Id = [Product].GSTRateId
	WHERE [Product].Active = 1 AND [Product].Deleted = 0 AND [Product].Id = @ProductId
END
GO