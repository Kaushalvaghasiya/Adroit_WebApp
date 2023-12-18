CREATE OR ALTER   PROCEDURE [dbo].[sp_ChalanBranchSave]
(
	 @LoginId INT
	,@FirmId INT
	,@BranchId INT
	,@Id INT 
	,@BillNumberBranch INT  
	,@GoDownNumber INT  
	,@PurchaseBillMasterId INT
	,@BillNumberFirm INT
	,@BillDate DATETIME  
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
			FROM [Z-PurchaseBillMasterReceive-Z]
			WHERE [Z-PurchaseBillMasterReceive-Z].BranchId = @BranchId AND [Z-PurchaseBillMasterReceive-Z].YearId = @YearId 
		END

		IF ISNULL(@BillNumberFirm, 0) = 0
		BEGIN
			SELECT @BillNumberFirm = ISNULL(MAX(BillNumberFirm),0) + 1
			FROM [Z-PurchaseBillMasterReceive-Z]
			WHERE [Z-PurchaseBillMasterReceive-Z].FirmId = @FirmId AND [Z-PurchaseBillMasterReceive-Z].YearId = @YearId 
		END

		DECLARE @IdCheck INT
		SELECT @IdCheck = ID FROM [Z-PurchaseBillMasterReceive-Z] 
							WHERE (Id = @Id) 
							OR (BranchId = @BranchId AND PurchaseBillMasterId = @PurchaseBillMasterId AND Deleted = 1)

		IF ISNULL(@IdCheck, 0) = 0
		BEGIN

			INSERT INTO [Z-PurchaseBillMasterReceive-Z]
           (PurchaseBillMasterId,BillDate,BillNumberBranch,BillNumberFirm,BranchId,FirmId,YearId,UserId,GoDownNumber,ReceivedNote,AddedOn,AddedById,Deleted)
			VALUES
           (@PurchaseBillMasterId,@BillDate,@BillNumberBranch,@BillNumberFirm,@BranchId,@FirmId,@YearId,@LoginId,@GoDownNumber,@ReceivedNote,GETUTCDATE(),@LoginId,0)

			SET @Id = SCOPE_IDENTITY();
			
		END
		ELSE
		BEGIN
			SET @Id = @IdCheck

			UPDATE [Z-PurchaseBillMasterReceive-Z] SET
			 PurchaseBillMasterId = @PurchaseBillMasterId
			,BillDate = @BillDate 
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

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = @LoginId,
					DeletedOn = GETUTCDATE(),
					Deleted = 1
			WHERE PurchaseBillMasterId = @PurchaseBillMasterId AND [Id] NOT IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))

			UPDATE  [Z-PurchaseBillDetail-Z] SET
					DeletedById = NULL,
					DeletedOn = NULL,
					Deleted = 0
			WHERE PurchaseBillMasterId = @PurchaseBillMasterId AND [Id] IN ( SELECT Id FROM dbo.[fnStringToIntArray](@LRNumberIds))

		END

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