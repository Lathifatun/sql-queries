-- 1. Tabel PartCategory
CREATE TABLE PartCategory (
    CategoryID INT PRIMARY KEY IDENTITY(1,1),
    CategoryName VARCHAR(50) NOT NULL
);

-- 2. Tabel Part
CREATE TABLE Part (
    PartNumber VARCHAR(50) PRIMARY KEY,  -- Nomor unik part
    PartName VARCHAR(50) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES PartCategory(CategoryID)
);

-- 3. Tabel Supplier
CREATE TABLE Supplier (
    SupplierID INT PRIMARY KEY IDENTITY(1,1),
    SupplierName VARCHAR(100) NOT NULL,
    ContactInfo VARCHAR(255)
);

-- 4. Tabel SupplierPartOffer (junction table)
CREATE TABLE SupplierPartOffer (
    OfferID INT PRIMARY KEY IDENTITY(1,1),
    SupplierID INT NOT NULL,
    PartNumber VARCHAR(50) NOT NULL,
    UnitPrice VARCHAR(20) NOT NULL,        -- Harga unit disimpan sebagai teks
    LeadTimeDays VARCHAR(10) NOT NULL,     -- Lama pengiriman (hari) sebagai teks
    Rating VARCHAR(5),                     -- Bisa berupa huruf (A, B, C) atau angka
    FOREIGN KEY (SupplierID) REFERENCES Supplier(SupplierID),
    FOREIGN KEY (PartNumber) REFERENCES Part(PartNumber)
);
