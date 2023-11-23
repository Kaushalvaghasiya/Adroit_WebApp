CREATE OR ALTER PROCEDURE [dbo].[sp_Z_LRBooking_ZGet]
(
	@Id INT
)
AS
BEGIN

	SELECT * FROM [Z-LRBooking-Z]
	WHERE Id = @Id 

END
GO