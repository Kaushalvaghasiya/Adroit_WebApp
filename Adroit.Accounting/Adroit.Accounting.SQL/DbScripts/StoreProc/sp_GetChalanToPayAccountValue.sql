CREATE OR ALTER   PROCEDURE [dbo].[sp_GetChalanToPayAccountValue]
(
	@BranchId INT,
	@LRNumberId VARCHAR(MAX)
)
AS
BEGIN
	
	SELECT [Z-LRBooking-Z].BranchId
	,[Z-LRBooking-Z].AccountBranchMappingId
	,SUM([Z-LRBooking-Z].InvoiceValue) As ToPayAccountValue
	FROM [Z-LRBooking-Z]
	LEFT JOIN CustomerAccountBranchMapping CABM ON [Z-LRBooking-Z].AccountBranchMappingId = CABM.Id AND CABM.Deleted = 0
	WHERE [Z-LRBooking-Z].Deleted = 0
	AND [Z-LRBooking-Z].Id IN (SELECT Id FROM [dbo].[fnStringToIntArray](@LRNumberId))
	AND [Z-LRBooking-Z].BranchId = @BranchId
	GROUP BY [Z-LRBooking-Z].BranchId,[Z-LRBooking-Z].AccountBranchMappingId

END
GO