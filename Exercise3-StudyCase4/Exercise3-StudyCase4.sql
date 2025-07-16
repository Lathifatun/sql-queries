-- 1. Tabel RentalBranch
CREATE TABLE RentalBranch (
    BranchID INT PRIMARY KEY IDENTITY(1,1),
    BranchName VARCHAR(100) NOT NULL,
    Location VARCHAR(100)
);

-- 2. Tabel Vehicle
CREATE TABLE Vehicle (
    VehicleID INT PRIMARY KEY IDENTITY(1,1),
    PlateNumber VARCHAR(20) UNIQUE NOT NULL,
    Model VARCHAR(50),
    Mileage VARCHAR(20),
    Status VARCHAR(20), -- e.g. Available, Rented, Maintenance
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES RentalBranch(BranchID)
);

-- 3. Tabel Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Phone VARCHAR(20),
    Email VARCHAR(100)
);

-- 4. Tabel Employee
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Position VARCHAR(50),
    BranchID INT NOT NULL,
    FOREIGN KEY (BranchID) REFERENCES RentalBranch(BranchID)
);

-- 5. Tabel RentalContract
CREATE TABLE RentalContract (
    ContractID INT PRIMARY KEY IDENTITY(1,1),
    CustomerID INT NOT NULL,
    VehicleID INT NOT NULL,
    EmployeeID INT NOT NULL,
    StartDate DATE NOT NULL,
    EndDate DATE NOT NULL,
    TotalDays INT NOT NULL,
    DailyRate VARCHAR(20) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (VehicleID) REFERENCES Vehicle(VehicleID),
    FOREIGN KEY (EmployeeID) REFERENCES Employee(EmployeeID)
);
