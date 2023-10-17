CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerAccountSave]
(
	@LoginId int
	,@FirmId int
	,@Id int
	,@Name nvarchar(100)
	,@PrintName nvarchar(100)	
	,@AccountGroupId int
	,@Address1 nvarchar(100)
	,@Address2 nvarchar(100)
	,@Address3 nvarchar(100)
	,@CityId int
	,@StateId int
	,@CountryId smallint
	,@Pincode varchar(10)
	,@KM varchar(4)
	,@ContactPersonName nvarchar(30)
	,@Mobile varchar(15)
	,@MobileAlternate varchar(15)	
	,@Email varchar(50)
	,@GSTNumber varchar(15)
	,@PAN varchar(12)
	,@AreaName varchar(20)
	,@RateWithGST bit = 0
	,@GSTInvoiceTypeId tinyint
	,@EximCode varchar(30)
	,@IsIGST bit = 0
	,@GSTNumberTransport varchar(15)
	,@TransportName varchar(50)
	,@VehicleNumber varchar(15)
	,@DeliveryAccountBranchMappingId int = null
	,@ShippingAccountBranchMappingId int = null
	,@BrokerMappingId int = null
	,@CreditDays smallint = 0
	,@Discount decimal(18,3) = 0
	,@TDS decimal(18,3) = 0
	,@TCS decimal(18,3) = 0
	,@CreditLimit decimal(18,0) = 0
	,@InterestRate decimal(2,2) = 0
	,@Commission decimal(5,3) = 0
	,@IsEcommerce bit = 0
	,@AdharUID varchar(12)
	,@TAN varchar(10)
	,@CompositParty bit = 0
	,@RCMParty bit = 0
	,@CapitalPercentage decimal(5,2) = 0
	,@OwnerBranchId int
	,@Active bit = 1	
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM CustomerAccount WHERE Id = @Id)
			BEGIN
				UPDATE CustomerAccount SET
				[Name] = @Name
				,PrintName = @PrintName
				,AccountGroupId = @AccountGroupId
				,Address1 = @Address1
				,Address2 = @Address2
				,Address3 = @Address3
				,CityId = @CityId
				,StateId = @StateId
				,CountryId = @CountryId
				,Pincode = @Pincode
				,KM = @KM
				,ContactPersonName = @ContactPersonName
				,Mobile = @Mobile
				,MobileAlternate = @MobileAlternate
				,Email = @Email
				,GSTNumber = @GSTNumber
				,PAN = @PAN
				,AreaName = @AreaName
				,RateWithGST = @RateWithGST
				,GSTInvoiceTypeId = @GSTInvoiceTypeId
				,EximCode = @EximCode
				,IsIGST = @IsIGST
				,GSTNumberTransport = @GSTNumberTransport
				,TransportName = @TransportName
				,VehicleNumber = @VehicleNumber
				,DeliveryAccountBranchMappingId = @DeliveryAccountBranchMappingId
				,ShippingAccountBranchMappingId = @ShippingAccountBranchMappingId
				,BrokerMappingId = @BrokerMappingId
				,CreditDays = @CreditDays
				,Discount = @Discount
				,TDS = @TDS
				,TCS = @TCS
				,CreditLimit = @CreditLimit
				,InterestRate = @InterestRate
				,Commission = @Commission
				,IsEcommerce = @IsEcommerce
				,AdharUID = @AdharUID
				,[TAN] = @TAN
				,CompositParty = @CompositParty
				,RCMParty = @RCMParty
				,CapitalPercentage = @CapitalPercentage
				,OwnerBranchId = @OwnerBranchId
				,Active = @Active
				WHERE Id = @Id
				SELECT @Id;
			END
		ELSE
			BEGIN
				INSERT INTO CustomerAccount
				([Name],PrintName,AccountGroupId,Address1,Address2,Address3,CityId,StateId,CountryId,Pincode,
					KM,ContactPersonName,Mobile,MobileAlternate,Email,GSTNumber,PAN,AreaName,
					RateWithGST,GSTInvoiceTypeId,EximCode,IsIGST,GSTNumberTransport,TransportName,VehicleNumber,
					DeliveryAccountBranchMappingId,ShippingAccountBranchMappingId,BrokerMappingId,CreditDays,Discount,TDS,TCS,CreditLimit,
					InterestRate,Commission,IsEcommerce,AdharUID,[TAN],CompositParty,RCMParty,CapitalPercentage,OwnerBranchId,Active)
				VALUES
				(@Name,@PrintName,@AccountGroupId,@Address1,@Address2,@Address3,@CityId,@StateId,@CountryId,@Pincode,
					@KM,@ContactPersonName,@Mobile,@MobileAlternate,@Email,@GSTNumber,@PAN,@AreaName,
					@RateWithGST,@GSTInvoiceTypeId,@EximCode,@IsIGST,@GSTNumberTransport,@TransportName,@VehicleNumber,
					@DeliveryAccountBranchMappingId,@ShippingAccountBranchMappingId,@BrokerMappingId,@CreditDays,@Discount,@TDS,@TCS,@CreditLimit,
					@InterestRate,@Commission,@IsEcommerce,@AdharUID,@TAN,@CompositParty,@RCMParty,@CapitalPercentage,@OwnerBranchId,@Active)

				SET @Id = SCOPE_IDENTITY();
				SELECT @Id;
			END
	
		COMMIT TRAN
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO