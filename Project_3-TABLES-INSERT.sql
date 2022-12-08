DROP TABLE PROJECT3.ORDERPROD;

DROP TABLE PROJECT3.ORDERS;

DROP TABLE PROJECT3.SHIPPMENT;

DROP TABLE PROJECT3.PAYMENT;

DROP TABLE PROJECT3.PRODUCT;

DROP TABLE PROJECT3.SUPPLIER;

DROP TABLE PROJECT3.LISTS;

DROP TABLE PROJECT3.CUSTPAGE;

DROP TABLE PROJECT3.WEBPAGE;

DROP TABLE PROJECT3.CUSTOMER;

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

CREATE TABLE LISTS (
    LIST_ID NUMBER,
    CUST_ID CONSTRAINT FOR_KEY_CUST_ID
        REFERENCES CUSTOMER(CUST_ID),
    CONSTRAINT LISTS_PK PRIMARY KEY (LIST_ID)
    );

CREATE TABLE WEBPAGE (
    PAGE_ID NUMBER,
    CUST_ID CONSTRAINT FOREIGN_KEY_CUST_ID
    REFERENCES CUSTOMER (CUST_ID),
    VIEWDATE DATE 
    CONSTRAINT VIEWDATE_NOT_NULL NOT NULL,
    CONSTRAINT WEBPAGE_PK PRIMARY KEY (PAGE_ID)
    );
    
CREATE TABLE CUSTPAGE (
    CUSTPAGE_ID VARCHAR(20),
    CUST_ID CONSTRAINT FORRIGNKEY_CUST_ID
    REFERENCES CUSTOMER(CUST_ID),
    PAGE_ID CONSTRAINT FOR_KEY_PAGE_ID
    REFERENCES WEBPAGE(PAGE_ID),
    CONSTRAINT CUSTPAGE_PK PRIMARY KEY (CUSTPAGE_ID)
    );
   
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

CREATE TABLE PRODUCT (
    PROD_ID VARCHAR(30),
    SUPPLIER_ID CONSTRAINT FOR_KEY_SUPPLIER_ID
        REFERENCES SUPPLIER (SUPPLIER_ID),
    PRODUCT_NAME VARCHAR(50)
        CONSTRAINT PRODUCT_NAME_NOT_NULL NOT NULL,
    CATEGORIES VARCHAR(30),
    PRICE NUMBER(10,2),
    INVENTORY NUMBER
         CONSTRAINT INVENTORY_NOT_NULL NOT NULL,
    CONSTRAINT PRODUCT_PK PRIMARY KEY (PROD_ID)
    );    
    
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
    
CREATE TABLE SHIPPMENT (
    SHIP_ID VARCHAR(30),
    CARRIER_NAME VARCHAR(30)
        CONSTRAINT CARRIER_NAME_NOT_NULL NOT NULL,
    WEIGHT NUMBER
        CONSTRAINT WEIGHT_NOT_NULL NOT NULL,
    SHIP_ADDRESS VARCHAR(50)
        CONSTRAINT SHIP_ADDRESS_NOT_NULL NOT NULL,
    CONSTRAINT SHIPPMENT_PK PRIMARY KEY (SHIP_ID)
    );
    
CREATE TABLE ORDERS (
    ORDER_ID VARCHAR(30),
    CUST_ID CONSTRAINT FK_CUST_ID
        REFERENCES CUSTOMER (CUST_ID),
    PAYMENT_ID CONSTRAINT FOR_KEY_PAYMENT_ID
        REFERENCES PAYMENT (PAYMENT_ID),
    SHIP_ID CONSTRAINT FOR_KEY_SHIP_ID
        REFERENCES SHIPPMENT (SHIP_ID),
    CONSTRAINT ORDERS_PK PRIMARY KEY (ORDER_ID)
    );
    
CREATE TABLE ORDERPROD (
    ORDERPROD_ID VARCHAR(30),
    ORDER_ID CONSTRAINT FOR_KEY_ORDER_ID
        REFERENCES ORDERS (ORDER_ID),
    PROD_ID CONSTRAINT FOREIGN_KEY_PROD_ID
        REFERENCES PRODUCT (PROD_ID),
    CONSTRAINT ORDERPROD_PK PRIMARY KEY (ORDERPROD_ID)
    );
--select * from project3.customer;
--select * from project3.custpage;
--select * from project3.lists;
--select * from project3.orderprod;
--select * from project3.orders;
--select * from project3.payment;
--select * from project3.product;
--select * from project3.shippment;
--select * from project3.supplier;
--select * from project3.webpage;
--select * from all_tables where owner = 'PROJECT_3';

--DESCRIBE PROJECT3.CUSTOMER;

--alter table product add supplier_id constraint for_key_supplier_id REFERENCES supplier(supplier_id);
--alter table supplier add prod_id constraint for_key_prod_id references product(prod_id);
--alter table supplier drop column prod_id;


