CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingList_Select]
(
	@BranchId AS INT,
	@LRPayTypeId AS INT
)
AS
BEGIN
	SELECT [Z-LRBooking-Z].LRNumber AS Text
	FROM [Z-LRBooking-Z]
	WHERE [Z-LRBooking-Z].Deleted = 0 AND [Z-LRBooking-Z].LRPayTypeId = @LRPayTypeId
END
GO