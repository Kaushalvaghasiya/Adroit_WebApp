CREATE OR ALTER PROCEDURE [dbo].[sp_CustomerFirmSave]
(
	 @Id int,
	 @CustomerId int,
	 @BusinessId smallint,
	 @Title VARCHAR(100),
	 @OwnerName varchar(100),
	 @TAN varchar(30),
	 @IECCode varchar(30),
	 @IsLutBond bit,
	 @LutBondNumber varchar(30),
	 @IsGTA bit,
	 @FirmTypeId smallint,
	 @GstFirmTypeId int,
	 @SoftwareId int,
	 @BranchLimit int,
	 @IsDeleted bit,
	 @IsActive bit,
	 @ModifiedById int,
	 @OrderNumber int,
	 @AddedById int,
	 @AdharUID varchar(12),
	 @LRResetOnYearEnd bit,
	 @CessRequired bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM Customer WHERE Id = @Id)
			BEGIN
				UPDATE CustomerFirm SET
						[CustomerId]=@CustomerId,
						[BusinessId]=@BusinessId,
						Title=@Title,
						OwnerName=@OwnerName,
						[TAN]=@TAN,
						IECCode=@IECCode,
						IsLutBond=@IsLutBond,
						LutBondNumber=@LutBondNumber,
						IsGTA=@IsGTA,
						FirmTypeId=@FirmTypeId,
						GstFirmTypeId=@GstFirmTypeId,
						SoftwareId=@SoftwareId,
						BranchLimit=@BranchLimit,
						IsDeleted=@IsDeleted,
						IsActive=@IsActive,
						OrderNumber=@OrderNumber,
						ModifiedById=NULL, --need change ref key
						ModifiedOn=GETUTCDATE(),
						AdharUID=@AdharUID,
						LRResetOnYearEnd=@LRResetOnYearEnd,
						CessRequired=@CessRequired
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				INSERT INTO CustomerFirm
					([CustomerId],[BusinessId],Title,OwnerName,[TAN],IECCode,
					IsLutBond,LutBondNumber,IsGTA,FirmTypeId,GstFirmTypeId,
					SoftwareId,BranchLimit,IsDeleted,IsActive,OrderNumber,
					AddedOn,AdharUID,LRResetOnYearEnd,CessRequired
					)
				VALUES
					(
					@CustomerId,@BusinessId,@Title,@OwnerName,@TAN,@IECCode,
					@IsLutBond,@LutBondNumber,@IsGTA,@FirmTypeId,@GstFirmTypeId,
					@SoftwareId,@BranchLimit,@IsDeleted,@IsActive,@OrderNumber,
					GETUTCDATE(),@AdharUID,@LRResetOnYearEnd,@CessRequired
					)

				SET @Id = SCOPE_IDENTITY()

				
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