-- INSERING VALUES INTO CUSTOMER
insert into customer values('106832','Ashley','Green','F','iamagreen@gmail.com','487-934-5606','22-May-1998','12 North Church Avenue','Salt Lake City','UT','84112');
insert into customer values('104834','Terry','Lopez','M','tlopez4real@gamil.com','598-378-4933','22-Apr-1992','128 James Road','Fairfax','VA','22030');
insert into customer values('107669','Madison','Clark','F','madiclark@outlook.com','475-494-3761','5-Aug-1977','199 Christina Dr.','Griffin','GA','30223');
insert into customer values('103854','Jeremy','Allen','M','jallen93@gamil.com','293-645-6492','28-Jun-1993','199 Zebulon Rd.','Hoover','AL','35244');
insert into customer values('109433','Janice','White','F','jcwhite12@gamil.com','383-284-8133','23-Dec-1985','113 Rock Valley Rd.','Evansville','IN','47720');
insert into customer values('107836','Sophia','Lewis','F','slewis677@gamil.com','576-609-4882','24-Feb-1999','412 S Missour Ave.','Jackson','MO','63755');
insert into customer values('106693','Bruce','Hill','M','1986bhill@gamil.com','749-353-1884','2-Feb-1986','950 kimbel Woods Drive','Waco','TX','76708');
insert into customer values('103827','Brittany','Jordan','F','bjordan123@gamil.com','379-457-2294','1-Mar-1989','900 Lake Shore Dr.','New River','AZ','85087');
insert into customer values('108784','Alice','Martell','F','amartell93@gamil.com','275-374-5996','1-Mar-1993','12883 N Kelly Dr.','Eugene','OR','97404');
insert into customer values('107963','Edward','Wilson','M','edwilson93@gmail.com','598-379-4993','17-Dec-1993','1253 Canton Drive','Newark','NJ','8712');
insert into customer values('103238','Debra','Taylor','F','dtaylor9629@gmail.com','617-534-6799','9-Feb-1996','366 Park Road','Watertwon','MA','2376');
insert into customer values('105329','Amanda','Baker','F','amanda2014@outlook.com','305-647-3487','23-Nov-1985','476 S Stone Ave.','Austin','TX','78744');
insert into customer values('105798','Jeffery','Phillips','M','jeffPhillips@gamil.com','546-348-3544','6-Jan-1992','195 Forest Road','Tampa','FL','33609');
insert into customer values('109682','Ruth','Bennet','F','rbennet123@gamil.com','742-695-3895','15-Sep-1989','266 Church Rd','Queens','NY','11355');
insert into customer values('105870','Jonathan','Wood','M','thisisJwood@gamil.com','437-295-3577','20-Aug-1982','693 Main Street','Pittsburgh','PA','15212');
insert into customer values('107496','Benjamin','Foster','M','benfoster124@gamil.com','852-349-5832','27-Jan-1995','1284 Chesnut Rd.','Willmington','DE','19153');
insert into customer values('109435','Dennis','Ross','M','dross1992@gamil.com','317-538-6544','25-Jul-1992','293 Waterfall St.','College Park','MD','20742');
insert into customer values('108435','Katherine','Thomas','F','kathythomas@outlook.com','753-569-6647','13-Jun-1988','283 Walnut Street','Seattle','WA','98158');
insert into customer values('102366','Bryan','Robinson','M','brobinson123@outlook.com','495-397-8453','29-Jun-1982','1555 Monterey Avenue','Winston','OR','97496');
insert into customer values('102193','Ethan','Campbell','M','itsecampbell3@gmail.com','239-493-5587','23-Jul-1994','3681 Loustalot Way','Anderson','CA','96007');
insert into customer values('109843','Dylan','Cruz','M','dcruz2009@gmail.com','362-485-3832','3-Aug-1984','50 W lake Mendocino Dr.','Ukiah','CA','95482');
insert into customer values('105863','Megan','Parker','F','mparker86@gmail.com','923-384-4336','26-Mar-1986','1272 Meiele Avenue','New York','NY','10003');
insert into customer values('103742','Scott','Rogers','M','123srogers@gmail.com','384-379-4866','6-May-1999','1292 Melrose Ave.','Boston','MA','2107');
insert into customer values('104832','Victoria','Peterson','F','vickypeterson@outlook.com','285-384-1833','26-Nov-1998','3901 City Drive','Philadelphia','PA','19133');
insert into customer values('102933','Natalie','Sanders','F','nsanders0709@gmail.com','594-385-9558','7-Sep-1975','607 Hunter Street','Manchester','NH','3103');
insert into customer values('108475','Russell','Morris','M','russmorris87@gmail.com','285-934-8495','15-Jan-1987','131 Kent Drive','Candor','NC','27229');
insert into customer values('108923','Jacqueline','Howard','F','jachowar2017@gmail.com','904-382-4382','18-Jun-1983','2873 Hancock Street','Newton','MA','2459');
insert into customer values('107936','Noah','Mendoza','M','noahmendoza123@outlook.com','918-823-3884','26-Jul-1992','23421 EL TORO Rd.','Irvine','CA','92606');
insert into customer values('108745','Hannah','Myers','F','hmyers1995@gmail.com','823-389-3228','3-Aug-1995','1334 Long Pine River Avenue','Las Vegas','NV','89109');
insert into customer values('103892','Wayne','Brooks','M','wbrooks87@gmail.com','302-823-4483','19-Oct-1987','1823 Froest Lake Way','Rockford','IL','61108');

