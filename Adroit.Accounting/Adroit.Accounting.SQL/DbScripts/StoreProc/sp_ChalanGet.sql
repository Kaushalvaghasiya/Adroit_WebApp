CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanGet]
(
	 @LoginId INT
	,@BranchId INT
	,@Id INT
)
AS
BEGIN

	SELECT 
		PBM.*,
		CFrom.Title AS CityFrom,
		CTo.Title AS CityTo,
		CA1.Name AS ToPayAccount,
		V.VRN AS VehicleVRN,
		V.ChasisNumber AS ChasisNumber,
		V.EngineNumber AS EngineNumber,
		V.NationalPermitNumber AS NationalPermitNumber,
		V.InsuranceNumber AS InsuranceNumber,
		DR.Name AS DriverName,
		DR.LicenceNumber AS LicenceNumber,
		DR.Mobile AS DriverMobile,
		DR.LicenceNumber as DriverLicence,
		CustomerFirmBranch.Title AS DeliveryBranch,
		GSTTransportMode.Title as TransportMode,
		dbo.fn_GetAccountName(PBM.SalesAccountBranchMappingId) AS ToPayAmountAccountBranchMappingChargerTo,
		dbo.fn_GetAccountName(PBM.CrossingAmountAccountBranchMappingId) AS CrossingAmountAccountBranchMappingChargedTo,
		dbo.fn_GetAccountName(PBM.CrossingCommissionAccountBranchMappingId) AS CrossingCommissionAccountBranchMappingChargedTo,
		dbo.fn_GetAccountName(PBM.CrossingHamaliAccountBranchMappingId) AS CrossingHamaliAccountBranchMappingChargedTo,
		dbo.fn_GetAccountName(PBM.CrossingDeliveryAccountBranchMappingId) AS CrossingDeliveryAccountBranchMappingChargedTo,
		Broker.Name as BrokerName,
		(SELECT STUFF((SELECT ',' + CAST(t1.LRBookingId AS VARCHAR) FROM [Z-PurchaseBillDetail-Z] t1
						WHERE t1.PurchaseBillMasterId = t.PurchaseBillMasterId FOR XML PATH('')),1,1,'') Concats
			FROM  [Z-PurchaseBillDetail-Z] t
			WHERE t.PurchaseBillMasterId = @Id GROUP BY t.PurchaseBillMasterId) AS LRNumberId,
		(SELECT Name From CustomerAccount 
			INNER JOIN CustomerAccountBranchMapping ON CustomerAccount.Id = CustomerAccountBranchMapping.AccountId
			WHERE CustomerAccountBranchMapping.Id = [ToPayAccountBranchMappingId]) AS ToPayAccountBranchMappingLbl
	FROM [Z-PurchaseBillMaster-Z] PBM
	LEFT JOIN [CustomerAccountBranchMapping] CABM1 on CABM1.Id = PBM.ToPayAccountBranchMappingId
	LEFT JOIN [CustomerAccount] CA1 on CA1.Id = CABM1.AccountId
	LEFT JOIN City CFrom ON PBM.CityIdFrom = CFrom.Id
	LEFT JOIN City CTo ON PBM.CityIdTo = CTo.Id 
	LEFT JOIN Vehilcle V ON PBM.VehicleId = V.Id
	LEFT JOIN Driver DR ON PBM.DriverId = DR.Id
	LEFT JOIN CustomerFirmBranch ON CustomerFirmBranch.Id = PBM.DeliveryBranchId
	LEFT JOIN CustomerBrokerBranchMapping ON CustomerBrokerBranchMapping.Id = PBM.BrokerBranchMappingId
	LEFT JOIN Broker ON Broker.Id = CustomerBrokerBranchMapping.Id
	LEFT JOIN GSTTransportMode ON GSTTransportMode.Id = PBM.TransportModeId
	WHERE PBM.Id = @Id
	AND PBM.BranchId = @BranchId
END
GO