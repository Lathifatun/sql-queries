-- DEALER
CREATE TABLE Dealer (
    dealer_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    address TEXT,
    tax_percentage DECIMAL(5,2)
);

-- CAR
CREATE TABLE Car (
    car_id INT PRIMARY KEY IDENTITY(1,1),
    brand VARCHAR(50),
    model VARCHAR(50),
    base_price DECIMAL(15,2)
);

-- JUNCTION: DealerCar
CREATE TABLE DealerCar (
    dealer_car_id INT PRIMARY KEY IDENTITY(1,1),
    dealer_id INT,
    car_id INT,
    dealer_price DECIMAL(15,2),
    stock INT,
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id),
    FOREIGN KEY (car_id) REFERENCES Car(car_id)
);

-- SALESPERSON
CREATE TABLE SalesPerson (
    sales_person_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20)
);

-- CUSTOMER
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY IDENTITY(1,1),
    name VARCHAR(100),
    phone VARCHAR(20),
    email VARCHAR(100),
    address TEXT
);

-- CONSULTATION HISTORY
CREATE TABLE ConsultHistory (
    consult_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    sales_person_id INT,
    consult_date DATE,
    notes TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (sales_person_id) REFERENCES SalesPerson(sales_person_id)
);

-- TEST DRIVE & NEGOSIASI
CREATE TABLE TestDriveNego (
    test_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    dealer_car_id INT,
    test_date DATE,
    discount_offer DECIMAL(10,2),
    accessories_offer TEXT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (dealer_car_id) REFERENCES DealerCar(dealer_car_id)
);

-- LOI
CREATE TABLE LOI (
    loi_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    loi_date DATE,
    total_booking_fee DECIMAL(15,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- AGREEMENT
CREATE TABLE Agreement (
    agreement_id INT PRIMARY KEY IDENTITY(1,1),
    customer_id INT,
    sales_person_id INT,
    dealer_id INT,
    loi_id INT UNIQUE,
    agreement_date DATE,
    is_credit BIT,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Paid', 'Delivered')),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (sales_person_id) REFERENCES SalesPerson(sales_person_id),
    FOREIGN KEY (dealer_id) REFERENCES Dealer(dealer_id),
    FOREIGN KEY (loi_id) REFERENCES LOI(loi_id)
);

-- AGREEMENT DETAIL MOBIL (1 agreement bisa banyak mobil)
CREATE TABLE AgreementDealerCar (
    id INT PRIMARY KEY IDENTITY(1,1),
    agreement_id INT,
    dealer_car_id INT,
    quantity INT,
    final_price DECIMAL(15,2),
    FOREIGN KEY (agreement_id) REFERENCES Agreement(agreement_id),
    FOREIGN KEY (dealer_car_id) REFERENCES DealerCar(dealer_car_id)
);

-- CREDIT (Opsional, jika dipisah)
CREATE TABLE Credit (
    credit_id INT PRIMARY KEY IDENTITY(1,1),
    agreement_id INT UNIQUE,
    leasing_company VARCHAR(100),
    survey_date DATE,
    approval_date DATE,
    status VARCHAR(20) CHECK (status IN ('Pending', 'Approved', 'Rejected')),
    FOREIGN KEY (agreement_id) REFERENCES Agreement(agreement_id)
);

-- PAYMENT DETAIL
CREATE TABLE PaymentDetail (
    payment_id INT PRIMARY KEY IDENTITY(1,1),
    agreement_id INT,
    payment_date DATE,
    amount DECIMAL(15,2),
    payment_type VARCHAR(20) CHECK (payment_type IN ('Booking Fee', 'DP', 'Lunas', 'Admin Fee', 'Asuransi')),
    FOREIGN KEY (agreement_id) REFERENCES Agreement(agreement_id)
);