-- INSERTING VALUES INTO LISTS
insert into lists values('102328825','104834');
insert into lists values('102328826','107669');
insert into lists values('102328827','103854');
insert into lists values('102328828','109433');
insert into lists values('102328829','107836');
insert into lists values('102328830','106693');
insert into lists values('102328831','103827');
insert into lists values('102328832','108784');
insert into lists values('102328833','107963');
insert into lists values('102328834','103238');
insert into lists values('102328835','105329');
insert into lists values('102328836','105798');
insert into lists values('102328837','109682');
insert into lists values('102328838','105870');
insert into lists values('102328839','107496');
insert into lists values('102328840','109435');
insert into lists values('102328841','108435');
insert into lists values('102328842','102366');
insert into lists values('102328843','102193');
insert into lists values('102328844','109843');
insert into lists values('102328845','105863');
insert into lists values('102328846','103742');
insert into lists values('102328847','104832');
insert into lists values('102328848','102933');
insert into lists values('102328849','108475');
insert into lists values('102328850','108923');
insert into lists values('102328851','107936');
insert into lists values('102328852','108745');
insert into lists values('102328853','103892');

-- INSERTING VALUES INTO WEBPAGE
insert into webpage values('1200','106832','19-MAR-2022 12:00:00');
insert into webpage values('1201','104834','23-AUG-2022 12:00:00');
insert into webpage values('1202','107669','15-OCT-2022 12:00:00');
insert into webpage values('1203','103854','08-JUL-2022 12:00:00');
insert into webpage values('1204','109433','25-FEB-2022 12:00:00');
insert into webpage values('1205','107836','19-JAN-2022 12:00:00');
insert into webpage values('1206','106693','21-FEB-2022 12:00:00');
insert into webpage values('1207','103827','20-MAY-2022 12:00:00');
insert into webpage values('1208','108784','10-AUG-2022 12:00:00');
insert into webpage values('1209','107963','04-MAR-2022 12:00:00');
insert into webpage values('1210','103238','06-NOV-2022 12:00:00');
insert into webpage values('1211','105329','11-NOV-2022 12:00:00');
insert into webpage values('1212','105798','18-APR-2022 12:00:00');
insert into webpage values('1213','109682','28-SEP-2022 12:00:00');
insert into webpage values('1214','105870','30-OCT-2022 12:00:00');
insert into webpage values('1215','107496','17-FEB-2022 12:00:00');
insert into webpage values('1216','109435','05-APR-2022 12:00:00');
insert into webpage values('1217','108435','22-AUG-2022 12:00:00');
insert into webpage values('1218','102366','05-AUG-2022 12:00:00');
insert into webpage values('1219','102193','07-MAR-2022 12:00:00');
insert into webpage values('1220','109843','28-JUL-2022 12:00:00');
insert into webpage values('1221','105863','24-AUG-2022 12:00:00');
insert into webpage values('1222','103742','17-OCT-2022 12:00:00');
insert into webpage values('1223','104832','14-AUG-2022 12:00:00');
insert into webpage values('1224','102933','05-OCT-2022 12:00:00');
insert into webpage values('1225','108475','21-MAR-2022 12:00:00');
insert into webpage values('1226','108923','21-JUN-2022 12:00:00');
insert into webpage values('1227','107936','17-FEB-2022 12:00:00');
insert into webpage values('1228','108745','09-JAN-2022 12:00:00');
insert into webpage values('1229','103892','13-NOV-2022 12:00:00');
insert into webpage values('1230','106832','09-NOV-2022 12:00:00');
insert into webpage values('1231','104834','27-MAY-2022 12:00:00');
insert into webpage values('1232','107669','14-MAY-2022 12:00:00');
insert into webpage values('1233','106693','23-MAY-2022 12:00:00');
insert into webpage values('1234','103827','18-JUL-2022 12:00:00');
insert into webpage values('1235','108784','01-FEB-2022 12:00:00');
insert into webpage values('1236','107963','13-NOV-2022 12:00:00');
insert into webpage values('1237','105329','01-FEB-2022 12:00:00');
insert into webpage values('1238','105798','09-AUG-2022 12:00:00');
insert into webpage values('1239','109682','20-FEB-2022 12:00:00');
insert into webpage values('1240','105870','26-SEP-2022 12:00:00');
insert into webpage values('1241','107496','23-JUN-2022 12:00:00');
insert into webpage values('1242','107496','11-OCT-2022 12:00:00');
insert into webpage values('1243','109435','11-NOV-2022 12:00:00');
insert into webpage values('1244','108435','02-JAN-2022 12:00:00');
insert into webpage values('1245','102366','02-SEP-2022 12:00:00');
insert into webpage values('1246','102193','09-SEP-2022 12:00:00');
insert into webpage values('1247','109843','22-OCT-2022 12:00:00');
insert into webpage values('1248','105863','14-MAY-2022 12:00:00');
insert into webpage values('1249','106693','16-FEB-2022 12:00:00');
insert into webpage values('1250','103827','21-MAR-2022 12:00:00');
insert into webpage values('1251','108784','01-SEP-2022 12:00:00');
insert into webpage values('1252','107963','02-JAN-2022 12:00:00');
insert into webpage values('1253','107496','30-MAY-2022 12:00:00');
insert into webpage values('1254','109435','20-JUL-2022 12:00:00');
insert into webpage values('1255','108435','04-SEP-2022 12:00:00');
insert into webpage values('1256','102366','06-AUG-2022 12:00:00');
insert into webpage values('1257','105863','09=MAR-2022 12:00:00');
insert into webpage values('1258','103742','11-NOV-2022 12:00:00');
insert into webpage values('1259','104832','31-OCT-2022 12:00:00');
insert into webpage values('1260','102933','05-JAN-2022 12:00:00');
insert into webpage values('1261','108475','01-APR-2022 12:00:00');
insert into webpage values('1262','108475','25-JAN-2022 12:00:00');
insert into webpage values('1263','108923','11-NOV-2022 12:00:00');
insert into webpage values('1264','107936','11-MAY-2022 12:00:00');
insert into webpage values('1265','108745','04-APR-2022 12:00:00');
insert into webpage values('1266','103892','26-APR-2022 12:00:00');
insert into webpage values('1267','108923','14-JUL-2022 12:00:00');
insert into webpage values('1268','107936','13-JUL-2022 12:00:00');
insert into webpage values('1269','108745','13-AUG-2022 12:00:00');
insert into webpage values('1270','103892','16-OCT-2022 12:00:00');
insert into webpage values('1271','106832','12-JUL-2022 12:00:00');
insert into webpage values('1272','104834','12-OCT-2022 12:00:00');
insert into webpage values('1273','107669','14-MAR-2022 12:00:00');
insert into webpage values('1274','107936','17-JUL-2022 12:00:00');
insert into webpage values('1275','108745','10-APR-2022 12:00:00');
insert into webpage values('1276','103892','08-APR-2022 12:00:00');
insert into webpage values('1277','108923','26-JUL-2022 12:00:00');
insert into webpage values('1278','107936','29-OCT-2022 12:00:00');
insert into webpage values('1279','108745','11-SEP-2022 12:00:00');
insert into webpage values('1280','103742','21-AUG-2022 12:00:00');
insert into webpage values('1281','104832','03-AUG-2022 12:00:00');
insert into webpage values('1282','102933','09-AUG-2022 12:00:00');

