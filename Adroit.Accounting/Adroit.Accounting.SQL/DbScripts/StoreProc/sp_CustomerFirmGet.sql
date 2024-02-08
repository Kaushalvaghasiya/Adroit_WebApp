CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmGet]
(
	@Id INT,
	@FirmId INT
)
AS
BEGIN
	Declare @CustomerId int = dbo.fn_GetCustomerIdByFirm(@FirmId);

	SELECT CustomerFirm.*,Customer.[Name] as CustomerName
	, GSTFirmType.Title as GSTFirmType
	, Business.Title as Business
	FROM CustomerFirm 
	 LEFT JOIN Customer ON CustomerFirm.CustomerId=Customer.id
	 LEFT JOIN GSTFirmType ON CustomerFirm.GSTFirmTypeId = GSTFirmType.Id
	 LEFT JOIN Business ON CustomerFirm.BusinessId = Business.Id
	WHERE CustomerFirm.CustomerId = @CustomerId AND CustomerFirm.Id = @Id 
END
GO