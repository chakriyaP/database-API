DROP DATABASE IF EXISTS ProjectDatabase;
CREATE DATABASE ProjectDatabase;

USE ProjectDatabase;

DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS (
  fname         varchar(25) ,
  lname         varchar(25) ,
  id_line       varchar(15) not null,
  c_id          char(8) not null, 
  phone         char(10) not null,
  CONSTRAINT pk_c_id primary key (c_id),
  CONSTRAINT uk_id_line UNIQUE (id_line), 
  CONSTRAINT uk_phone UNIQUE (phone)
);

DROP TABLE IF EXISTS PATTERNS;
CREATE TABLE PATTERNS (
  p_id          char(5) not null, 
  amount_use    int not null,
  CONSTRAINT pk_p_id primary key (p_id)
);

DROP TABLE IF EXISTS STOCK;
CREATE TABLE STOCK (
  color         varchar(10) not null,
  amount_stock  int not null,  
  CONSTRAINT pk_stype_color primary key (color)
);

DROP TABLE IF EXISTS ORDERS;
CREATE TABLE ORDERS (
  ocid          char(8) not null,
  order_amount  int not null,  
  opid          char(5) not null,
  s_type         varchar(20) not null,
  o_end_date      DATE,
  o_start_date   DATE,
  order_id      char(10) not null,
  ocolor      varchar(10) not null,
  size          varchar(5) not null,
  CONSTRAINT pk_ordering_id primary key (order_id),
  CONSTRAINT fk_ocid foreign key (ocid) references CUSTOMERS(c_id),
  CONSTRAINT fk_opid foreign key (opid) references PATTERNS(p_id),
  CONSTRAINT fk_bcolor foreign key (ocolor) references STOCK(color)
);


DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
  eid           char(8) not null,
  empname       varchar(25) not null,
  empphone      char(10) not null,
  CONSTRAINT pk_eid primary key (eid),
  CONSTRAINT empphone UNIQUE (empphone)
);

DROP TABLE IF EXISTS CUSTOMERS_ADDRESS;
CREATE TABLE CUSTOMERS_ADDRESS (
  cid_c_address        char(8) not null,
  customers_address      varchar(64) not null,   
  CONSTRAINT pk_cid_address primary key (cid_c_address,customers_address),
  CONSTRAINT fk_cid_c_address foreign key (cid_c_address) references CUSTOMERS(c_id)
);

DROP TABLE IF EXISTS WORKS_ON;
CREATE TABLE WORKS_ON (
  emp_id_work_on          char(8) not null, 
  order_id_work_on      char(10) not null,  
  works_hours           decimal(5,2) not null, 
  CONSTRAINT pk_emp_id_work_on_order_id_work_on primary key (emp_id_work_on,order_id_work_on),
  CONSTRAINT fk_order_id_work_on foreign key (order_id_work_on) references ORDERS(order_id),
  CONSTRAINT fk_emp_id_work_on foreign key (emp_id_work_on) references EMPLOYEE(eid) 
);

INSERT INTO CUSTOMERS VALUE ('Surasak', 'Inhorm', 'surasak', '00000001', '0655514837');
INSERT INTO CUSTOMERS VALUE ('Kantarakorn', 'Suebsoda', 'kun05', '00000002', '0855564242');
INSERT INTO CUSTOMERS VALUE ('Sunee', 'Boonrod', 'sunee_1', '00000003', '0990982780');
INSERT INTO CUSTOMERS VALUE ('Wantida', 'Wongsutthipong', 'wantida', '00000004', '0855566714');
INSERT INTO CUSTOMERS VALUE ('Pakin', 'Boonpeng', 'tomato_52', '00000005', '0955585597');
INSERT INTO CUSTOMERS VALUE ('Pattarathida', 'Chayakornnan', 'namtttoey', '00000006', '0833392288');
INSERT INTO CUSTOMERS VALUE ('Chuan', 'Seehanam', 'chun06', '00000007', '0872163489');

INSERT INTO PATTERNS VALUE ('p0001', 50);
INSERT INTO PATTERNS VALUE ('p0002', 20);
INSERT INTO PATTERNS VALUE ('p0003', 41);  
INSERT INTO PATTERNS VALUE ('p0004', 25);
INSERT INTO PATTERNS VALUE ('p0005', 42);

