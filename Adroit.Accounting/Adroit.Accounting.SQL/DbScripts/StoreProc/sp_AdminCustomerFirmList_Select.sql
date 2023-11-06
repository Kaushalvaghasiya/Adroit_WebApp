CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmList_Select]
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
	AND [Customer].Deleted = 0
	AND CustomerFirm.Deleted = 0
	ORDER BY CustomerFirm.Title 
END
GO