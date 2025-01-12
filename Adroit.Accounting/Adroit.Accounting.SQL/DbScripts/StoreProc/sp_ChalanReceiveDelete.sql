CREATE OR ALTER procedure [dbo].[sp_ChalanReceiveDelete]
(	
	@Id INT,
	@LoginId INT
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY

		UPDATE ZBD SET 
		 ZBD.Received = 0
		,ZBD.ModifiedById = @LoginId 
		,ZBD.ModifiedOn = GETUTCDATE() 
		FROM [Z-PurchaseBillDetail-Z] ZBD
		INNER JOIN [Z-ChalanReceive-Z] on [Z-ChalanReceive-Z].PurchaseBillMasterId = ZBD.PurchaseBillMasterId AND [Z-ChalanReceive-Z].Id = @Id;
		
		DELETE FROM [Z-ChalanReceive-Z] WHERE Id= @Id;

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
