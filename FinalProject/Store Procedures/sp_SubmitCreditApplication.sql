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
CREATE PROCEDURE sp_SubmitCreditApplication
    @agreement_id INT,
    @leasing_company VARCHAR(100)
AS
BEGIN
    -- Cek apakah sudah ada pengajuan sebelumnya
    IF EXISTS (SELECT 1 FROM Credit WHERE agreement_id = @agreement_id)
    BEGIN
        RAISERROR('Credit application already exists for this agreement.', 16, 1);
        RETURN;
    END

    INSERT INTO Credit (agreement_id, leasing_company, survey_date, status)
    VALUES (@agreement_id, @leasing_company, GETDATE(), 'Pending');

    PRINT 'Credit application submitted.';
END;


-- COBA EXEC --
--EXEC sp_SubmitCreditApplication 
--    @agreement_id = 2,
--    @leasing_company = 'Mandiri Utama Finance';


