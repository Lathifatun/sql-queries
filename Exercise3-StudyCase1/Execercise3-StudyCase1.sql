-- 1. Tabel CarModel
CREATE TABLE CarModel (
    CarModelID INT PRIMARY KEY IDENTITY(1,1),
    ModelName VARCHAR(50) NOT NULL,
    Year VARCHAR(4) NOT NULL
);

-- 2. Tabel PrototypeVehicle
CREATE TABLE PrototypeVehicle (
    PrototypeID INT PRIMARY KEY IDENTITY(1,1),
    CarModelID INT NOT NULL,
    VIN VARCHAR(50) UNIQUE NOT NULL,
    BuildDate VARCHAR(10) NOT NULL,
    FOREIGN KEY (CarModelID) REFERENCES CarModel(CarModelID)
);

-- 3. Tabel TestEngineer
CREATE TABLE TestEngineer (
    EngineerID INT PRIMARY KEY IDENTITY(1,1),
    FullName VARCHAR(100) NOT NULL,
    Specialty VARCHAR(100),
 
);

-- 4. Tabel TestLocation
CREATE TABLE TestLocation (
    LocationID INT PRIMARY KEY IDENTITY(1,1),
    LocationName VARCHAR(50) NOT NULL,
    City VARCHAR(50),
    Country VARCHAR(50)
);

-- 5. Tabel VehicleTest
CREATE TABLE VehicleTest (
    TestID INT PRIMARY KEY IDENTITY(1,1),
    PrototypeID INT NOT NULL,
    EngineerID INT NOT NULL,
    LocationID INT NOT NULL,
    TestDate VARCHAR(10) NOT NULL,
    TestType VARCHAR(100) NOT NULL,
    Result VARCHAR(10) CHECK (Result IN ('Pass', 'Fail')),
    Notes TEXT,
    FOREIGN KEY (PrototypeID) REFERENCES PrototypeVehicle(PrototypeID),
    FOREIGN KEY (EngineerID) REFERENCES TestEngineer(EngineerID),
    FOREIGN KEY (LocationID) REFERENCES TestLocation(LocationID)
);
