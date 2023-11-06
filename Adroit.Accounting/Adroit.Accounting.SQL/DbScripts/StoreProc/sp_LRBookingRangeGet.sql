CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeGet]
(
	@Id INT
)
AS
BEGIN
	SELECT 
		[LRBookingRange].*
	FROM [LRBookingRange]
	WHERE [LRBookingRange].Id = @Id
END
GO