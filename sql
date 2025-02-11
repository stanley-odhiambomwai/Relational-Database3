-- Creating the CUSTOMER table
CREATE TABLE CUSTOMER (
    CustomerID NUMBER PRIMARY KEY,
    Name VARCHAR2(100) NOT NULL,
    Email VARCHAR2(100) UNIQUE,
    Phone VARCHAR2(15),
    Address VARCHAR2(255)

    INSERT INTO Customers (CustomerID, CustomerName, ContactName, Country)
VALUES 
(1, 'Alfreds Futterkiste', 'Maria Anders', 'Germany'),
(2, 'Ana Trujillo Emparedados y helados', 'Ana Trujillo', 'Mexico'),
(3, 'Antonio Moreno Taquería', 'Antonio Moreno', 'Mexico');

);


-- Creating the PRODUCT table
CREATE TABLE PRODUCT (
    ProductID NUMBER PRIMARY KEY,
    ProductName VARCHAR2(100) NOT NULL,
    Price NUMBER(10,2) CHECK (Price > 0),
    StockQuantity NUMBER DEFAULT 0 CHECK (StockQuantity >= 0)

INSERT INTO Products (ProductID, ProductName, SupplierID, CategoryID, Unit, Price)
VALUES
(1, 'Chai', 1, 1, '10 boxes x 20 bags', 18.00),
(2, 'Chang', 1, 1, '24 - 12 oz bottles', 19.00),
(3, 'Aniseed Syrup', 1, 2, '12 - 550 ml bottles', 10.00);

    
);

-- Creating the ORDERS table
CREATE TABLE ORDERS (
    OrderID NUMBER PRIMARY KEY,
    CustomerID NUMBER,
    TotalAmount NUMBER(10,2) CHECK (TotalAmount >= 0),
    FOREIGN KEY (CustomerID) REFERENCES CUSTOMER(CustomerID) ON DELETE CASCADE

    INSERT INTO Orders (OrderID, CustomerID, EmployeeID, OrderDate)
VALUES
(10248, 1, 5, '2023-10-01'),
(10249, 2, 6, '2023-10-02'),
(10250, 3, 7, '2023-10-03');

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

-- Adding OrderDate column to ORDERS table with default value as current date
ALTER TABLE ORDERS ADD OrderDate DATE DEFAULT SYSDATE;
