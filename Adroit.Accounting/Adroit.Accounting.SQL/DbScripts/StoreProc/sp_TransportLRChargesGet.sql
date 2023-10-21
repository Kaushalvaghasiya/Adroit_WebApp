CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRChargesGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM TransportLRCharges
	WHERE Id = @Id
END
GO