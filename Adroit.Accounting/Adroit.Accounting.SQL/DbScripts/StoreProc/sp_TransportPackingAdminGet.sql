CREATE OR ALTER PROCEDURE [dbo].[sp_TransportPackingAdminGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM TransportPackingAdmin
	WHERE Id = @Id
END
GO