-- INSERTING VALUES INTO CUSTPAGE
insert into custpage values('CP001','106832','1200');
insert into custpage values('CP002','104834','1201');
insert into custpage values('CP003','107669','1202');
insert into custpage values('CP004','103854','1203');
insert into custpage values('CP005','109433','1204');
insert into custpage values('CP006','107836','1205');
insert into custpage values('CP007','106693','1206');
insert into custpage values('CP008','103827','1207');
insert into custpage values('CP009','108784','1208');
insert into custpage values('CP010','107963','1209');
insert into custpage values('CP011','103238','1210');
insert into custpage values('CP012','105329','1211');
insert into custpage values('CP013','105798','1212');
insert into custpage values('CP014','109682','1213');
insert into custpage values('CP015','105870','1214');
insert into custpage values('CP016','107496','1215');
insert into custpage values('CP017','109435','1216');
insert into custpage values('CP018','108435','1217');
insert into custpage values('CP019','102366','1218');
insert into custpage values('CP020','102193','1219');
insert into custpage values('CP021','109843','1220');
insert into custpage values('CP022','105863','1221');
insert into custpage values('CP023','103742','1222');
insert into custpage values('CP024','104832','1223');
insert into custpage values('CP025','102933','1224');
insert into custpage values('CP026','108475','1225');
insert into custpage values('CP027','108923','1226');
insert into custpage values('CP028','107936','1227');
insert into custpage values('CP029','108745','1228');
insert into custpage values('CP030','103892','1229');
insert into custpage values('CP031','106832','1230');
insert into custpage values('CP032','104834','1231');
insert into custpage values('CP033','107669','1232');
insert into custpage values('CP034','106693','1233');
insert into custpage values('CP035','103827','1234');
insert into custpage values('CP036','108784','1235');
insert into custpage values('CP037','107963','1236');
insert into custpage values('CP038','105329','1237');
insert into custpage values('CP039','105798','1238');
insert into custpage values('CP040','109682','1239');
insert into custpage values('CP041','105870','1240');
insert into custpage values('CP042','107496','1241');
insert into custpage values('CP043','107496','1242');
insert into custpage values('CP044','109435','1243');
insert into custpage values('CP045','108435','1244');
insert into custpage values('CP046','102366','1245');
insert into custpage values('CP047','102193','1246');
insert into custpage values('CP048','109843','1247');
insert into custpage values('CP049','105863','1248');
insert into custpage values('CP050','106693','1249');
insert into custpage values('CP051','103827','1250');
insert into custpage values('CP052','108784','1251');
insert into custpage values('CP053','107963','1252');
insert into custpage values('CP054','107496','1253');
insert into custpage values('CP055','109435','1254');
insert into custpage values('CP056','108435','1255');
insert into custpage values('CP057','102366','1256');
insert into custpage values('CP058','105863','1257');
insert into custpage values('CP059','103742','1258');
insert into custpage values('CP060','104832','1259');
insert into custpage values('CP061','102933','1260');
insert into custpage values('CP062','108475','1261');
insert into custpage values('CP063','108475','1262');
insert into custpage values('CP064','108923','1263');
insert into custpage values('CP065','107936','1264');
insert into custpage values('CP066','108745','1265');
insert into custpage values('CP067','103892','1266');
insert into custpage values('CP068','108923','1267');
insert into custpage values('CP069','107936','1268');
insert into custpage values('CP070','108745','1269');
insert into custpage values('CP071','103892','1270');
insert into custpage values('CP072','106832','1271');
insert into custpage values('CP073','104834','1272');
insert into custpage values('CP074','107669','1273');
insert into custpage values('CP075','107936','1274');
insert into custpage values('CP076','108745','1275');
insert into custpage values('CP077','103892','1276');
insert into custpage values('CP078','108923','1277');
insert into custpage values('CP079','107936','1278');
insert into custpage values('CP080','108745','1279');
insert into custpage values('CP081','103742','1280');
insert into custpage values('CP082','104832','1281');
insert into custpage values('CP083','102933','1282');

