CREATE OR ALTER PROCEDURE [dbo].[sp_TransportDescAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM TransportDescAdmin
	WHERE Id = @Id
END
GO