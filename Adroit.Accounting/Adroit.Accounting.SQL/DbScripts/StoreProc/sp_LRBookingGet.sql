CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingGet]
(
	@Id INT
)
AS
BEGIN

	SELECT * FROM [Z-LRBooking-Z]
	WHERE Id = @Id 

END
GO