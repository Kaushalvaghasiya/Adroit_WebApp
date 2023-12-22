CREATE OR ALTER PROCEDURE [dbo].[sp_LRBookingRangeSave]
(
	@Id	INT,
	@BranchId INT,
	@FirmId INT,
	@StartNumber INT,
	@EndNumber INT,
	@Active	BIT,
	@LoginId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId int = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);
		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF EXISTS (
			SELECT 1
			FROM [LRBookingRange]
			WHERE (@StartNumber BETWEEN [LRBookingRange].StartNumber AND [LRBookingRange].EndNumber 
				OR @EndNumber BETWEEN [LRBookingRange].StartNumber AND [LRBookingRange].EndNumber)
			AND [LRBookingRange].YearId = @YearId
			AND [LRBookingRange].FirmId = @FirmId
			AND [LRBookingRange].Active = 1 
			AND [LRBookingRange].Deleted = 0
		)
		BEGIN
			SET @message = 'This LR booking range is already exists.';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF EXISTS (SELECT 1 FROM [LRBookingRange] WHERE Id = @Id)
		BEGIN
				UPDATE [LRBookingRange] SET
				BranchId = @BranchId,
				YearId = @YearId,
				FirmId = @FirmId,
				StartNumber = @StartNumber,
				EndNumber = @EndNumber,
				Active = @Active, 
				ModifiedById = @LoginId, 
				ModifiedOn = GETUTCDATE()
				WHERE Id = @Id;
		END
		ELSE If EXISTS (SELECT 1 FROM [LRBookingRange] WHERE BranchId = @BranchId AND Deleted = 1)
		BEGIN
				UPDATE  [LRBookingRange] SET
				YearId = @YearId,
				FirmId = @FirmId,
				Active = @Active,
				DeletedById = NULL,
				DeletedOn = NULL,
				Deleted = 0,
				StartNumber = @StartNumber,
				EndNumber = @EndNumber
				WHERE BranchId = @BranchId

			SELECT @Id=Id FROM [LRBookingRange] WHERE BranchId = @BranchId
		END
		ELSE
		BEGIN
			INSERT INTO [LRBookingRange] (
				BranchId,YearId,FirmId,StartNumber,EndNumber,AddedById,AddedOn,Active
			)
			VALUES (
				@BranchId,@YearId,@FirmId,@StartNumber,@EndNumber,@LoginId,GETUTCDATE(),@Active
			)

			SET @Id = SCOPE_IDENTITY();
		END
		
		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN
		IF (@message LIKE '%IX_LRRange%')
		BEGIN
			SET @message = 'Branch name already exist!';
		END

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO