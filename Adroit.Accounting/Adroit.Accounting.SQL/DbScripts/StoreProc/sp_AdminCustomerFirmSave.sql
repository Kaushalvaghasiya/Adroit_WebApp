CREATE OR ALTER PROCEDURE [dbo].[sp_AdminCustomerFirmSave]
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
	 @Active bit,
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
		IF EXISTS (SELECT 1 FROM CustomerFirm WHERE Id = @Id)
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
						Active=@Active,
						OrderNumber=@OrderNumber,
						ModifiedById=@ModifiedById, 
						ModifiedOn=GETUTCDATE(),
						AdharUID=@AdharUID,
						LRResetOnYearEnd=@LRResetOnYearEnd,
						CessRequired=@CessRequired
					WHERE ID = @Id
			END
		ELSE
			BEGIN
				declare @firmlimit int = 0
				declare @firmcreated int = 0
				SELECT @firmlimit = TotalFirm FROM Customer Where Id = @CustomerId
				SELECT @firmcreated = count(*) FROM CustomerFirm Where CustomerId = @CustomerId ANd Deleted = 0
				IF (@firmcreated >= @firmlimit)
				BEGIN
					RAISERROR ('%s', 16, 1, 'Firm limit exceeded');
				END

				INSERT INTO CustomerFirm
					([CustomerId],[BusinessId],Title,OwnerName,[TAN],IECCode,
					IsLutBond,LutBondNumber,IsGTA,FirmTypeId,GstFirmTypeId,
					SoftwareId,BranchLimit,Active,OrderNumber,AddedById,
					AddedOn,AdharUID,LRResetOnYearEnd,CessRequired
					)
				VALUES
					(
					@CustomerId,@BusinessId,@Title,@OwnerName,@TAN,@IECCode,
					@IsLutBond,@LutBondNumber,@IsGTA,@FirmTypeId,@GstFirmTypeId,
					@SoftwareId,@BranchLimit,@Active,@OrderNumber,@AddedById,
					GETUTCDATE(),@AdharUID,@LRResetOnYearEnd,@CessRequired
					)

				SET @Id = SCOPE_IDENTITY()

				--Default Year 
				DECLARE @y1 INT = CAST(RIGHT(CONVERT(VARCHAR, GETDATE(), 103), 4) AS INT)
				DECLARE @y2 INT = @y1 + 1
				INSERT INTO [FinanceYear] (FirmId, Title, YearFrom, YearTo, Deleted, Active)
				SELECT @FirmId, cast(@y1 as varchar) + '-' +cast(@y2 as varchar) , cast(@y1 as varchar)+'/04/01', cast(@y2 as varchar)+'/03/31', 0, 1
				from CustomerFirm where CustomerId = @cid
			END
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @message VARCHAR(4000), @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		IF (CHARINDEX('IX_CustomerFirm', @message) > 0)
		BEGIN
			SET @message = 'Firm ('+ @Title +') already exist!'
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO