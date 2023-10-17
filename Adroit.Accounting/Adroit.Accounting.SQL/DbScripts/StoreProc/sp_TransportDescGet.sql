CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescGet]
(
	@Id INT
)
AS
BEGIN
	SELECT * FROM TransportDesc
	WHERE Id = @Id
END
GO