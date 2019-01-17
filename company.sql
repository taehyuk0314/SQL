SELECT * FROM TAB;
create table customers(
customer_id varchar2(15) primary key,
customer_name varchar2(15) not null,
contact_name varchar2(15) unique,
address varchar2(15) not null,
city varchar2(15) not null,
postal_code varchar2(15) not null,
country varchar2(15) not null
); 

create table employees(
Employee_id varchar2(15) primary key,
last_name varchar2(15) not null,
first_name varchar2(15) not null,
birth_date varchar2(15) not null,
photo varchar2(15) not null,
notes varchar2(15) 
);

create table shippers(
shipper_id varchar2(15) primary key,
shipper_name varchar2(15),
phone varchar2(15)
);

create sequence order_id
start with 1000
increment by 1;

create table orders(
order_id number primary key,
customer_id varchar2(15) not null,
constraint orders_fk_custmers foreign key(customer_id)
references customers(customer_id),
employee_id varchar2(15) not null,
constraint orders_fk_employees foreign key(employee_id)
references employees(employee_id),
order_date date default sysdate,
shipper_id varchar2(15) not null,
constraint orders_fk_shippers foreign key(shipper_id)
references shippers(shipper_id)
);

create sequence order_detail_id
start with 2000
increment by 1;

create table order_details(
order_detail_id number primary key,
order_id number not null,
constraint order_details_fk_orders foreign key(order_id)
references orders(order_id),
product_id number not null,
constraint order_details_fk_products foreign key(product_id)
references products(product_id),
quantity number not null
);

create table suppliers(
supplier_id varchar2(15) primary key,
supplier_name varchar2(15) not null,
contact_name varchar2(15) unique,
address varchar2(15) not null,
city varchar2(15) not null,
postal_code varchar2(15) not null,
country varchar2(15) not null,
phone varchar2(15) not null
);

create sequence product_id
start with 3000
increment by 1;

create table products(
product_id number primary key,
product_name varchar2(15) not null,
supplier_id varchar2(15) not null,
constraint products_fk_suppliers foreign key(supplier_id)
references suppliers(supplier_id),
category_id number not null,
constraint products_fk_categories foreign key(category_id)
references categories(category_id),
unit varchar2(15) not null,
price number
);

create sequence category_id
start with 4000
increment by 1;

create table categories(
category_id number primary key,
category_name varchar2(15) not null,
description varchar2(15) not null
);

drop table customers;
drop table employees;
drop table shippers;
drop table orders;
drop table order_details;
drop table suppliers;
drop table products;
drop table categories;

