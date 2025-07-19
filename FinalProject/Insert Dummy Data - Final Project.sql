-- DEALER
INSERT INTO Dealer (name, address, tax_percentage)
VALUES 
('AutoCar Bandung', 'Jl. Soekarno Hatta No.1, Bandung', 10.00),
('AutoCar Jakarta', 'Jl. Sudirman No.88, Jakarta', 12.00);


-- CARS
INSERT INTO Car (brand, model, base_price)
VALUES 
('Mitsu', 'Xpander', 280000000),
('Mitsu', 'Pajero Sport', 580000000),
('Mitsu', 'Outlander', 420000000);


-- DEALER CARS (Stok & harga tiap dealer)
INSERT INTO DealerCar (dealer_id, car_id, dealer_price, stock)
VALUES 
(1, 1, 275000000, 5),
(1, 2, 570000000, 2),
(2, 2, 565000000, 4),
(2, 3, 415000000, 3);

-- SALESPERSON
INSERT INTO SalesPerson (name, email, phone)
VALUES 
('Andi', 'andi@autocar.com', '08123456789'),
('Budi', 'budi@autocar.com', '08987654321');

-- CUSTOMER
INSERT INTO Customer (name, phone, email, address)
VALUES 
('Rina Wijaya', '08110000111', 'rina@mail.com', 'Bandung'),
('Fajar Pratama', '08220000222', 'fajar@mail.com', 'Jakarta');

-- CONSULT HISTORY
INSERT INTO ConsultHistory (customer_id, sales_person_id, consult_date, notes)
VALUES 
(1, 1, '2025-07-01', 'Tanya model Xpander dan Pajero.'),
(2, 2, '2025-07-02', 'Minat kredit Outlander.');

-- TEST DRIVE & NEGO
INSERT INTO TestDriveNego (customer_id, dealer_car_id, test_date, discount_offer, accessories_offer)
VALUES 
(1, 1, '2025-07-03', 5, 'Karpet, sarung jok'),
(2, 4, '2025-07-04', 3, 'Dashcam');

-- LOI
INSERT INTO LOI (customer_id, loi_date, total_booking_fee)
VALUES 
(1, '2025-07-04', 5000000),
(2, '2025-07-05', 5000000);

-- AGREEMENT
INSERT INTO Agreement (customer_id, sales_person_id, dealer_id, loi_id, agreement_date, is_credit, status)
VALUES 
(1, 1, 1, 1, '2025-07-04', 0, 'Pending'),
(2, 2, 2, 2, '2025-07-05', 1, 'Pending');

-- AGREEMENT - DETAIL MOBIL
INSERT INTO AgreementDealerCar (agreement_id, dealer_car_id, quantity, final_price)
VALUES 
(1, 1, 1, 260000000),
(2, 4, 1, 400000000);

-- CREDIT
INSERT INTO Credit (agreement_id, leasing_company, survey_date, approval_date, status)
VALUES 
(2, 'Adira Finance', '2025-07-06', '2025-07-07', 'Approved');

-- PAYMENT DETAIL
INSERT INTO PaymentDetail (agreement_id, payment_date, amount, payment_type)
VALUES 
(1, '2025-07-04', 5000000, 'Booking Fee'),
(1, '2025-07-05', 255000000, 'Lunas'),
(2, '2025-07-05', 5000000, 'Booking Fee'),
(2, '2025-07-08', 40000000, 'DP');
