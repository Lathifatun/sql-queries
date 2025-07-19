CREATE TRIGGER trg_UpdateStockAfterLunas
ON PaymentDetail
AFTER INSERT
AS
BEGIN
    SET NOCOUNT ON;

    -- Jalankan hanya jika payment_type = 'Lunas'
    IF EXISTS (SELECT 1 FROM inserted WHERE payment_type = 'Lunas')
    BEGIN
        UPDATE dc
        SET dc.stock = dc.stock - adc.quantity
        FROM DealerCar dc
        JOIN AgreementDealerCar adc ON dc.dealer_car_id = adc.dealer_car_id
        JOIN inserted i ON i.agreement_id = adc.agreement_id
        WHERE i.payment_type = 'Lunas';
    END
END;


-- COBA TRIGGER --
--SELECT * FROM DealerCar WHERE dealer_car_id = 1;

--INSERT INTO PaymentDetail (agreement_id, payment_date, amount, payment_type)
--VALUES (1, GETDATE(), 260000000, 'Lunas');

--SELECT * FROM DealerCar WHERE dealer_car_id = 1;



