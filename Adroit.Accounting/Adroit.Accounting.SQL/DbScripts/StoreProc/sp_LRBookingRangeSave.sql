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

		DECLARE @OrgStartNumber INT, @OrgEndNumber INT

		SELECT @OrgStartNumber = StartNumber,@OrgEndNumber = EndNumber
		FROM [LRBookingRange] 
		WHERE YearId = @YearId AND [LRBookingRange].FirmId = @FirmId AND Deleted = 0 AND Id = @Id

		IF EXISTS (
			SELECT 1
			FROM [LRBookingRange]
			WHERE ((@StartNumber BETWEEN StartNumber AND EndNumber) OR (@EndNumber BETWEEN StartNumber AND EndNumber)
			OR (StartNumber BETWEEN @StartNumber AND @EndNumber) OR (EndNumber BETWEEN @StartNumber AND @EndNumber))  
			AND YearId = @YearId AND FirmId = @FirmId AND Deleted = 0
			AND ((@Id <= 0) OR (@Id > 0 AND (@StartNumber <> @OrgStartNumber OR @EndNumber <> @OrgEndNumber)))
		)
		BEGIN
			SET @message = 'This LR booking range is already exists.';
			RAISERROR ('%s', 16, 1, @message);
		END

		DECLARE @AllotedLR INT = (
			SELECT SUM(EndNumber - StartNumber + 1) As AllotedLR
			FROM [LRBookingRange]
			WHERE YearId = @YearId AND FirmId = @FirmId AND BranchId = @BranchId AND Deleted = 0
		)

		DECLARE @UsedLR INT = (
			SELECT COUNT(LRNumber) As UsedLR
			FROM [Z-LRBooking-Z] 
			WHERE YearId = @YearId AND BranchId = @BranchId AND Deleted = 0
		)

		IF @AllotedLR > @UsedLR AND (@Id <= 0 OR (@Id > 0 AND NOT EXISTS (SELECT 1 FROM [LRBookingRange] WHERE Id <> @Id) AND (@StartNumber <> @OrgStartNumber OR @EndNumber <> @OrgEndNumber)))
		BEGIN
			SET @message = 'Please use existing LR numbers before renew.';
			RAISERROR ('%s', 16, 1, @message);
		END

		UPDATE [LRBookingRange]
		SET Active = 0
		WHERE YearId = @YearId
			AND FirmId = @FirmId
			AND BranchId = @BranchId
			AND Active = 1
			AND Deleted = 0;

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