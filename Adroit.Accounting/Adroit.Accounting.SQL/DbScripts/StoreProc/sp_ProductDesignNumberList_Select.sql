CREATE OR ALTER PROCEDURE [dbo].[sp_ProductDesignNumberList_Select] (@FirmId INT)
AS
BEGIN
    Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT Id As Value, Title As Text
	FROM [ProductDesignNumber] 
	WHERE CustomerId = @CustomerId AND Deleted = 0 AND Active = 1
	ORDER BY Title
END
GO