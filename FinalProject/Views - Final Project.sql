
-- LAPORAN PENJUALAN ---

CREATE VIEW vw_SalesReport AS
SELECT 
    a.agreement_id,
    c.name AS customer_name,
    sp.name AS sales_name,
    d.name AS dealer_name,
    a.agreement_date,
    a.status,
    a.is_credit,
    dbo.fn_TotalAgreementPrice(a.agreement_id) AS total_price,
    dbo.fn_AdminFee(a.is_credit) AS admin_fee
FROM Agreement a
JOIN Customer c ON a.customer_id = c.customer_id
JOIN SalesPerson sp ON a.sales_person_id = sp.sales_person_id
JOIN Dealer d ON a.dealer_id = d.dealer_id;

-- STATUS PENGAJUAN KREDIT ---

CREATE VIEW vw_CreditStatus AS
SELECT 
    cr.credit_id,
    a.agreement_id,
    c.name AS customer_name,
    cr.leasing_company,
    cr.survey_date,
    cr.approval_date,
    cr.status AS credit_status
FROM Credit cr
JOIN Agreement a ON cr.agreement_id = a.agreement_id
JOIN Customer c ON a.customer_id = c.customer_id;

-- Daftar Mobil Tersedia) ---

CREATE VIEW vw_AvailableCars AS
SELECT 
    dc.dealer_car_id,
    d.name AS dealer_name,
    c.brand,
    c.model,
    dc.dealer_price,
    dc.stock
FROM DealerCar dc
JOIN Dealer d ON dc.dealer_id = d.dealer_id
JOIN Car c ON dc.car_id = c.car_id
WHERE dc.stock > 0;
