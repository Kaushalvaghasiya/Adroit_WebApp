CREATE OR ALTER PROCEDURE [dbo].[sp_GetYear]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	SELECT * FROM FinanceYear
	WHERE Id= @Id
	AND FirmId = @FirmId
	ANd Deleted = 0
END
GO