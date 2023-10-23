CREATE OR ALTER PROCEDURE [dbo].[sp_VehicleSave]
(
	@Id smallint,
	@UserId int,
	@VRN VARCHAR(12),
	@OwnerId	int,
	@ModelId	smallint,
	@StateId	int,
	@ChasisNumber	varchar(30),
	@EngineNumber	varchar(30),
	@RegistrationDate	datetime,
	@StatePermitNumber	varchar(50),
	@StatePermitIssueOn	datetime,
	@StatePermitExpiry	datetime,
	@NationalPermitNumber	varchar(50),
	@NationalPermitIssueOn	datetime,
	@NationalPermitExpiry	datetime,
	@InsuranceNumber	varchar(50),
	@InsuranceIssueOn	datetime,
	@InsuranceExpiry	datetime,
	@Active bit,
	@AddedById int,
	@ModifiedById int
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		
		Declare @CustomerId int = dbo.fn_GetCustomerId(@UserId);

		IF EXISTS (SELECT 1 FROM Vehilcle WHERE Id = @Id And CustomerId = @CustomerId)
			BEGIN
				UPDATE  Vehilcle SET
					[VRN] = @VRN,
					OwnerId = @OwnerId,
					ModelId = @ModelId,
					StateId = @StateId,
					ChasisNumber = @ChasisNumber,
					EngineNumber = @EngineNumber,
					RegistrationDate = @RegistrationDate,
					StatePermitNumber = @StatePermitNumber,
					StatePermitIssueOn = @StatePermitIssueOn,
					StatePermitExpiry = @StatePermitExpiry,
					NationalPermitNumber = @NationalPermitNumber,
					NationalPermitIssueOn = @NationalPermitIssueOn,
					NationalPermitExpiry = @NationalPermitExpiry,
					InsuranceNumber = @InsuranceNumber,
					InsuranceIssueOn = @InsuranceIssueOn,
					InsuranceExpiry = @InsuranceExpiry,
					Active = @Active,
					ModifiedById = @ModifiedById,
					ModifiedOn = GETUTCDATE()
				WHERE ID = @Id And CustomerId = @CustomerId
			END
		ELSE If EXISTS (SELECT 1 FROM Vehilcle WHERE VRN = @VRN AND Deleted = 1 And CustomerId = @CustomerId)
			BEGIN
				UPDATE  Vehilcle SET
					Active = @Active,
					Deleted = 0
				WHERE VRN = @VRN

				SELECT @Id=Id FROM Vehilcle WHERE VRN = @VRN
			END
		ELSE 
			BEGIN
				INSERT INTO Vehilcle
					(CustomerId,VRN,ModelId,ChasisNumber,EngineNumber,RegistrationDate,StateId,StatePermitNumber,StatePermitIssueOn,
					StatePermitExpiry,NationalPermitNumber,NationalPermitIssueOn,NationalPermitExpiry,InsuranceNumber,InsuranceIssueOn,
					InsuranceExpiry,OwnerId,AddedById,AddedOn,Active)
				VALUES
					(@CustomerId,@VRN,@ModelId,@ChasisNumber,@EngineNumber,@RegistrationDate,@StateId,@StatePermitNumber,@StatePermitIssueOn,
					@StatePermitExpiry,@NationalPermitNumber,@NationalPermitIssueOn,@NationalPermitExpiry,@InsuranceNumber,@InsuranceIssueOn,
					@InsuranceExpiry,@OwnerId,@AddedById,GETUTCDATE(),@Active)

				SET @Id = SCOPE_IDENTITY()
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%Violation of UNIQUE KEY%')
		BEGIN
			SET @message = 'Vehicle Registration Number ''' + @VRN + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO