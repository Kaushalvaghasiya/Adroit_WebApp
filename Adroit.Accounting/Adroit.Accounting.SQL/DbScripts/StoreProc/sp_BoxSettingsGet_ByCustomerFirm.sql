CREATE OR ALTER PROCEDURE [dbo].[sp_BoxSettingsGet_ByCustomerFirm]
(
	@CusomerFirmId INT
)
AS
BEGIN
	SELECT *
	FROM BoxSetting
	WHERE CusomerFirmId = @CusomerFirmId
END
GO