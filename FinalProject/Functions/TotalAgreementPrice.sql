-- ================================================
-- Template generated from Template Explorer using:
-- Create Scalar Function (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the function.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date, ,>
-- Description:	<Description, ,>
-- =============================================
CREATE FUNCTION dbo.fn_TotalAgreementPrice
(
    @agreement_id INT
)
RETURNS DECIMAL(15,2)
AS
BEGIN
    DECLARE @total DECIMAL(15,2);

    SELECT @total = SUM(final_price * quantity)
    FROM AgreementDealerCar
    WHERE agreement_id = @agreement_id;

    RETURN ISNULL(@total, 0);
END;


