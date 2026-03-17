show databases;
use my_demo_db;
-- Create Customer Table
CREATE TABLE Customer (
    customer_id VARCHAR(10) PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    customer_email VARCHAR(100) NOT NULL,
    customer_city VARCHAR(50) NOT NULL
);
show tables;
-- Create Product Table
CREATE TABLE Product (
    product_id VARCHAR(10) PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    unit_price DECIMAL(10, 2) NOT NULL
);
-- Create Sales Representatives Table
CREATE TABLE SalesRep (
    sales_rep_id VARCHAR(10) PRIMARY KEY,
    sales_rep_name VARCHAR(100) NOT NULL,
    sales_rep_email VARCHAR(100) NOT NULL,
    office_address VARCHAR(255) NOT NULL
);
-- Create Order Table (Fact Table linking common entities)
CREATE TABLE Orders (
    order_id VARCHAR(10) PRIMARY KEY,
    customer_id VARCHAR(10) NOT NULL,
    sales_rep_id VARCHAR(10) NOT NULL,
    product_id VARCHAR(10) NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    order_date DATE NOT NULL,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (sales_rep_id) REFERENCES SalesRep(sales_rep_id),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);
show tables;
-- Adding data (5+ rows per table as requested)
INSERT INTO Customer (customer_id, customer_name, customer_email, customer_city) VALUES
('C001', 'Rohan Mehta', 'rohan@gmail.com', 'Mumbai'),
('C002', 'Priya Sharma', 'priya@gmail.com', 'Delhi'),
('C003', 'Amit Verma', 'amit@gmail.com', 'Bangalore'),
('C004', 'Sneha Iyer', 'sneha@gmail.com', 'Chennai'),
('C005', 'Vikram Singh', 'vikram@gmail.com', 'Mumbai');
INSERT INTO Product (product_id, product_name, category, unit_price) VALUES
('P001', 'Laptop', 'Electronics', 55000),
('P002', 'Mouse', 'Electronics', 800),
('P003', 'Desk Chair', 'Furniture', 8500),
('P004', 'Notebook', 'Stationery', 120),
('P005', 'Headphones', 'Electronics', 3200),
('P009', 'Reclainer Chair', 'Furniture', 15000); -- Added to test Q5
INSERT INTO SalesRep (sales_rep_id, sales_rep_name, sales_rep_email, office_address) VALUES
('SR01', 'Deepak Joshi', 'deepak@corp.com', 'Mumbai HQ, Nariman Point, Mumbai - 400021'),
('SR02', 'Anita Desai', 'anita@corp.com', 'Delhi Office, Connaught Place, New Delhi - 110001'),
('SR03', 'Ravi Kumar', 'ravi@corp.com', 'South Zone, MG Road, Bangalore - 560001'),
('SR04', 'Sandeep Jain', 'sandeep@corp.com', 'Kolkata Office, Park Street, Kolkata - 700016'),
('SR05', 'Megha Shah', 'megha@corp.com', 'Chennai Office, T-Nagar, Chennai - 600017');
INSERT INTO Orders (order_id, customer_id, sales_rep_id, product_id, quantity, order_date) VALUES
('ORD1027', 'C002', 'SR02', 'P004', 4, '2023-11-02'),
('ORD1075', 'C005', 'SR03', 'P003', 3, '2023-04-18'),
('ORD1094', 'C002', 'SR01', 'P003', 3, '2023-10-25'),
('ORD1002', 'C002', 'SR02', 'P005', 1, '2023-01-17'),
('ORD1010', 'C002', 'SR01', 'P004', 3, '2023-10-10');

	









