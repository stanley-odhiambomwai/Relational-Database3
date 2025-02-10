-- Creating the CUSTOMER table
CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(15),
    Address VARCHAR2(255)
);

-- Creating the PRODUCT table
CREATE TABLE PRODUCT (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100) NOT NULL,
    Price NUMBER(10,2) CHECK (Price > 0),
    StockQuantity NUMBER DEFAULT 0 CHECK (StockQuantity >= 0)
);

