CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerRegistration]
(
	 @Id int,
	 @Name varchar(50),
	 @BusinessName varchar(250),
	 @Address1 varchar(200),
	 @Address2 varchar(200),
	 @Address3 varchar(200),
	 @CityId int,
	 @StateId int,
	 @EmailOtp varchar(6),
	 @MobileOtp varchar(6),
	 @ContactPersonName varchar(100),
	 @Mobile varchar(15),
	 @MobileAlternate varchar(15),
	 @Phone varchar(20),
	 @Email varchar(50),
	 @BusinessId smallint,
	 @Requirement nvarchar(max),
	 @TotalFirm smallint,
	 @CustomerType varchar(1),
	 @AdharUID varchar(12),
	 @StatusId varchar(1),
	 @TotalUsers smallint,
	 @AgreeTerms bit,
	 @DefaultUserId uniqueidentifier
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Customer WHERE Id = @Id)
			BEGIN
				UPDATE Customer SET
					[Name] = @Name,
					BusinessName = @BusinessName,
					Address1 = @Address1,
					Address2 = @Address2,
					CityId = @CityId,
					StateId = @StateId,
					EmailOtp = @EmailOtp,
					MobileOtp = @MobileOtp,
					ContactPersonName = @ContactPersonName,
					Mobile = @Mobile,
					MobileAlternate = @MobileAlternate,
					Phone = @Phone,
					Email = @Email,
					BusinessId = @BusinessId,
					Requirement = @Requirement,
					TotalFirm = @TotalFirm,
					CustomerType = @CustomerType,
					AdharUID = @AdharUID,
					TotalUsers = @TotalUsers,
					StatusId = @StatusId,
					AgreeTerms = @AgreeTerms
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO Customer
					([Name], BusinessName, Address1, Address2, CityId, StateId, ContactPersonName, Mobile, MobileAlternate, Phone,
					 Email, BusinessId, Requirement, TotalFirm, CustomerType, AdharUID, TotalUsers, IsActive, EmailOtp, MobileOtp, 
					 StatusId, AgreeTerms)
				VALUES
					(@Name, @BusinessName, @Address1, @Address2, @CityId, @StateId, @ContactPersonName, @Mobile, @MobileAlternate, @Phone,
					 @Email, @BusinessId, @Requirement, @TotalFirm, @CustomerType, @AdharUID, @TotalUsers, 1, @EmailOtp, @MobileOtp, 
					 @StatusId, @AgreeTerms)

				SET @Id = SCOPE_IDENTITY()

				DECLARE @NewRegistrationFirmTypeId SMALLINT
				DECLARE @NewRegistrationGstFirmTypeId TINYINT
				DECLARE @NewRegistrationSoftwareId TINYINT
				DECLARE @NewRegistrationFirmBranchTypeId TINYINT
				DECLARE @FirmId INT
				DECLARE @BrnachId INT
				--GET DEFAULT VALUES
				SELECT 
					@NewRegistrationFirmTypeId = NewRegistrationFirmTypeId,
					@NewRegistrationGstFirmTypeId = NewRegistrationGstFirmTypeId,
					@NewRegistrationSoftwareId = NewRegistrationSoftwareId,
					@NewRegistrationFirmBranchTypeId = NewRegistrationFirmBranchTypeId
				FROM SystemSetting

				--ADD DEFAULT FIRM
				INSERT INTO [CustomerFirm] 
						([CustomerId], [BusinessId], [Title], [OwnerName], [TAN], [IECCode], 
						 [IsLutBond], [LutBondNumber], [IsGTA], [FirmTypeId], [GstFirmTypeId], [SoftwareId], 
						 [BranchLimit], [IsActive], [OrderNumber], [AddedOn], [AdharUID], [LRResetOnYearEnd], [CessRequired])
					VALUES 
						(@Id, @BusinessId, @BusinessName, @Name, '','',
						 0, '', 0, @NewRegistrationFirmTypeId, @NewRegistrationGstFirmTypeId, @NewRegistrationSoftwareId,
						 1, 1, 1, GETUTCDATE(), '', 0, 0)
			
				SET @FirmId = SCOPE_IDENTITY()

				--ADD DEFAULT BRANCH
				DECLARE @CountryId SMALLINT
				SELECT @CountryId = CountryId FROM [State] WHERE Id = @StateId

				INSERT INTO [CustomerFirmBranch]
					([FirmId], [Title], [PrintTitle], [ShortTitle], [FirmBranchTypeId], 
					 [Address1], [Address2], [Address3], [CityId], [StateId], [CountryId], [Pincode], 
					 [Phone], [ContactPersonName], [Mobile], [MobileAlternate], [Email], [GSTNumber], [PAN], 
					 [EWBAddress1], [EWBAddress2], [RenewalDate], [SetupPrice], [RenewalPrice], 
					 [OrderNumber], [AddedOn], [IsActive])
				VALUES (@FirmId, @BusinessName, '', '', @NewRegistrationFirmBranchTypeId,
						@Address1, @Address2, @Address3, @CityId, @StateId, @CountryId, '',
						@Phone, @Name, @Mobile, '', @Email, '', '', 
						'', '', DATEADD(MONTH, 1, GETUTCDATE()), 0, 0, 
						1, GETUTCDATE(), 1)
				SET @BrnachId = SCOPE_IDENTITY()

				--ADD DEFAULT CUSTOMER USER
				INSERT INTO [CustomerUser] 
					([CustomerId], [UserId], [IsActive], [IsLocked], [IsDeleted], [AddedOn], [OwnerBranchId], [FirstName])
				VALUES (@Id, @DefaultUserId, 1, 0, 0, GETUTCDATE(), @BrnachId, @Name)
			END

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO