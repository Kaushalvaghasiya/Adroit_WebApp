CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescGet]
(
	@Id INT,
	@CustomerId INT
)
AS
BEGIN
	SELECT * FROM TransportDesc
	WHERE Id = @Id And CustomerId = @CustomerId
END
GO