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

	SELECT TOP 1
	CASE 
		WHEN [TransportLRRateOn].Title = 'Weight' THEN 
			CASE 
				WHEN [CustomerFirmBranchTransportContractRateSetting].RatePerKG IS NOT NULL THEN [CustomerFirmBranchTransportContractRateSetting].RatePerKG
				WHEN [CustomerFirmBranchLRRate].RatePerKG IS NOT NULL THEN [CustomerFirmBranchLRRate].RatePerKG
				WHEN [CustomerFirmTransportSetting].IsPartyAndCityRateFromLastLR = 1 THEN ( SELECT TOP 1 Rate FROM [Z-LRBooking-Z] ORDER BY Id DESC )
			END
		WHEN [TransportLRRateOn].Title = 'Parcel' THEN
			CASE 
				WHEN [CustomerFirmBranchTransportContractRateSetting].RatePerParcel IS NOT NULL THEN [CustomerFirmBranchTransportContractRateSetting].RatePerParcel
				WHEN [CustomerFirmBranchLRRate].RatePerParcel IS NOT NULL THEN [CustomerFirmBranchLRRate].RatePerParcel
				WHEN [CustomerFirmTransportSetting].IsPartyAndCityRateFromLastLR = 1 THEN ( SELECT TOP 1 Rate FROM [Z-LRBooking-Z] ORDER BY Id DESC )
			END
	END AS Rate
	,CASE 
		WHEN [TransportLRRateOn].Title = 'Weight' OR [TransportLRRateOn].Title = 'Parcel' THEN
			CASE 
				WHEN [CustomerFirmBranchTransportContractRateSetting].RatePerKG IS NOT NULL OR [CustomerFirmBranchTransportContractRateSetting].RatePerParcel IS NOT NULL
				THEN 1
			END
		ELSE 0
	END AS IsRateDisable
	FROM [CustomerFirmBranchTransportContractRateSetting] 
	LEFT JOIN [TransportLRRateOn] on [TransportLRRateOn].Id = @RateOnId AND [TransportLRRateOn].Deleted = 0 AND [TransportLRRateOn].Active = 1
	LEFT JOIN [CustomerFirmBranchLRRate] on [CustomerFirmBranchLRRate].BranchId = @BranchId
	LEFT JOIN [CustomerFirmTransportSetting] on [CustomerFirmTransportSetting].FirmId = @FirmId
	WHERE [CustomerFirmBranchTransportContractRateSetting].CityId = @CityIdTo 
	AND [CustomerFirmBranchTransportContractRateSetting].AccountBranchMappingId = @BillPartyId

END



