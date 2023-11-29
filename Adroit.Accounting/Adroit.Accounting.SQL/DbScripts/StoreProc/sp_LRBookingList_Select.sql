CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingList_Select] 
(
	@branchId INT
)
AS
BEGIN

	SELECT [Z-LRBooking-Z].Id As Value, [Z-LRBooking-Z].LRNumber As Text
	FROM [Z-LRBooking-Z]
	WHERE Deleted = 0 
	AND [Z-LRBooking-Z].BranchId = @branchId
	ORDER BY [Z-LRBooking-Z].LRNumber

END
GO