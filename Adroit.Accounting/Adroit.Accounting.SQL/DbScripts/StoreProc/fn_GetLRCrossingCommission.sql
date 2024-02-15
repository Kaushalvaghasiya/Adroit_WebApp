CREATE OR ALTER FUNCTION DBO.fn_GetLRCrossingCommission
(
	@BranchId INT,
	@CityId INT,
	@LRRateOnId TINYINT,
	@Parcel SMALLINT,
	@ChargeWeight DECIMAL(18,3),
	@Freight DECIMAL(18,2)
)
RETURNS DECIMAL(18,3)
AS 
BEGIN
DECLARE @Amount DECIMAL(18,3)

	SELECT 
		@Amount = 
			CASE IsCommissionApply
			WHEN 1 THEN 
				CASE @LRRateOnId 
					WHEN 1 THEN @ChargeWeight * CAST(CommissionPerKg AS DECIMAL(18,3))
					WHEN 2 THEN @ChargeWeight * CAST(CommissionPerParcel AS DECIMAL(18,3))
					ELSE @Freight * CommissionPercentOnFreight / 100
					END
			ELSE 0
			END
	FROM CustomerFirmBranchLRRate
	WHERE BranchId = @BranchId
		  AND CityId = @CityId

	RETURN ISNULL(@Amount, 0)
END