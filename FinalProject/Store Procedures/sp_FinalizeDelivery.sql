-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE sp_FinalizeDelivery
    @agreement_id INT
AS
BEGIN
    IF NOT EXISTS (SELECT 1 FROM Agreement WHERE agreement_id = @agreement_id)
    BEGIN
        RAISERROR('Agreement not found.', 16, 1);
        RETURN;
    END

    UPDATE Agreement
    SET status = 'Delivered'
    WHERE agreement_id = @agreement_id;

    PRINT 'Delivery finalized.';
END;

-- COBA EXEC --
--EXEC sp_FinalizeDelivery @agreement_id = 1;