-- INSERT VALUES INTO SUPPLIER
insert into supplier values('S1','Apple','Ap #512-1401 Tincidunt Avenue','Emalahleni','Guanacaste','43457');
insert into supplier values('S2','Samsung','P.O. Box 744, 9295 Imperdiet Av.','Toa Payoh','Idaho','467284');
insert into supplier values('S3','Motorola','Ap #342-5257 Fusce Ave','Erdemli','Balıkesir','6503453');
insert into supplier values('S4','Dell','Ap #339-7207 Sagittis Road','Burg','Gilgit Baltistan','6843');
insert into supplier values('S5','Lenovo','982-8831 Ligula Ave','Tranås','Vlaams-Brabant','72308');
insert into supplier values('S6','OnePlus','Ap #271-6503 Mauris Rd.','Istanbul','Vestland','480572');
insert into supplier values('S7','MI','P.O. Box 332, 3419 Eget Rd.','Borlänge','Samsun','958145');
insert into supplier values('S8','Nokia','P.O. Box 607, 2539 Faucibus Av.','Palma de Mallorca','Liguria','555158');
insert into supplier values('S9','Sony','Ap #315-5140 Orci. Ave','Värnamo','Punjab','30202');
insert into supplier values('S10','Blackberry','P.O. Box 583, 1209 Fusce Rd.','Dannevirke','South Island','716147');

