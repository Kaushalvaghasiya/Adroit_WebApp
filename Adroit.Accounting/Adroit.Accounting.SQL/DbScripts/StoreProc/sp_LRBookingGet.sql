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
	,(SELECT TOP 1 LRDate
	  FROM [Z-LRBooking-Z]
	  WHERE [Z-LRBooking-Z].Id < @Id AND [Z-LRBooking-Z].BranchId = @BranchId 
	  ORDER BY [Z-LRBooking-Z].Id DESC) AS LRBookingMaxDate,
	 (SELECT TOP 1 LRDate
	  FROM [Z-LRBooking-Z]
	  WHERE [Z-LRBooking-Z].Id > @Id AND [Z-LRBooking-Z].BranchId = @BranchId 
	  ORDER BY [Z-LRBooking-Z].Id ASC) AS LRBookingMinDate
	FROM [Z-LRBooking-Z]
	LEFT JOIN [TransportDesc] on [TransportDesc].Id = [Z-LRBooking-Z].DescriptionId AND [TransportDesc].CustomerId = @CustomerId AND [TransportDesc].Deleted = 0 AND [TransportDesc].Active = 1
	LEFT JOIN [TransportPacking] on [TransportPacking].Id = [Z-LRBooking-Z].PackingId AND [TransportPacking].CustomerId = @CustomerId AND [TransportPacking].Deleted = 0 AND [TransportPacking].Active = 1
	WHERE [Z-LRBooking-Z].Id = @Id AND [Z-LRBooking-Z].BranchId = @BranchId

END
GO