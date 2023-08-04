CREATE OR ALTER PROCEDURE [dbo].[sp_MenuSettingsGet]
(
	@Id INT
)
AS
BEGIN
	SELECT *
	FROM MenuSetting 
	WHERE Id = @Id
END
GO