--INSERT VALUES INTO PRODUCT
insert into product values('PD_5780024','S2','Samsung Galaxy Tab series','Mobile Phone','1441.99','8');
insert into product values('PD_5780025','S2','Samsung Galaxy E7','Mobile Phone','973.99','18');
insert into product values('PD_5780026','S1','Apple iPhone 6 Plus','Mobile Phone','1169.99','13');
insert into product values('PD_5780027','S2','Samsung Galaxy W','Mobile Phone','501.99','4');
insert into product values('PD_5780028','S2','Samsung Galaxy Young','Mobile Phone','551.99','5');
insert into product values('PD_5780029','S3','G4','Mobile Phone','796.99','14');
insert into product values('PD_5780030','S8','Nokia Lumia 900','Mobile Phone','763.99','19');
insert into product values('PD_5780031','S8','Nokia Lumia 900','Mobile Phone','1082.99','19');
insert into product values('PD_5780032','S2','Samsung Galaxy','Mobile Phone','1046.99','1');
insert into product values('PD_5780033','S1','Apple iPhone 6 Plus','Mobile Phone','1285.99','1');
insert into product values('PD_5780034','S8','Nokia Lumia 1520','Mobile Phone','536.99','1');
insert into product values('PD_5780035','S8','Nokia Lumia 730','Mobile Phone','1199.99','11');
insert into product values('PD_5780036','S9','Sony Xperia X','Mobile Phone','1177.99','14');
insert into product values('PD_5780037','S8','Nokia Lumia 735','Mobile Phone','1295.99','9');
insert into product values('PD_5780038','S2','Samsung Galaxy Note 7','Mobile Phone','926.99','2');
insert into product values('PD_5780039','S8','Nokia Lumia ICON','Mobile Phone','1146.99','12');
insert into product values('PD_5780040','S8','Nokia Lumia 1520','Mobile Phone','681.99','8');
insert into product values('PD_5780041','S1','Apple iPhone 6s','Mobile Phone','793.99','18');
insert into product values('PD_5780042','S1','Apple iPhone SE','Mobile Phone','928.99','2');
insert into product values('PD_5780043','S2','Samsung GT-C3520','Mobile Phone','941.99','5');
insert into product values('PD_5780044','S8','Nokia Lumia 525','Mobile Phone','1215.99','11');
insert into product values('PD_5780045','S10','BlackBerry 10 Z10','Mobile Phone','861.99','15');
insert into product values('PD_5780046','S8','Nokia Lumia 2520','Mobile Phone','1390.99','12');
insert into product values('PD_5780047','S8','Nokia Lumia 800','Mobile Phone','1395.99','17');
insert into product values('PD_5780048','S2','Samsung Galaxy Active Neo','Mobile Phone','1261.99','1');
insert into product values('PD_5780049','S2','Samsung Galaxy Note Edge','Mobile Phone','1009.99','3');
insert into product values('PD_5780050','S8','Nokia Lumia 1320','Mobile Phone','693.99','5');
insert into product values('PD_5780051','S8','Nokia Lumia 638','Mobile Phone','1248.99','14');
insert into product values('PD_5780052','S8','Nokia Lumia 822','Mobile Phone','1363.99','10');
insert into product values('PD_5780053','S1','Apple iPhone 5s','Mobile Phone','1029.99','3');
insert into product values('PD_5780054','S5','IdeaPad','Laptop','658.99','15');
insert into product values('PD_5780055','S4','Inspiron','Laptop','616.99','17');
insert into product values('PD_5780056','S4','Alienware','Laptop','890.99','16');
insert into product values('PD_5780057','S5','IdeaPad Yoga','Laptop','849.99','7');
insert into product values('PD_5780058','S5','ThinkPad','Laptop','716.99','8');
insert into product values('PD_5780059','S5','Legion','Laptop','756.99','20');

