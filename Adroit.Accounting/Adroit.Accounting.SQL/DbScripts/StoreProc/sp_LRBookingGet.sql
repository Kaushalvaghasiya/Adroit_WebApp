CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingGet]
(
	@Id INT,
	@LoginId INT,
	@FirmId INT,
	@BranchId INT
)
AS
BEGIN

	DECLARE @CustomerId INT = dbo.fn_GetCustomerId(@LoginId);

	SELECT [Z-LRBooking-Z].*
	,[TransportDesc].Title As Description
	,[TransportPacking].Title As Packing
	FROM [Z-LRBooking-Z]
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

	SELECT ISNULL(CONVERT(VARCHAR(10), MIN(LRDate), 103), CONVERT(VARCHAR(10), GETDATE(), 103)) As LRBOOKINGMINDATE 
	FROM [Z-LRBooking-Z]
	WHERE [Z-LRBooking-Z].BranchId = @BranchId
	
END
GO