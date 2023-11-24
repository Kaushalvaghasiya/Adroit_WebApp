CREATE OR ALTER PROCEDURE [dbo].[sp_GetLRNumberFromLRBooking] (
	@BranchId int
)
AS
BEGIN

	SELECT MAX(LRNumber) + 1 AS LRNumber
	FROM [Z-LRBooking-Z]
	WHERE BranchId = @BranchId
	
END
GO