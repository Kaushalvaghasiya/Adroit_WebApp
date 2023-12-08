CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingGet]
(
	@Id INT,
	@LoginId INT,
	@FirmId INT
)
AS
BEGIN

	SELECT * FROM [Z-LRBooking-Z]
	WHERE Id = @Id 

END
GO