INSERT INTO STOCK VALUE ('Purple', 100);
INSERT INTO STOCK VALUE ('Blue', 95);
INSERT INTO STOCK VALUE ('Cyan', 82);
INSERT INTO STOCK VALUE ('Green', 94);
INSERT INTO STOCK VALUE ('Yellow', 60);
INSERT INTO STOCK VALUE ('Orange', 78);
INSERT INTO STOCK VALUE ('Red', 45);
INSERT INTO STOCK VALUE ('Pink', 56);
INSERT INTO STOCK VALUE ('White', 80);
INSERT INTO STOCK VALUE ('Black', 20);
INSERT INTO STOCK VALUE ('Gray', 35);
INSERT INTO STOCK VALUE ('Magenta', 98);


INSERT INTO ORDERS VALUE ('00000001',50,'p0001','T-shirt','2020-05-10','2020-05-7','1000000001','Orange','S');
INSERT INTO ORDERS VALUE ('00000002',20,'p0002','Short-sleeved shirt','2020-10-15','2020-10-11','1000000002','Magenta','M');
INSERT INTO ORDERS VALUE ('00000003',41,'p0003','T-shirt','2020-10-17','2020-10-12','1000000003','Green','L');
INSERT INTO ORDERS VALUE ('00000004',25,'p0004','Short-sleeved shirt','2020-10-20','2020-10-15','1000000004','Gray','XXXL');
INSERT INTO ORDERS VALUE ('00000005',32,'p0005','T-shirt','2020-11-05','2020-11-1','1000000005','Black','XXL');
INSERT INTO ORDERS VALUE ('00000005',10,'p0004','Short-sleeved shirt','2020-11-07','2020-11-04','1000000006','Pink','M');
INSERT INTO ORDERS VALUE ('00000006',10,'p0002','T-shirt','2020-11-10','2020-11-07','1000000007','Black','S');
INSERT INTO ORDERS VALUE ('00000007',10,'p0002','T-shirt','2020-11-15','2020-11-10','1000000008','Yellow','M');

INSERT INTO EMPLOYEE VALUE ('E0000001', 'Methus Srisai', '0957094125');
INSERT INTO EMPLOYEE VALUE ('E0000002', 'Ratthanan Kitirat', '0655569868');
INSERT INTO EMPLOYEE VALUE ('E0000003', 'Natdanai Deelert', '0815512146');
INSERT INTO EMPLOYEE VALUE ('E0000004', 'Narawich Insamian', '0855599975');

INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000001', 'Khon Kaen');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000002', 'Khon Kaen');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000003', 'Bangkok');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000004', 'Chiang Mai');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000005', 'Nonthaburi');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000006', 'Khon Kaen');
INSERT INTO CUSTOMERS_ADDRESS VALUE ('00000007', 'Khon Kaen');



INSERT INTO WORKS_ON VALUE ('E0000003', '1000000001', 2.12);
INSERT INTO WORKS_ON VALUE ('E0000004', '1000000001', 4.34);
INSERT INTO WORKS_ON VALUE ('E0000001', '1000000002', 5.13);
INSERT INTO WORKS_ON VALUE ('E0000002', '1000000002', 4.20);
INSERT INTO WORKS_ON VALUE ('E0000002', '1000000003', 7.62);
INSERT INTO WORKS_ON VALUE ('E0000004', '1000000003', 10.12);
INSERT INTO WORKS_ON VALUE ('E0000001', '1000000003', 9.50);
INSERT INTO WORKS_ON VALUE ('E0000003', '1000000004', 3.78);
INSERT INTO WORKS_ON VALUE ('E0000002', '1000000005', 6.23);
INSERT INTO WORKS_ON VALUE ('E0000001', '1000000005', 5.40);
INSERT INTO WORKS_ON VALUE ('E0000004', '1000000006', 11.20);
INSERT INTO WORKS_ON VALUE ('E0000003', '1000000006', 13.47);
INSERT INTO WORKS_ON VALUE ('E0000002', '1000000006', 9.24);


CREATE VIEW customers1
AS SELECT c_id, fname, lname, customers_address, phone, id_line
FROM customers, customers_address 
WHERE c_id = cid_c_address;

CREATE VIEW orders_1
AS SELECT order_id,ocid,order_amount,size,ocolor,opid,o_start_date,o_end_date,s_type
FROM orders;


INSERT INTO ORDERS VALUE ('00000001',30,'p0001','T-shirt','2020-05-10','2020-05-7','1000000009','Gray','XL');


INSERT INTO ORDERS VALUE ('00000002',30,'p0001','T-shirt','2020-05-10','2020-05-7','1000000010','Pink','L');


