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

-- Creating the ORDERS table
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    TotalAmount NUMBER(10,2) CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE
);


-- Creating the ORDER_DETAILS table (to handle many-to-many relationship between ORDERS and PRODUCT)
CREATE TABLE ORDER_DETAILS (
    OrderDetailID NUMBER PRIMARY KEY,
    OrderID NUMBER,
    ProductID NUMBER,
    Quantity NUMBER CHECK (Quantity > 0),
    Subtotal NUMBER(10,2),
    FOREIGN KEY (OrderID) REFERENCES ORDERS(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES PRODUCT(ProductID) ON DELETE CASCADE
);


-- Adding Category column to PRODUCT table
ALTER TABLE PRODUCT ADD Category VARCHAR2(20);