DROP DATABASE IF EXISTS ProjectDatabase;
CREATE DATABASE ProjectDatabase;

USE ProjectDatabase;

DROP TABLE IF EXISTS CUSTOMERS;
CREATE TABLE CUSTOMERS (
  fname         varchar(25) ,
  lname         varchar(25) ,
  id_line       char(15) not null,
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
  CONSTRAINT pk_ordering_id primary key (order_id),
  CONSTRAINT fk_ocid foreign key (ocid) references CUSTOMERS(c_id),
  CONSTRAINT fk_opid foreign key (opid) references PATTERNS(p_id)
);

DROP TABLE IF EXISTS EMPLOYEE;
CREATE TABLE EMPLOYEE (
  eid           char(8) not null,
  empname       varchar(25) not null,
  empphone      char(10) not null,
  CONSTRAINT pk_eid primary key (eid),
  CONSTRAINT empphone UNIQUE (empphone)
);

DROP TABLE IF EXISTS ORDERING;
CREATE TABLE ORDERING (
  order_cid        char(8) not null,
  ordering_id      char(10) not null,   
  CONSTRAINT pk_order_cid_ordering_id primary key (order_cid,ordering_id),
  CONSTRAINT fk_order_cid foreign key (order_cid) references CUSTOMERS(c_id),
  CONSTRAINT fk_ordering_id foreign key (ordering_id) references ORDERS(order_id)
);

DROP TABLE IF EXISTS CUSTOMERS_ADDRESS;
CREATE TABLE CUSTOMERS_ADDRESS (
  cid_c_address        char(8) not null,
  customers_address      varchar(64) not null,   
  CONSTRAINT pk_cid_address primary key (cid_c_address),
  CONSTRAINT fk_cid_c_address foreign key (cid_c_address) references CUSTOMERS(c_id)
);

DROP TABLE IF EXISTS BELONG_TO;
CREATE TABLE BELONG_TO (
  bcolor      varchar(10) not null,  
  border_id      char(10) not null,   
  CONSTRAINT pk_bcolor_border_id primary key (bcolor,border_id),
  CONSTRAINT fk_bcolor foreign key (bcolor) references STOCK(color),
  CONSTRAINT fk_border_id foreign key (border_id) references ORDERS(order_id)
);

DROP TABLE IF EXISTS ORDERS_SIZE;
CREATE TABLE ORDERS_SIZE (
  size               varchar(5) not null,  
  order_id_size      char(10) not null,   
  CONSTRAINT pk_order_id_size primary key (order_id_size),
  CONSTRAINT fk_order_id_size foreign key (order_id_size) references ORDERS(order_id)
);

DROP TABLE IF EXISTS DEPENDS_ON;
CREATE TABLE DEPENDS_ON (
  pid_depends           char(5) not null, 
  order_id_depends      char(10) not null,   
  CONSTRAINT pk_pid_depends_order_id_depends primary key (pid_depends,order_id_depends),
  CONSTRAINT fk_order_id_depends foreign key (order_id_depends) references ORDERS(order_id),
  CONSTRAINT fk_pid_depends foreign key (pid_depends) references PATTERNS(p_id)
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


INSERT INTO ORDERS VALUE ('00000001',50,'p0001','T-shirt','1976-04-05','1976-04-10','1000000001');
INSERT INTO ORDERS VALUE ('00000002',20,'p0002','Short-sleeved shirt','1976-04-11','1976-04-16','1000000002');
INSERT INTO ORDERS VALUE ('00000003',41,'p0003','T-shirt','1976-04-05','1976-04-20','1000000003');
INSERT INTO ORDERS VALUE ('00000004',25,'p0004','Short-sleeved shirt','1976-04-26','1976-04-29','1000000004');
INSERT INTO ORDERS VALUE ('00000005',32,'p0005','T-shirt','1976-04-30','1976-05-6','1000000005');
INSERT INTO ORDERS VALUE ('00000005',10,'p0005','Short-sleeved shirt','1976-04-26','1976-04-29','1000000006');

INSERT INTO  ORDERS_SIZE VALUE  ('SS', '1000000001');
INSERT INTO  ORDERS_SIZE VALUE  ('M', '1000000002');
INSERT INTO  ORDERS_SIZE VALUE  ('L', '1000000003');
INSERT INTO  ORDERS_SIZE VALUE  ('XXXL', '1000000004');
INSERT INTO  ORDERS_SIZE VALUE  ('XXL', '1000000005');

INSERT INTO DEPENDS_ON VALUE ('p0001', '1000000001');
INSERT INTO DEPENDS_ON VALUE ('p0002', '1000000001');
INSERT INTO DEPENDS_ON VALUE ('p0003', '1000000002');
INSERT INTO DEPENDS_ON VALUE ('p0003', '1000000006');
INSERT INTO DEPENDS_ON VALUE ('p0004', '1000000004');
INSERT INTO DEPENDS_ON VALUE ('p0005', '1000000003');
INSERT INTO DEPENDS_ON VALUE ('p0005', '1000000005');


INSERT INTO EMPLOYEE VALUE ('E0000001', 'Methus Srisai', '0957094125');
INSERT INTO EMPLOYEE VALUE ('E0000002', 'Ratthanan Kitirat', '0655569868');
INSERT INTO EMPLOYEE VALUE ('E0000003', 'Natdanai Deelert', '0815512146');
INSERT INTO EMPLOYEE VALUE ('E0000004', 'Narawich Insamian', '0855599975');

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
