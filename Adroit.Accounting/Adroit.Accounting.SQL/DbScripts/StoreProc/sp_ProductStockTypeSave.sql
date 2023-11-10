CREATE OR ALTER PROCEDURE [dbo].[sp_ProductStockTypeSave]
(
	 @Id int,
	 @Title VARCHAR(50),
	 @OrderNumber int,
	 @Active bit
)
AS
BEGIN
	BEGIN TRAN
	BEGIN TRY
		IF EXISTS (SELECT 1 FROM ProductStockType WHERE Id = @Id)
			BEGIN
				UPDATE  ProductStockType SET
						Title = @Title,
						OrderNumber = @OrderNumber,
						Active = @active
					WHERE ID = @Id
			END
		ELSE If EXISTS (SELECT 1 FROM ProductStockType WHERE Title = @Title AND Deleted = 1)
			BEGIN
				UPDATE  ProductStockType SET
						OrderNumber = @OrderNumber,
						Active = @active,
						Deleted = 0
					WHERE Title = @Title 

				SELECT @Id=Id FROM ProductStockType WHERE Title = @Title 
			END
		ELSE
			BEGIN
				INSERT INTO ProductStockType
					(Title, OrderNumber, Active, Deleted)
				VALUES
					(@Title, @OrderNumber, @Active, 0)

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
			SET @message = 'Stock type ''' + @Title + ''' already exist!';
		END
		
		RAISERROR ('%s', 16, 1, @message);
	END CATCH
END
GO