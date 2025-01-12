CREATE OR ALTER PROCEDURE [dbo].[sp_TransportLRBranchCityMappingSave]
(
       @Id int,
       @LoginId int,
       @FirmId int,
       @BranchId int,
       @BranchIds varchar(max),
       @CityId int,
       @Active bit,
       @OrderNumber int
)
AS
BEGIN
      BEGIN TRAN
      BEGIN TRY         

            IF EXISTS (SELECT 1 FROM TransportLRBranchCityMapping WHERE Id = @Id)
                  BEGIN
                        UPDATE  TransportLRBranchCityMapping SET
                                    BranchId = @BranchId,
                                    CityId = @CityId,
                                    OrderNumber = @OrderNumber,
                                    Active = @Active
                              WHERE ID = @Id
                  END
            ELSE If EXISTS (SELECT 1 FROM TransportLRBranchCityMapping WHERE CityId = @CityId AND BranchId = @BranchId AND Deleted = 1)
                  BEGIN
                        UPDATE  TransportLRBranchCityMapping SET
                                    BranchId = @BranchId,
                                    CityId = @CityId,
                                    OrderNumber = @OrderNumber,
                                    Active = @Active,
                                    Deleted = 0,
                                    DeletedById = NULL
                              WHERE CityId = @CityId AND BranchId = @BranchId

                        SELECT @Id=Id FROM TransportLRBranchCityMapping WHERE CityId = @CityId AND BranchId = @BranchId
                  END
            ELSE 
                  BEGIN
                        INSERT INTO TransportLRBranchCityMapping (OrderNumber,BranchId,CityId,Active,Deleted,AddedById,AddedOn)
                        SELECT @OrderNumber, CAST(A.ID AS INT) AS [BranchId], @CityId, @Active, 0, @LoginId, GETUTCDATE()
                        FROM dbo.fnStringToIntArray(@BranchIds) A
                        WHERE NOT EXISTS (
                            SELECT 1
                            FROM TransportLRBranchCityMapping C
                            WHERE C.BranchId = CAST(A.ID AS INT) AND C.CityId = @CityId
                        );

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
                  SET @message = 'TransportLRBranchCityMapping ''' + @OrderNumber + ''' already exist!';
            END
            
            RAISERROR ('%s', 16, 1, @message);
      END CATCH
END