DROP TABLE PROJECT3.ORDERPROD;

DROP TABLE PROJECT3.ORDERS;

DROP TABLE PROJECT3.SHIPMENT;

DROP TABLE PROJECT3.PAYMENT;

DROP TABLE PROJECT3.PRODUCT;

DROP TABLE PROJECT3.SUPPLIER;

DROP TABLE PROJECT3.LISTS;

DROP TABLE PROJECT3.CUSTPAGE;

DROP TABLE PROJECT3.WEBPAGE;

DROP TABLE PROJECT3.CUSTOMER;

-- Create CUSTOMER Table
CREATE TABLE CUSTOMER (
    CUST_ID NUMBER,
    FNAME VARCHAR(30)
         CONSTRAINT FNAME_NOT_NULL NOT NULL,
    LNAME VARCHAR(30)
        CONSTRAINT LNAME_NOT_NULL NOT NULL,
    GENDER VARCHAR(20),
    EMAIL VARCHAR(50),
    PHONE VARCHAR(30),
    DOB DATE,
    ADDRESS VARCHAR(50),
    CITY VARCHAR(30),
    STATE VARCHAR(30),
    ZIPCODE VARCHAR(20),
    CONSTRAINT CUSTOMER_PK PRIMARY KEY (CUST_ID)
    );

-- Create LISTS Table
CREATE TABLE LISTS (
    LIST_ID NUMBER,
    CUST_ID CONSTRAINT FOR_KEY_CUST_ID
        REFERENCES CUSTOMER(CUST_ID),
    CONSTRAINT LISTS_PK PRIMARY KEY (LIST_ID)
    );

-- Create WEBPAGE Table
CREATE TABLE WEBPAGE (
    PAGE_ID NUMBER,
    CUST_ID CONSTRAINT FOREIGN_KEY_CUST_ID
    REFERENCES CUSTOMER (CUST_ID),
    VIEWDATE DATE 
    CONSTRAINT VIEWDATE_NOT_NULL NOT NULL,
    CONSTRAINT WEBPAGE_PK PRIMARY KEY (PAGE_ID)
    );

-- Create CUSTPAGE Table    
CREATE TABLE CUSTPAGE (
    CUSTPAGE_ID VARCHAR(20),
    CUST_ID CONSTRAINT FORRIGNKEY_CUST_ID
    REFERENCES CUSTOMER(CUST_ID),
    PAGE_ID CONSTRAINT FOR_KEY_PAGE_ID
    REFERENCES WEBPAGE(PAGE_ID),
    CONSTRAINT CUSTPAGE_PK PRIMARY KEY (CUSTPAGE_ID)
    );

-- Create SUPPLIER Table   
CREATE TABLE SUPPLIER (
    SUPPLIER_ID VARCHAR(20),
    SUP_NAME VARCHAR(30)
        CONSTRAINT SUP_NAME_NOT_NULL NOT NULL,
    SUP_ADDRESS VARCHAR(50),
    SUP_CITY VARCHAR(30),
    SUP_STATE VARCHAR(30),
    SUP_CODE VARCHAR(20),
    CONSTRAINT SUPPLIER_PK PRIMARY KEY (SUPPLIER_ID)
    );

-- Create PRODUCT Table
CREATE TABLE PRODUCT (
    PROD_ID VARCHAR(30),
    SUPPLIER_ID CONSTRAINT FOR_KEY_SUPPLIER_ID
        REFERENCES SUPPLIER (SUPPLIER_ID),
    PRODUCT_NAME VARCHAR(50)
        CONSTRAINT PRODUCT_NAME_NOT_NULL NOT NULL,
    CATEGORIES VARCHAR(30),
    PRICE NUMBER,
    INVENTORY NUMBER
         CONSTRAINT INVENTORY_NOT_NULL NOT NULL,
    CONSTRAINT PRODUCT_PK PRIMARY KEY (PROD_ID)
    );   
 
-- Create PAYMENT Table    
CREATE TABLE PAYMENT (
    PAYMENT_ID VARCHAR(30),
    CUST_ID CONSTRAINT FOREIGNKEY_CUST_ID
        REFERENCES CUSTOMER (CUST_ID),
    PAY_METHOD VARCHAR(30)
        CONSTRAINT PAY_METHOD_NOT_NULL NOT NULL,
    PAY_DATE DATE
        CONSTRAINT PAY_DATE_NOT_NULL NOT NULL,
    PAY_AMOUNT NUMBER
        CONSTRAINT PAY_AMOUNT_NOT_NULL NOT NULL,
    CONSTRAINT PAYMENT_PK PRIMARY KEY (PAYMENT_ID)
    );

-- Create SHIPMENT Table   
CREATE TABLE SHIPMENT (
    SHIP_ID VARCHAR(30),
    CARRIER_NAME VARCHAR(30)
        CONSTRAINT CARRIER_NAME_NOT_NULL NOT NULL,
    WEIGHT NUMBER
        CONSTRAINT WEIGHT_NOT_NULL NOT NULL,
    SHIP_ADDRESS VARCHAR(50)
        CONSTRAINT SHIP_ADDRESS_NOT_NULL NOT NULL,
    CONSTRAINT SHIPPMENT_PK PRIMARY KEY (SHIP_ID)
    );

-- Create ORDERS Table    
CREATE TABLE ORDERS (
    ORDER_ID VARCHAR(30),
    CUST_ID CONSTRAINT FK_CUST_ID
        REFERENCES CUSTOMER (CUST_ID),
    PAYMENT_ID CONSTRAINT FOR_KEY_PAYMENT_ID
        REFERENCES PAYMENT (PAYMENT_ID),
    SHIP_ID CONSTRAINT FOR_KEY_SHIP_ID
        REFERENCES SHIPMENT (SHIP_ID),
    CONSTRAINT ORDERS_PK PRIMARY KEY (ORDER_ID)
    );

-- Create ORDERPROD Table    
CREATE TABLE ORDERPROD (
    ORDERPROD_ID VARCHAR(30),
    ORDER_ID CONSTRAINT FOR_KEY_ORDER_ID
        REFERENCES ORDERS (ORDER_ID),
    PROD_ID CONSTRAINT FOREIGN_KEY_PROD_ID
        REFERENCES PRODUCT (PROD_ID),
    CONSTRAINT ORDERPROD_PK PRIMARY KEY (ORDERPROD_ID)
