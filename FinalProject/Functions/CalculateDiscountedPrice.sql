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
CREATE FUNCTION dbo.fn_CalculateDiscountedPrice
(
    @original_price DECIMAL(15,2),
    @discount_percent DECIMAL(5,2)
)
RETURNS DECIMAL(15,2)
AS
BEGIN
    RETURN @original_price - (@original_price * @discount_percent / 100.0);
END;

