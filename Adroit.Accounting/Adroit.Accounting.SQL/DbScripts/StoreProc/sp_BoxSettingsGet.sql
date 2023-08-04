CREATE OR ALTER PROCEDURE [dbo].[sp_BoxSettingsGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM BoxSetting 
	WHERE Id = @Id
END
GO