select * from tab;

CREATE TABLE Customer(
customer_id VARCHAR2(15) PRIMARY KEY,
customer_name VARCHAR2(15) NOT NULL,
contact_name VARCHAR2(15)  NOT NULL,
address VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
postalcode VARCHAR2(15) NOT NULL,
country VARCHAR2(15) NOT NULL
);
CREATE TABLE Employees(
employee_id VARCHAR2(15) PRIMARY KEY,
last_name VARCHAR2(15) NOT NULL,
first_name VARCHAR2(15) NOT NULL,
birth_date VARCHAR2(15) UNIQUE NOT NULL,
photo VARCHAR2(15)
);
alter table ;



CREATE TABLE Shippers(
shipper_id VARCHAR2(15) PRIMARY KEY,
shipper_name VARCHAR2(15)  NOT NULL,
phone VARCHAR2(15) UNIQUE NOT NULL
);

CREATE SEQUENCE order_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Orders(
order_id NUMBER PRIMARY KEY,
customer_id VARCHAR2(15),
employee_id VARCHAR2(15),
order_date DATE DEFAULT SYSDATE,
shipper_id VARCHAR2(15),
CONSTRAINT orders_fk_customers FOREIGN KEY(customer_id) REFERENCES customer(customer_id),
CONSTRAINT orders_fk_employees FOREIGN KEY(employee_id) REFERENCES employees(employee_id),
CONSTRAINT orders_fk_shippers FOREIGN KEY(shipper_id) REFERENCES shippers(shipper_id)
);
CREATE TABLE Suppliers(
supplier_id VARCHAR2(15) PRIMARY KEY,
supplier_name VARCHAR2(15) NOT NULL,
contact_name VARCHAR2(15) NOT NULL,
address VARCHAR2(15) NOT NULL,
city VARCHAR2(15) NOT NULL,
postal_code VARCHAR2(15) NOT NULL,
country VARCHAR2(15) NOT NULL,
phone VARCHAR2(15) NOT NULL
);

CREATE SEQUENCE category_id
START WITH 1000
INCREMENT BY 1;

CREATE TABLE Categories(
category_id NUMBER PRIMARY KEY,
category_name VARCHAR2(15),
description VARCHAR2(15) 
);


CREATE SEQUENCE product_id
START WITH 1000
INCREMENT BY 1;
CREATE TABLE Products(
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(15) NOT NULL,
    supplier_id VARCHAR2(15),
    category_id NUMBER,
    unit VARCHAR2(15),
    price NUMBER,
    CONSTRAINT products_fk_suppliers FOREIGN KEY(supplier_id) REFERENCES  suppliers(supplier_id),
    CONSTRAINT products_fk_categories FOREIGN KEY(category_id) REFERENCES categories(category_id)
);

CREATE SEQUENCE order_detail_id
START WITH 1000
INCREMENT BY 1;
CREATE TABLE Orderdetails(
order_detail_id NUMBER PRIMARY KEY,
order_id NUMBER,
product_id NUMBER,
quantity NUMBER,
CONSTRAINT orderdetails_order_id FOREIGN KEY(order_id) REFERENCES Orders(order_id),
CONSTRAINT orderdetails_product_id FOREIGN KEY(product_id) REFERENCES Products(product_id)
);


ALTER TABLE Products
MODIFY (order_detail_id NUMBER);

SELECT*FROM TAB;
SELECT*FROM Customer;
SELECT*FROM Employees;
SELECT*FROM Shippers;
SELECT*FROM Orders;
SELECT*FROM Suppliers;
SELECT*FROM Categories;
SELECT*FROM Products;
SELECT*FROM Orderdetails;