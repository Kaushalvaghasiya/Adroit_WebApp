CREATE OR ALTER PROCEDURE [dbo].[sp_GetLRNumberFromZ_LRBooking_Z] (
	@BranchId int
)
AS
BEGIN

	SELECT MAX(LRNumber) + 1 AS LRNumber
	FROM [Z-LRBooking-Z]
	WHERE BranchId = @BranchId
	
END
GO