CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	SELECT 
		[LRBookingRange].*,
		CustomerFirmBranch.Title As Branch
	FROM [LRBookingRange]
	INNER JOIN CustomerFirmBranch On CustomerFirmBranch.Id = LRBookingRange.BranchId
	WHERE [LRBookingRange].Id = @Id AND [LRBookingRange].FirmId = @FirmId
END
GO