--INSERT VALUES INTO PAYMENT
insert into payment values('PM66963','108435','Debit','4-Apr-2022 23:35:28','109');
insert into payment values('PM35141','106693','Giftcard','8-Nov-2022 18:18:46','178');
insert into payment values('PM57093','109435','Giftcard','24-Mar-2022 21:40:01','73');
insert into payment values('PM52265','104834','Paypal','24-Aug-2022 08:12:37','46');
insert into payment values('PM53477','109682','Credit','30-Jan-2022 13:06:45','21');
insert into payment values('PM30572','107496','Giftcard','6-Feb-2022 17:39:50','134');
insert into payment values('PM47141','102933','ApplePay','1-Feb-2022 03:44:16','189');
insert into payment values('PM68830','103854','Debit','13-Oct-2022 11:55:18','131');
insert into payment values('PM67346','103238','Credit','17-Mar-2022 10:20:41','244');
insert into payment values('PM52793','108475','Debit','5-Nov-2022 13:30:44','236');
insert into payment values('PM51686','105863','Giftcard','14-Sep-2022 06:02:56','112');
insert into payment values('PM77842','103827','Debit','20-May-2022 12:45:48','215');
insert into payment values('PM24098','103854','ApplePay','1-Dec-2022 01:57:32','223');
insert into payment values('PM24936','108745','Debit','11-Aug-2022 08:16:44','123');
insert into payment values('PM70102','109433','ApplePay','2-May-2022 04:03:43','112');
insert into payment values('PM25435','107936','Debit','21-Dec-2022 21:45:02','104');
insert into payment values('PM72046','105870','Debit','7-Jun-2022 16:39:10','84');
insert into payment values('PM61903','108784','ApplePay','15-May-2022 04:56:46','207');
insert into payment values('PM38795','103238','ApplePay','1-Dec-2022 02:26:15','93');
insert into payment values('PM47538','107496','ApplePay','4-Feb-2022 21:16:22','144');
insert into payment values('PM78089','105870','Giftcard','12-Dec-2022 07:09:43','32');
insert into payment values('PM28286','108923','ApplePay','29-Apr-2022 04:32:57','88');
insert into payment values('PM61865','104834','Paypal','17-Oct-2022 00:02:12','110');
insert into payment values('PM74937','107963','Giftcard','6-Apr-2022 03:51:04','24');
insert into payment values('PM65610','109682','ApplePay','30-Sep-2022 00:02:28','178');
insert into payment values('PM51636','102193','Paypal','26-Oct-2022 19:30:58','203');
insert into payment values('PM46588','103892','Debit','31-Oct-2022 20:30:30','182');
insert into payment values('PM78259','106693','Credit','27-May-2022 21:17:13','213');
insert into payment values('PM31676','107669','Giftcard','23-Oct-2022 03:31:05','30');
insert into payment values('PM64499','108435','Giftcard','2-Mar-2022 23:35:21','156');
insert into payment values('PM38631','102366','Giftcard','12-Jul-2022 14:00:35','169');
insert into payment values('PM21214','107836','ApplePay','18-Dec-2022 07:42:55','41');
insert into payment values('PM57878','109843','ApplePay','20-Oct-2022 15:50:36','73');
insert into payment values('PM52310','109433','Giftcard','21-Sep-2022 08:11:43','173');
insert into payment values('PM54462','106832','Paypal','20-Nov-2022 20:23:55','153');
insert into payment values('PM36147','102366','Debit','29-May-2022 23:15:01','79');

--INSERT VALUES INTO SHIPMENT
insert into shippment values('SH70001','USPS','146','649 Carriage Dr.');
insert into shippment values('SH70002','Fedex','73','9363 Whitemarsh St.');
insert into shippment values('SH70003','Fedex','1','12 Cooper Dr.');
insert into shippment values('SH70004','DHL','6','58 Glenlake Ave.');
insert into shippment values('SH70005','Pick Up','40','7917 Jones Road');
insert into shippment values('SH70006','Fedex','120','7066 Clark Street');
insert into shippment values('SH70007','DHL','56','984 Greenview Drive');
insert into shippment values('SH70008','Fedex','42','7776 Livingston Ave.');
insert into shippment values('SH70009','Fedex','130','921 Charles Ave.');
insert into shippment values('SH70010','DHL','42','387 Lees Creek Ave.');
insert into shippment values('SH70011','DHL','71','282 Andover Dr.');
insert into shippment values('SH70012','DHL','142','7772 Penn Street');
insert into shippment values('SH70013','Fedex','85','34 Lakewood St.');
insert into shippment values('SH70014','DHL','84','75 South Golf St.');
insert into shippment values('SH70015','Fedex','74','6 West Edgemont Dr.');
insert into shippment values('SH70016','USPS','103','7 Hill Field Court');
insert into shippment values('SH70017','DHL','10','303 East Sleepy Hollow Avenue');
insert into shippment values('SH70018','DHL','25','536 North Somerset St.');
insert into shippment values('SH70019','USPS','78','22 Pennington St.');
insert into shippment values('SH70020','USPS','150','3 West Taylor Ave.');
insert into shippment values('SH70021','USPS','14','8988 Lakeview St.');
insert into shippment values('SH70022','Pick Up','66','9975 Locust St.');
insert into shippment values('SH70023','Fedex','22','975 Olive Court');
insert into shippment values('SH70024','Pick Up','115','87 Lookout St.');
insert into shippment values('SH70025','Fedex','30','19 Pleasant St.');
insert into shippment values('SH70026','USPS','32','69 Creek St.');
insert into shippment values('SH70027','USPS','2','8522 Fawn St.');
insert into shippment values('SH70028','Pick Up','134','3 Ryan Dr.');
insert into shippment values('SH70029','DHL','103','731 Ocean Street');
insert into shippment values('SH70030','DHL','51','147 Wall Avenue');
insert into shippment values('SH70031','DHL','38','533 E. Snake Hill Street');
insert into shippment values('SH70032','USPS','22','730 North Newbridge Dr.');
insert into shippment values('SH70033','Pick Up','94','242 Courtland St.');
insert into shippment values('SH70034','USPS','24','8416 Fairway St.');
insert into shippment values('SH70035','USPS','113','7180 Fairview St.');
insert into shippment values('SH70036','Fedex','19','9718 Philmont Street');

