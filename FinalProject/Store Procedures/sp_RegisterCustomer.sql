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
CREATE PROCEDURE sp_RegisterCustomer
    @name VARCHAR(100),
    @phone VARCHAR(20),
    @email VARCHAR(100),
    @address TEXT
AS
BEGIN
    INSERT INTO Customer (name, phone, email, address)
    VALUES (@name, @phone, @email, @address);
    
    PRINT 'Customer registered successfully.';
END;

--Coba Exec--

--EXEC sp_RegisterCustomer 
--    @name = 'Siti Rahma',
--    @phone = '0812345678',
--    @email = 'siti@mail.com',
--    @address = 'Jl. Melati No.10, Bandung';

--Coba Cek--
--SELECT * FROM Customer;
