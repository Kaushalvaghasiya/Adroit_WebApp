CREATE OR ALTER PROCEDURE [dbo].[sp_GetRateFromLRBooking] 
(
	@FirmId INT,
	@BranchId INT,
	@CityIdTo INT,
	@BillPartyId INT,
	@RateOnId INT,
	@LoginId INT
)
AS
BEGIN

DECLARE @Rate DECIMAL(18,2) = null, @TransportLRRateOnTitle VARCHAR(20) ='', @IsRateDisable bit = null

SELECT @TransportLRRateOnTitle = Title 
FROM [TransportLRRateOn] 
WHERE [TransportLRRateOn].Id = @RateOnId AND [TransportLRRateOn].Deleted = 0 AND [TransportLRRateOn].Active = 1


IF(@TransportLRRateOnTitle IN ('Weight', 'Parcel'))
BEGIN

	SELECT  @Rate = CASE                     
						WHEN @TransportLRRateOnTitle = 'Weight' AND [CustomerFirmBranchTransportContractRateSetting].RatePerKG IS NOT NULL AND [CustomerFirmBranchTransportContractRateSetting].RatePerKG > 0 THEN [CustomerFirmBranchTransportContractRateSetting].RatePerKG 
						WHEN @TransportLRRateOnTitle = 'Parcel' AND [CustomerFirmBranchTransportContractRateSetting].RatePerParcel IS NOT NULL AND [CustomerFirmBranchTransportContractRateSetting].RatePerParcel > 0 THEN [CustomerFirmBranchTransportContractRateSetting].RatePerParcel 
						ELSE null
					END, 
			@IsRateDisable = 1
	FROM [CustomerFirmBranchTransportContractRateSetting] 
	WHERE [CustomerFirmBranchTransportContractRateSetting].CityId = @CityIdTo
	        AND [CustomerFirmBranchTransportContractRateSetting].AccountBranchMappingId = @BillPartyId
	
	IF(@Rate IS NULL)
	BEGIN 
	SELECT  @Rate = CASE                     
						WHEN @TransportLRRateOnTitle = 'Weight' AND [CustomerFirmBranchLRRate].RatePerKG IS NOT NULL AND [CustomerFirmBranchLRRate].RatePerKG > 0 THEN [CustomerFirmBranchLRRate].RatePerKG 
						WHEN @TransportLRRateOnTitle = 'Parcel' AND [CustomerFirmBranchLRRate].RatePerParcel IS NOT NULL AND [CustomerFirmBranchLRRate].RatePerParcel > 0 THEN [CustomerFirmBranchLRRate].RatePerParcel 
						ELSE null
					END, 
			@IsRateDisable = 1
	FROM [CustomerFirmBranchLRRate] WHERE [CustomerFirmBranchLRRate].BranchId = @BranchId
	END
	
	IF(@Rate IS NULL)
	BEGIN 
	SELECT  @Rate = CASE                     
						WHEN [CustomerFirmTransportSetting].IsPartyAndCityRateFromLastLR = 1 THEN (SELECT TOP 1 Rate FROM [Z-LRBooking-Z] WHERE CityIdTo = @CityIdTo AND BillAccountBranchMappingId = @BillPartyId ORDER BY Id DESC) 
						ELSE null
					END, 
			@IsRateDisable = 0
	FROM [CustomerFirmTransportSetting] WHERE [CustomerFirmTransportSetting].FirmId = @FirmId
	END

	SELECT ISNULL(@Rate,0) AS Rate, ISNULL(@IsRateDisable,0) AS IsRateDisable
END 
ELSE 
BEGIN 
	SELECT 0 AS Rate, 0 AS IsRateDisable
END

END