--INSERT VALUES INTO ORDERS
insert into orders values('OD16820','106832','PM66963','SH70001');
insert into orders values('OD11055','104834','PM35141','SH70002');
insert into orders values('OD15893','107669','PM57093','SH70003');
insert into orders values('OD12443','103854','PM52265','SH70004');
insert into orders values('OD12726','109433','PM53477','SH70005');
insert into orders values('OD16903','107836','PM30572','SH70006');
insert into orders values('OD15819','106693','PM47141','SH70007');
insert into orders values('OD12269','103827','PM68830','SH70008');
insert into orders values('OD13606','108784','PM67346','SH70009');
insert into orders values('OD17061','107963','PM52793','SH70010');
insert into orders values('OD11423','103238','PM51686','SH70011');
insert into orders values('OD18718','105329','PM77842','SH70012');
insert into orders values('OD17754','105798','PM24098','SH70013');
insert into orders values('OD11085','109682','PM24936','SH70014');
insert into orders values('OD15016','105870','PM70102','SH70015');
insert into orders values('OD11244','107496','PM25435','SH70016');
insert into orders values('OD18553','109435','PM72046','SH70017');
insert into orders values('OD15896','108435','PM61903','SH70018');
insert into orders values('OD15938','102366','PM38795','SH70019');
insert into orders values('OD15577','102193','PM47538','SH70020');
insert into orders values('OD16320','109843','PM78089','SH70021');
insert into orders values('OD12046','105863','PM28286','SH70022');
insert into orders values('OD17364','103742','PM61865','SH70023');
insert into orders values('OD17377','104832','PM74937','SH70024');
insert into orders values('OD11290','102933','PM65610','SH70025');
insert into orders values('OD11445','108475','PM51636','SH70026');
insert into orders values('OD15111','108923','PM46588','SH70027');
insert into orders values('OD13055','107936','PM78259','SH70028');
insert into orders values('OD12576','108745','PM31676','SH70029');
insert into orders values('OD15808','103892','PM64499','SH70030');
insert into orders values('OD19042','106832','PM38631','SH70031');
insert into orders values('OD15170','104834','PM21214','SH70032');
insert into orders values('OD17038','107669','PM57878','SH70033');
insert into orders values('OD11315','103854','PM52310','SH70034');
insert into orders values('OD16635','109433','PM54462','SH70035');
insert into orders values('OD16218','107836','PM36147','SH70036');

--INSERT VALUES INTO ORDERPROD
insert into orderprod values('OP1001','OD16820','PD_5780024');
insert into orderprod values('OP1002','OD11055','PD_5780025');
insert into orderprod values('OP1003','OD15893','PD_5780026');
insert into orderprod values('OP1004','OD12443','PD_5780027');
insert into orderprod values('OP1005','OD12726','PD_5780028');
insert into orderprod values('OP1006','OD16903','PD_5780029');
insert into orderprod values('OP1007','OD15819','PD_5780030');
insert into orderprod values('OP1008','OD12269','PD_5780031');
insert into orderprod values('OP1009','OD13606','PD_5780032');
insert into orderprod values('OP1010','OD17061','PD_5780033');
insert into orderprod values('OP1011','OD11423','PD_5780034');
insert into orderprod values('OP1012','OD18718','PD_5780035');
insert into orderprod values('OP1013','OD17754','PD_5780036');
insert into orderprod values('OP1014','OD11085','PD_5780037');
insert into orderprod values('OP1015','OD15016','PD_5780038');
insert into orderprod values('OP1016','OD11244','PD_5780039');
insert into orderprod values('OP1017','OD18553','PD_5780040');
insert into orderprod values('OP1018','OD15896','PD_5780041');
insert into orderprod values('OP1019','OD15938','PD_5780042');
insert into orderprod values('OP1020','OD15577','PD_5780043');
insert into orderprod values('OP1021','OD16320','PD_5780044');
insert into orderprod values('OP1022','OD12046','PD_5780045');
insert into orderprod values('OP1023','OD17364','PD_5780046');
insert into orderprod values('OP1024','OD17377','PD_5780047');
insert into orderprod values('OP1025','OD11290','PD_5780048');
insert into orderprod values('OP1026','OD11445','PD_5780049');
insert into orderprod values('OP1027','OD15111','PD_5780050');
insert into orderprod values('OP1028','OD13055','PD_5780051');
insert into orderprod values('OP1029','OD12576','PD_5780052');
insert into orderprod values('OP1030','OD15808','PD_5780053');
insert into orderprod values('OP1031','OD19042','PD_5780054');
insert into orderprod values('OP1032','OD15170','PD_5780055');
insert into orderprod values('OP1033','OD17038','PD_5780056');
insert into orderprod values('OP1034','OD11315','PD_5780057');
insert into orderprod values('OP1035','OD16635','PD_5780058');
insert into orderprod values('OP1036','OD16218','PD_5780059');



