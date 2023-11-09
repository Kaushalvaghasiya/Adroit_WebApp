CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		[LRBookingRange].*,
		CustomerFirmBranch.Title As Branch
	FROM [LRBookingRange]
	Inner Join CustomerFirmBranch On CustomerFirmBranch.Id = LRBookingRange.BranchId
	WHERE [LRBookingRange].Id = @Id
END
GO