-- CREATING INDEX

-- CREATE INDEX ON CUSTOMER
create index index_customer on customer(
    CUST_ID,
    FNAME,
    LNAME,
    GENDER,
    EMAIL,
    PHONE,
    DOB,
    ADDRESS,
    CITY,
    STATE,
    ZIPCODE
);

-- CREATE INDEX ON CUSTPAGE
create index index_custpage on custpage(
    CUSTPAGE_ID,
    CUST_ID,
    PAGE_ID
);

--CREATE INDEX ON LISTS
create index index_lists on lists(
    LIST_ID,
    CUST_ID
);

--CREATE INDEX ON ORDERPROD
create index index_orderprod on orderprod(
    ORDERPROD_ID,
    ORDER_ID,
    PROD_ID
);

--CREATE INDEX ON ORDERS
create index index_orders on orders(
    ORDER_ID,
    CUST_ID,
    PAYMENT_ID,
    SHIP_ID
);

--CREATE INDEX ON PAYMENT
create index index_payment on payment(
    PAYMENT_ID,
    CUST_ID,
    PAY_METHOD,
    PAY_DATE,
    PAY_AMOUNT
);

--CREATE INDEX ON PRODUCT
create index index_product on product(
    PROD_ID,
    SUPPLIER_ID,
    PRODUCT_NAME,
    CATEGORIES,
    PRICE,
    INVENTORY
);

--CREATE INDEX ON SHIPPMENT
create index index_shippment on shippment(
    SHIP_ID,
    CARRIER_NAME,
    WEIGHT,
    SHIP_ADDRESS
);

--CREATE INDEX ON SUPPLIER
create index index_supplier on supplier(
    SUPPLIER_ID,
    SUP_NAME,
    SUP_ADDRESS,
    SUP_CITY,
    SUP_STATE,
    SUP_CODE
);

--CREATE INDEX ON WEBPAGE
create index index_webpage on webpage(
    PAGE_ID,
    CUST_ID,
    VIEWDATE
);
    
    
