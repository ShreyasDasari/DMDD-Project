-- create view of Product page details
CREATE OR REPLACE VIEW Product_Page_Details AS
SELECT PRODUCT_NAME, CATEGORIES, INVENTORY
FROM PRODUCT;
SELECT * FROM Product_Page_Details;

-- create view of product supplier details
CREATE OR REPLACE VIEW Product_Supplier_Details AS
SELECT S.SUPPLIER_ID, PROD_ID, SUP_NAME, SUP_ADDRESS, SUP_CITY, SUP_STATE, sUP_CODE, PRODUCT_NAME
FROM SUPPLIER S
left JOIN PRODUCT P
ON S. SUPPLIER_ID= P.SUPPLIER_ID;
select * from Product_Supplier_Details;


-- create view of Inventory status
CREATE OR REPLACE VIEW Inventory_Status AS
SELECT PROD_ID, PRODUCT_NAME, 'IN STOCK' AS STATUS
FROM PRODUCT
WHERE INVENTORY > 0;
SELECT * FROM Inventory_Status;

-- create view of Payment_Shippment details
CREATE OR REPLACE VIEW PAYMENT_SHIPMENT_DETAILS AS
SELECT PAY.PAYMENT_ID, PAY_METHOD, PAY_DATE, PAY_AMOUNT, SHIP_ADDRESS
FROM PAYMENT PAY
INNER JOIN ORDERS OD
ON PAY.PAYMENT_ID = OD.PAYMENT_ID
INNER JOIN SHIPPMENT SHIP
ON OD.SHIP_ID = SHIP.SHIP_ID;
SELECT * FROM PAYMENT_SHIPMENT_DETAILS;


-- create view of Total number sales of product
CREATE OR REPLACE VIEW TotalNum_Sales_Product AS
SELECT ORDER_ID, SUM(PAY_AMOUNT) TOTAL_SALES
FROM PAYMENT P
INNER JOIN ORDERS O
ON P.PAYMENT_ID = O.PAYMENT_ID
GROUP BY O.ORDER_ID;
SELECT * FROM TotalNum_Sales_Product;