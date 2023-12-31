CREATE OR ALTER PROCEDURE [dbo].[sp_GetChalanReceiveAgencyMasterTableListByMasterId]
  @LoginId int,
  @BranchId int,
  @ChalanReceiveAgencyMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
	    ROW_NUMBER() over (ORDER BY [Z-ChalanReceiveAgencyDetail-Z].Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		[Z-ChalanReceiveAgencyDetail-Z].SrNumber ,
		[Z-ChalanReceiveAgencyDetail-Z].EwayBillNo,
		[Z-ChalanReceiveAgencyDetail-Z].LRNumber,
		[Z-ChalanReceiveAgencyDetail-Z].LRDate ,
		[Z-ChalanReceiveAgencyDetail-Z].PrivateMarka,
		[Z-ChalanReceiveAgencyDetail-Z].Parcel,
		[Z-ChalanReceiveAgencyDetail-Z].ChargeWeight,
		[Z-ChalanReceiveAgencyDetail-Z].CityIdTo,
		[Z-ChalanReceiveAgencyDetail-Z].CityIdFrom,
		[Z-ChalanReceiveAgencyDetail-Z].LRPayTypeId,
		[Z-ChalanReceiveAgencyDetail-Z].BillAccountBranchMappingId,
		[Z-ChalanReceiveAgencyDetail-Z].AccountBranchMappingId,
		[Z-ChalanReceiveAgencyDetail-Z].DeliveryAccountBranchMappingId
		FROM [Z-ChalanReceiveAgencyDetail-Z]
		WHERE
			 [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = @ChalanReceiveAgencyMasterId
			  AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
END
GO