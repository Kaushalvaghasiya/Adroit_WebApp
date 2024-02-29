CREATE OR ALTER PROCEDURE sp_GSTCalculationEnabled (@LoginId INT)
AS
BEGIN
	DECLARE @FirmId INT = dbo.fn_GetLoggedInFirmId(@LoginId)
	DECLARE @SoftwareId tinyint
	DECLARE @IsGTA bit
	DECLARE @IsTaxCalculateGTASales bit

	SELECT 
		@SoftwareId = SoftwareId , @IsGTA = IsGTA 
	FROM CustomerFirm WHERE Id = @FirmId

	SELECT 
		@IsTaxCalculateGTASales = IsTaxCalculateGTASales
	FROM CustomerFirmTransportSetting WHERE FirmId = @FirmId

	IF (@SoftwareId = 1 AND @IsGTA = 1 AND @IsTaxCalculateGTASales = 1)
		SELECT 1
	ELSE IF (@SoftwareId <> 1)
		SELECT 1
	ELSE 
		SELECT 0
END