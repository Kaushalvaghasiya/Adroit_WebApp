CREATE OR ALTER PROCEDURE [dbo].[sp_ProductAmtCalcOnSave]
(
	 @Id int,
	 @Title VARCHAR(100),
	 @SoftwareId INT,
	 @OrderNumber int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM ProductAmtCalcOn WHERE Id = @Id)
			BEGIN
				UPDATE  ProductAmtCalcOn SET
						SoftwareId = @SoftwareId,
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM ProductAmtCalcOn WHERE SoftwareId = @SoftwareId AND Title = @Title AND IsDeleted = 1)
			BEGIN
				UPDATE  ProductAmtCalcOn SET
						OrderNumber = @OrderNumber,
						Active = @active,
						IsDeleted = 0
					WHERE SoftwareId = @SoftwareId AND Title = @Title 

				SELECT @Id=Id FROM ProductAmtCalcOn WHERE SoftwareId = @SoftwareId AND Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO ProductAmtCalcOn
					(SoftwareId, Title, OrderNumber, Active)
				VALUES
					(@SoftwareId, @Title, @OrderNumber, @Active)

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
			SET @message = 'Amount calculation ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO