CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmList_Select]
(
	@CustomerId INT
)
AS
BEGIN
	SELECT 
		CustomerFirm.Id As Value,
		CustomerFirm.Title As Text
	FROM [Customer]
	INNER JOIN CustomerFirm on [Customer].Id = CustomerFirm.CustomerId
	WHERE [Customer].Id = @CustomerId
	AND [Customer].IsDeleted = 0
	AND CustomerFirm.IsDeleted = 0
	ORDER BY CustomerFirm.Title 
END
GO