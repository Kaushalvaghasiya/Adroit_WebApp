CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescGet]
(
	@Id INT,
	@UserId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.[fn_GetCustomerId](@UserId);

	SELECT * FROM TransportDesc
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO