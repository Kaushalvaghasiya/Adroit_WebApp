CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeRenewGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	SELECT 
		[LRBookingRange].*
	FROM [LRBookingRange]
	WHERE [LRBookingRange].Id = @Id AND [LRBookingRange].FirmId = @FirmId
END
GO