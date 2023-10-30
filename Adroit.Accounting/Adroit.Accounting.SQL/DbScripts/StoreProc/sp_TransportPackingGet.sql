CREATE OR ALTER PROCEDURE [dbo].[sp_TransportPackingGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT *
	FROM TransportPacking WHERE Id = @Id And CustomerId = @CustomerId
END
