CREATE OR ALTER PROCEDURE [dbo].[sp_GetChalanReceiveAgencyMasterTableListByChalanReceiveAgencyMasterId]
  @LoginId int,
  @BranchId int,
  @ChalanReceiveAgencyMasterId int
AS
BEGIN
	DECLARE @CustomerId int = dbo.fn_GetCustomerId(@LoginId);

	   SELECT  
	    ROW_NUMBER() over (ORDER BY [Z-ChalanReceiveAgencyDetail-Z].Id ASC) AS RowNum,
		Count(*) over () AS TotalCount, 
		[Z-ChalanReceiveAgencyDetail-Z].SrNumber As SrNumber,
		[Z-ChalanReceiveAgencyDetail-Z].EwayBillNo As EwayBillNo,
		[Z-ChalanReceiveAgencyDetail-Z].LRNumber As LRNumber,
		[Z-ChalanReceiveAgencyDetail-Z].LRDate As LRDate,
		[Z-ChalanReceiveAgencyDetail-Z].PrivateMarka As PrivateMarka,
		[Z-ChalanReceiveAgencyDetail-Z].Parcel As Parcel,
		[Z-ChalanReceiveAgencyDetail-Z].ChargeWeight As ChargeWeight,
		[Z-ChalanReceiveAgencyDetail-Z].NetAmount As NetAmount,
		ToCity.[Title] AS CityTo,
		FromCity.[Title] AS CityFrom,
		[TransportLRPayType].[Title] AS LRPayType,
		CA1.Name As Consignor,
		CA2.Name As Consignee
		
		FROM [Z-ChalanReceiveAgencyDetail-Z]
			 LEFT JOIN [City] ToCity ON [Z-ChalanReceiveAgencyDetail-Z].CityIdTo = ToCity.[Id] AND ToCity.Active = 1
			 LEFT JOIN [City] FromCity ON [Z-ChalanReceiveAgencyDetail-Z].CityIdFrom = FromCity.[Id] AND FromCity.Active = 1
			 LEFT JOIN [TransportLRPayType] ON [Z-ChalanReceiveAgencyDetail-Z].[LRPayTypeId] = [TransportLRPayType].[Id]
			 INNER JOIN [CustomerAccountBranchMapping] AS CAB1 on CAB1.Id = [Z-ChalanReceiveAgencyDetail-Z].AccountBranchMappingId AND CAB1.Deleted = 0
			 INNER JOIN [CustomerAccount] AS CA1 on CA1.Id = CAB1.AccountId AND CA1.Deleted = 0 AND CA1.Active = 1
			 INNER JOIN [CustomerAccount] AS CA2 on CA2.Id = CAB2.AccountId AND CA2.Deleted = 0 AND CA2.Active = 1
		WHERE [Z-ChalanReceiveAgencyMaster-Z].[BranchId] = @BranchId
			  AND [Z-ChalanReceiveAgencyMaster-Z].Deleted = 0
			  AND [Z-ChalanReceiveAgencyDetail-Z].ChalanReceiveAgencyMasterId = @ChalanReceiveAgencyMasterId
			  AND [Z-ChalanReceiveAgencyDetail-Z].Deleted = 0
END
GO