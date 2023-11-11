CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmTransportSettingGet]
(
	@Id INT
)
AS
BEGIN
	SELECT CustomerFirmTransportSetting.*
	FROM CustomerFirmTransportSetting 
	WHERE FirmId = @Id 
END
GO