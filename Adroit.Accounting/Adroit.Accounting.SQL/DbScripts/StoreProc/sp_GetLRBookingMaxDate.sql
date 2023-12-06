CREATE OR ALTER PROCEDURE [dbo].[sp_GetLRBookingMaxDate] 
(
	@branchId INT
)
AS
BEGIN
	SELECT ISNULL(CONVERT(VARCHAR(10), MAX(LRDate), 103), '') As [Text]
	FROM [Z-LRBooking-Z]
	WHERE Deleted = 0 
	AND BranchId = @branchId
	ORDER BY [Text]
END


