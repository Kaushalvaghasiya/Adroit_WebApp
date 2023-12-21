CREATE OR ALTER PROCEDURE [dbo].[sp_ChalanReceiveSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@BillNumberBranch INT  
	,@GoDownNumber INT  
	,@PurchaseBillMasterId INT
	,@BillNumberFirm INT
	,@ReceiveDate DATETIME  
	,@ReceivedNote NVARCHAR(250)
	,@LRNumberIds NVARCHAR(MAX)
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		DECLARE @YearId INT = dbo.fn_GetYearId(@LoginId);

		DECLARE @message VARCHAR(4000);

		IF @YearId IS NULL
		BEGIN
			SET @message = 'Year Not Found!';
			RAISERROR ('%s', 16, 1, @message);
		END

		IF ISNULL(@BillNumberBranch, 0) = 0
		BEGIN
			SELECT @BillNumberBranch = ISNULL(MAX(BillNumberBranch),0) + 1
			FROM [Z-ChalanReceive-Z]
			WHERE [Z-ChalanReceive-Z].BranchId = @BranchId AND [Z-ChalanReceive-Z].YearId = @YearId 
		END

		IF ISNULL(@BillNumberFirm, 0) = 0
		BEGIN
			SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
			FROM [Z-ChalanReceive-Z]
			WHERE [Z-ChalanReceive-Z].FirmId = @FirmId AND [Z-ChalanReceive-Z].YearId = @YearId 
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-ChalanReceive-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND PurchaseBillMasterId = @PurchaseBillMasterId AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-ChalanReceive-Z]
           (PurchaseBillMasterId,ReceiveDate,BillNumberBranch,BillNumberFirm,BranchId,FirmId,YearId,UserId,GoDownNumber,ReceivedNote,AddedOn,AddedById,Deleted)
			VALUES
           (@PurchaseBillMasterId,@ReceiveDate,@BillNumberBranch,@BillNumberFirm,@BranchId,@FirmId,@YearId,@LoginId,@GoDownNumber,@ReceivedNote,GETUTCDATE(),@LoginId,0)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-ChalanReceive-Z] SET
			 PurchaseBillMasterId = @PurchaseBillMasterId
			,ReceiveDate = @ReceiveDate 
			,@BillNumberBranch = @BillNumberBranch 
			,BillNumberFirm = @BillNumberFirm 
			,GoDownNumber = @GoDownNumber 
			,UserId = @LoginId 
			,ReceivedNote = @ReceivedNote 
			,DeletedById = NULL 
			,DeletedOn = NULL 
			,ModifiedById = @LoginId 
			,ModifiedOn = GETUTCDATE() 
			,Deleted = 0 
			,BranchId = @BranchId 
			,FirmId = @FirmId 
			,YearId = @YearId 
			WHERE Id = @Id

		END

		UPDATE  [Z-PurchaseBillDetail-Z] SET
				 Received = 0
				,ModifiedById = @LoginId 
				,ModifiedOn = GETUTCDATE() 
		WHERE PurchaseBillMasterId = @PurchaseBillMasterId AND [LRBookingId] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))

		UPDATE  [Z-PurchaseBillDetail-Z] SET
				 Received = 1
				,ModifiedById = @LoginId 
				,ModifiedOn = GETUTCDATE() 
		WHERE PurchaseBillMasterId = @PurchaseBillMasterId AND [LRBookingId] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))

		COMMIT TRAN
		SELECT @Id
	END TRY
	BEGIN CATCH
		DECLARE @error INT, @xstate INT;
		SELECT @error = ERROR_NUMBER(), @message = ERROR_MESSAGE(), @xstate = XACT_STATE();
		ROLLBACK TRAN

		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO