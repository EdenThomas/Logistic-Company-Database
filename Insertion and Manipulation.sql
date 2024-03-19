Insert into JOB_TABLE (JOB_ID,JOB_TITLE) values (1,'Order Planner');
Insert into JOB_TABLE (JOB_ID,JOB_TITLE) values (2,'Mechanic');
Insert into JOB_TABLE (JOB_ID,JOB_TITLE) values (3,'Truck Driver');
Insert into JOB_TABLE (JOB_ID,JOB_TITLE) values (4,'Warehouse Manger');
Insert into JOB_TABLE (JOB_ID,JOB_TITLE) values (5,'Warehouse Worker');
-- Inserts values into JOB_TABLE

----------------------------------------------------------------------------------------

Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (1,null,'George','Clooney',to_date('05/06/1961','MM/DD/YYYY'),to_date('12/12/2012','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (2,null,'Abraham','Lincoln',to_date('02/12/1809','MM/DD/YYYY'),to_date('10/05/2010','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (3,null,'Lionel','Messi',to_date('06/24/1987','MM/DD/YYYY'),to_date('04/24/2008','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (4,null,'Janis','Rozentals',to_date('03/18/1866','MM/DD/YYYY'),to_date('08/02/2016','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (5,null,'Marshall','Mathers',to_date('10/17/1972','MM/DD/YYYY'),to_date('01/17/2018','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (6,null,'Kentucky','FC',to_date('09/13/1982','MM/DD/YYYY'),to_date('01/17/2007','MM/DD/YYYY'));
Insert into LOGISTIC_EMPLOYEE_TABLE (EMP_ID,JOB,FIRST_NAME,LAST_NAME,DOB,EMPLOYMENT_DATE) values (7,null,'Colonel','Sanders',to_date('06/06/1890','MM/DD/YYYY'),to_date('01/17/2015','MM/DD/YYYY'));
-- Inserts values into LOGISTIC_EMPLOYEE_TABLE and inserts null in JOB so that it can be later updated with JOB object values

----------------------------------------------------------------------------------------

Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 1) where emp_id = 1;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 2) where emp_id = 2;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 3) where emp_id = 3;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 4) where emp_id = 4;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 5) where emp_id = 5;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 1) where emp_id = 6;
Update LOGISTIC_EMPLOYEE_TABLE Set JOB = (Select REF(a) from JOB_TABLE a where job_id = 2) where emp_id = 7;
-- Updates the JOB by referencing to the object table JOB_TABLE using job_id and emp_id

------------------------------------------------------------------------------------------

Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (1,35,3,'Eksporta','Riga','Riga','LV-1010','Latvia');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (2,12,8,'Njordstown Streeta','Fjord City','Fjord Norway','3467','Norway');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (3,28,24,'Southern Street','Amsterdam','Westertern Netherlands','124524','Netherlands');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (4,1,15,'Street 18','Vienna','Eastern Austria','78854324','Austria');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (5,3,12,'10 Upping Street','Budapest','Central Hungary','214-H','Hungary');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (6,null,22,'420 Street','Porto','Porto District','PG-1467','Portugal');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (7,18,2,'Juan Street','Madrid','Central Spain','2346','Spain');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (8,null,13,'Cupid Street 12','Paris','Ile-de-France','23575','France');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (9,44,5,'St. Patrick Street','Tallin','Harju','22989','Estonia');
Insert into ADDRESS_TABLE (ADDRESS_ID,APT_NO,BUILDING_NO,STREET_NAME,CITY_NAME,REGION_NAME,PIN_CODE,COUNTRY_NAME) values (10,null,13,'Fatas Street','Big City','Large Region','120432','Huge Country');
-- Inserts values into ADDRESS_TABLE

-------------------------------------------------------------------------------------------

Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (1,'Potatoes',10);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (2,'Celery',3);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (3,'Carrots',8);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (4,'Onions',15);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (5,'Red Bell Peppers',2);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (6,'Jalapenos',1);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (7,'Garlic',1);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (8,'Chives',1);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (9,'Mango',12);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (10,'Avacados',5);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (11,'Lime',3);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (12,'Shrimp',10);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (13,'Salmon Steak',15);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (14,'Tuna Fillet',10);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (15,'Beef Sirloin',5);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (16,'Squid',1);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (17,'Lamb',10);
Insert into ITEMS (ITEM_ID,ITEM_NAME,ITEM_WEIGHT) values (18,'Veal',10);
-- Inserts values into object table ITEMS

-------------------------------------------------------------------------------------------

Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (1,1,11,1);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (2,1,12,2);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (3,1,13,3);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (4,1,14,4);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (5,2,21,1);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (6,2,22,2);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (7,2,23,3);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (8,3,31,1);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (9,3,32,2);
Insert into LOCATION_OF_ITEM_TABLE (ITEM_LOCATION_ID,FLOOR_NO,SHELF_NO,SHELF_LEVEL_NO) values (10,3,33,3);
-- Inserts values into LOCATION_OF_ITEM_TABLE

----------------------------------------------------------------------------------------

Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (1,null,'Auglu Serviss','augluserviss@gmail.com');
Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (2,null,'Super Store','superstores@gmail.com');
Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (3,null,'Rimi','rimi@gmail.com');
Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (4,null,'Maxima','maxima@gmail.com');
Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (5,null,'Lulu','lulu@gmail.com');
Insert into BUYER_TABLE (BUYER_ID,ADDRESS,SHOP_NAME,SHOP_EMAIL) values (6,null,'Carrefour','carrefour@gmail.com');
-- Inserts into BUYER_TABLE except the ADDRESS which will be referenced to ADDRESS_OBJECT

----------------------------------------------------------------------------------------

Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 1) where BUYER_ID = 1;
Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 2) where BUYER_ID = 2;
Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 3) where BUYER_ID = 3;
Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 4) where BUYER_ID = 4;
Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 5) where BUYER_ID = 5;
Update BUYER_TABLE set ADDRESS = (Select REF(a) from ADDRESS_TABLE a where ADDRESS_ID = 6) where BUYER_ID = 6;
-- Updates the Address of the BUYER_TABLE by referencing the ADDRESS_OBJECT using address_id and buyer_id

-----------------------------------------------------------------------------------------

Insert into TRUCKS_TABLE (TRUCK_ID,TRUCK_MODEL,MAX_WEIGHT,MAX_VOL,TRUCK_ISSUES) values (1,'Volvo 381EX',8000,50000,TRUCK_ISSUES_TABLE
     (
     TRUCK_ISSUES_OBJECT(1,'Exhaust Pipe Block',null,to_date('09/26/2020','MM/DD/YYYY'),to_date('09/30/2020','MM/DD/YYYY')),
     TRUCK_ISSUES_OBJECT(2,'Oil Leak',null,to_date('12/01/2022','MM/DD/YYYY'),to_date('06/30/2020','MM/DD/YYYY'))
     ));
Update TABLE(Select TRUCK_ISSUES from TRUCKS_TABLE where TRUCK_ID = 1) a 
Set a.MECHANIC = (Select ref(b) from LOGISTIC_EMPLOYEE_TABLE b where b.EMP_ID = 2);
-- Inserts into TRUCKS_TABLE and also in the same statement the nested table TRUCK_ISSUES_TABLE and then references Mechanic to LOGISTIC_EMPLOYEE_TABLE using truck_id = 1 and emp_id = 2 which shows the mechanic who worked on this truck

-----------------------------------------------------------------------------------------

Insert into TRUCKS_TABLE (TRUCK_ID,TRUCK_MODEL,MAX_WEIGHT,MAX_VOL,TRUCK_ISSUES) values (2,'Mercedes Benz Z293',15000,100000,TRUCK_ISSUES_TABLE
     (
     TRUCK_ISSUES_OBJECT(1,'Broken Clutch',null,to_date('03/21/2021','MM/DD/YYYY'),to_date('03/29/2021','MM/DD/YYYY')),
     TRUCK_ISSUES_OBJECT(2,'U-Joint Failure',null,to_date('12/06/2022','MM/DD/YYYY'),null)
     ));
Update TABLE(Select TRUCK_ISSUES from TRUCKS_TABLE where TRUCK_ID = 2) a 
Set a.MECHANIC = (Select ref(b) from LOGISTIC_EMPLOYEE_TABLE b where b.EMP_ID = 7);
-- Inserts into TRUCKS_TABLE and also in the same statement the nested table TRUCK_ISSUES_TABLE and then references Mechanic to LOGISTIC_EMPLOYEE_TABLE using truck_id = 2 and emp_id = 7 which shows the mechanic who worked on the issue

------------------------------------------------------------------------------------------

Insert into TRUCKS_TABLE (TRUCK_ID,TRUCK_MODEL,MAX_WEIGHT,MAX_VOL,TRUCK_ISSUES) values (3,'Man RT99',6000,65000,null);
-- Does not insert into nested table as there have been no issues with this truck

------------------------------------------------------------------------------------------

Insert into MANUFACTURER_TABLE (MANUFACTURER_ID,MANUFACTURER_NAME,ADDRESS,MANUFACTURER_EMAIL) values (1,'Super Vegetable Factory',null,'svf@gmail.com');
Insert into MANUFACTURER_TABLE (MANUFACTURER_ID,MANUFACTURER_NAME,ADDRESS,MANUFACTURER_EMAIL) values (2,'More Super Vegetable Factory',null,'msvf@gmail.com');
Insert into MANUFACTURER_TABLE (MANUFACTURER_ID,MANUFACTURER_NAME,ADDRESS,MANUFACTURER_EMAIL) values (3,'Not That Super Vegetable Factory',null,'ntsvf@gmail.com');
Insert into MANUFACTURER_TABLE (MANUFACTURER_ID,MANUFACTURER_NAME,ADDRESS,MANUFACTURER_EMAIL) values (4,'Regular Factory',null,'regularf@gmail.com');
-- Inserts values into MANUFACTURER_TABLE except Address

-------------------------------------------------------------------------------------------

Update MANUFACTURER_TABLE set ADDRESS = (Select ref(a) from ADDRESS_TABLE a where ADDRESS_ID = 7) where MANUFACTURER_ID = 1;
Update MANUFACTURER_TABLE set ADDRESS = (Select ref(a) from ADDRESS_TABLE a where ADDRESS_ID = 8) where MANUFACTURER_ID = 2;
Update MANUFACTURER_TABLE set ADDRESS = (Select ref(a) from ADDRESS_TABLE a where ADDRESS_ID = 9) where MANUFACTURER_ID = 3;
Update MANUFACTURER_TABLE set ADDRESS = (Select ref(a) from ADDRESS_TABLE a where ADDRESS_ID = 10) where MANUFACTURER_ID = 4;
-- Address is updated referencing to ADDRESS_OBJECT using address_id and manufacturer_id

------------------------------------------------------------------------------------------

Insert into CARGO_DETAILS_TABLE (CARGO_ID,TRUCK,CARGO_WEIGHT,CARGO_DIRECTION,START_DATE,DELIVERY_DATE) 
values (1,(select ref(a) from TRUCKS_TABLE a where TRUCK_ID = 1),5000,'To',to_date('06/15/2020','MM/DD/YYYY'),to_date('06/17/2020','MM/DD/YYYY'));
Insert into CARGO_DETAILS_TABLE (CARGO_ID,TRUCK,CARGO_WEIGHT,CARGO_DIRECTION,START_DATE,DELIVERY_DATE) 
values (2,(select ref(a) from TRUCKS_TABLE a where TRUCK_ID = 2),4500,'From',to_date('02/28/2021','MM/DD/YYYY'),to_date('03/02/2021','MM/DD/YYYY'));
Insert into CARGO_DETAILS_TABLE (CARGO_ID,TRUCK,CARGO_WEIGHT,CARGO_DIRECTION,START_DATE,DELIVERY_DATE) 
values (3,(select ref(a) from TRUCKS_TABLE a where TRUCK_ID = 3),3000,'To',to_date('11/03/2022','MM/DD/YYYY'),to_date('11/07/2022','MM/DD/YYYY'));
Insert into CARGO_DETAILS_TABLE (CARGO_ID,TRUCK,CARGO_WEIGHT,CARGO_DIRECTION,START_DATE,DELIVERY_DATE) 
values (4,(select ref(a) from TRUCKS_TABLE a where TRUCK_ID = 1),4000,'To',to_date('12/08/2022','MM/DD/YYYY'),null);
-- Inserts into CARGO_DETAILS_TABLE and references objects directly in the Insert statement using a select subquery without a seperate update statement

-------------------------------------------------------------------------------------------

Insert into ORDERS_TO_MANUFACTURER_TABLE(ORDERS_TO_MANUFACTURER_ID,ORDER_PLANNER,MANUFACTURER,ORDER_CARGO,ORDER_DATE,RECIEVE_DATE) 
values (1, (Select ref(a) from LOGISTIC_EMPLOYEE_TABLE a where EMP_ID = 6),(Select ref(b) from MANUFACTURER_TABLE b where MANUFACTURER_ID = 1),(select ref(c) from CARGO_DETAILS_TABLE c where CARGO_ID = 1),to_date('03/28/2022','MM/DD/YYYY'),to_date('04/05/2022','MM/DD/YYYY'));
Insert into ORDERS_TO_MANUFACTURER_TABLE(ORDERS_TO_MANUFACTURER_ID,ORDER_PLANNER,MANUFACTURER,ORDER_CARGO,ORDER_DATE,RECIEVE_DATE) 
values (2, (Select ref(a) from LOGISTIC_EMPLOYEE_TABLE a where EMP_ID = 1),(Select ref(b) from MANUFACTURER_TABLE b where MANUFACTURER_ID = 2),(select ref(c) from CARGO_DETAILS_TABLE c where CARGO_ID = 2),to_date('06/18/2022','MM/DD/YYYY'),to_date('06/24/2022','MM/DD/YYYY'));
Insert into ORDERS_TO_MANUFACTURER_TABLE(ORDERS_TO_MANUFACTURER_ID,ORDER_PLANNER,MANUFACTURER,ORDER_CARGO,ORDER_DATE,RECIEVE_DATE) 
values (3, (Select ref(a) from LOGISTIC_EMPLOYEE_TABLE a where EMP_ID = 6),(Select ref(b) from MANUFACTURER_TABLE b where MANUFACTURER_ID = 3),(select ref(c) from CARGO_DETAILS_TABLE c where CARGO_ID = 3),to_date('12/01/2022','MM/DD/YYYY'),null);
Insert into ORDERS_TO_MANUFACTURER_TABLE(ORDERS_TO_MANUFACTURER_ID,ORDER_PLANNER,MANUFACTURER,ORDER_CARGO,ORDER_DATE,RECIEVE_DATE) 
values (4, (Select ref(a) from LOGISTIC_EMPLOYEE_TABLE a where EMP_ID = 1),(Select ref(b) from MANUFACTURER_TABLE b where MANUFACTURER_ID = 4),(select ref(c) from CARGO_DETAILS_TABLE c where CARGO_ID = 4),to_date('12/08/2022','MM/DD/YYYY'),null);
-- Inserts into ORDERS_TO_MANUFACTURER_TABLE and references all ORDER_PLANNER, MANUFACTURER AND ORDER_CARGO objects within the insert statements to LOGISTIC_EMPLOYEE_TABLE, MANUFACTURER_TABLE and CARGO_DETAILS_TABLE respectively

-------------------------------------------------------------------------------------------

Insert into BUYER_ORDER_TABLE(BUYER_ORDER_ID,SHOP,ORDER_PLANNER,ORDERED_ITEMS,ORDER_DATE,ORDER_DELIVERY) values (1,(Select ref(a) from BUYER_TABLE a where BUYER_ID = 1),(Select ref(b) from LOGISTIC_EMPLOYEE_TABLE b where EMP_ID = 1),ORDER_CONTENTS_TABLE(),to_date('07/22/2022','MM/DD/YYYY'),to_date('07/24/2022','MM/DD/YYYY'));
Insert into Table(Select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 1)
values (ORDER_CONTENTS_OBJECT(1,(Select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 1),(Select ref(b) from ITEMS b where ITEM_ID = 1),3000));
Insert into table(select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 1)
values (ORDER_CONTENTS_OBJECT(1,(select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 1),(select ref(b) from ITEMS b where ITEM_ID = 4),2000));
-- Inserts into BUYER_ORDER_TABLE and references SHOP and ORDER_PLANNER to BUYER_TABLE and LOGISTIC_EMPLOYEE_TABLE
-- Later inserts value into the nested table ORDER_CONTENTS_TABLE which is the data storage for object collection ORDERED_ITEMS and also has REF to ORDERS_TO_MANUFACTURER_TABLE for identifying the manufactures from whom the products come and also to ITEMS for listing items

-------------------------------------------------------------------------------------------

Insert into BUYER_ORDER_TABLE(BUYER_ORDER_ID,SHOP,ORDER_PLANNER,ORDERED_ITEMS,ORDER_DATE,ORDER_DELIVERY) values (2,(Select ref(a) from BUYER_TABLE a where BUYER_ID = 2),(Select ref(b) from LOGISTIC_EMPLOYEE_TABLE b where EMP_ID = 6),ORDER_CONTENTS_TABLE(),to_date('09/20/2022','MM/DD/YYYY'),to_date('09/22/2022','MM/DD/YYYY'));
Insert into Table(Select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 2)
values (ORDER_CONTENTS_OBJECT(2,(Select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 2),(Select ref(b) from ITEMS b where ITEM_ID = 8),300));
Insert into table(select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 2)
values (ORDER_CONTENTS_OBJECT(2,(select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 3),(select ref(b) from ITEMS b where ITEM_ID = 11),500));
-- Inserts into BUYER_ORDER_TABLE and references SHOP and ORDER_PLANNER to BUYER_TABLE and LOGISTIC_EMPLOYEE_TABLE
-- Later inserts value into the nested table ORDER_CONTENTS_TABLE which is the data storage for object collection ORDERED_ITEMS and also has REF to ORDERS_TO_MANUFACTURER_TABLE for identifying the manufactures from whom the products come and also to ITEMS for listing items

-------------------------------------------------------------------------------------------

Insert into BUYER_ORDER_TABLE(BUYER_ORDER_ID,SHOP,ORDER_PLANNER,ORDERED_ITEMS,ORDER_DATE,ORDER_DELIVERY) values (3,(Select ref(a) from BUYER_TABLE a where BUYER_ID = 2),(Select ref(b) from LOGISTIC_EMPLOYEE_TABLE b where EMP_ID = 6),ORDER_CONTENTS_TABLE(),to_date('09/20/2022','MM/DD/YYYY'),to_date('09/22/2022','MM/DD/YYYY'));
Insert into Table(Select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 3)
values (ORDER_CONTENTS_OBJECT(3,(Select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 4),(Select ref(b) from ITEMS b where ITEM_ID = 6),250));
Insert into table(select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 3)
values (ORDER_CONTENTS_OBJECT(3,(select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 4),(select ref(b) from ITEMS b where ITEM_ID = 10),450));
Insert into table(select ORDERED_ITEMS from BUYER_ORDER_TABLE where BUYER_ORDER_ID = 3)
values (ORDER_CONTENTS_OBJECT(3,(select ref(a) from ORDERS_TO_MANUFACTURER_TABLE a where ORDERS_TO_MANUFACTURER_ID = 1),(select ref(b) from ITEMS b where ITEM_ID = 14),600));
-- Inserts into BUYER_ORDER_TABLE and references SHOP and ORDER_PLANNER to BUYER_TABLE and LOGISTIC_EMPLOYEE_TABLE
-- Later inserts value into the nested table ORDER_CONTENTS_TABLE which is the data storage for object collection ORDERED_ITEMS and also has REF to ORDERS_TO_MANUFACTURER_TABLE for identifying the manufactures from whom the products come and also to ITEMS for listing items

-------------------------------------------------------------------------------------------

Insert into MANUFACTURER_INVENTORY_TABLE values (1,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 1),(Select ref(b) from ITEMS b where ITEM_ID = 1),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 4),100,1500,'Kg',0.5,1,to_date('02/15/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (2,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 1),(Select ref(b) from ITEMS b where ITEM_ID = 4),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 5),500,5000,'Kg',0.2,0.5,to_date('03/28/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (3,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 2),(Select ref(b) from ITEMS b where ITEM_ID = 2),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 1),100,900,'Kg',0.4,0.8,to_date('02/20/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (4,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 3),(Select ref(b) from ITEMS b where ITEM_ID = 7),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 3),50,600,'Kg',2,3.8,to_date('04/14/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (5,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 4),(Select ref(b) from ITEMS b where ITEM_ID = 12),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 9),500,1000,'Kg',8,13,to_date('08/05/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (6,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 4),(Select ref(b) from ITEMS b where ITEM_ID = 16),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 10),100,450,'Kg',10.5,16,to_date('05/12/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (7,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 1),(Select ref(b) from ITEMS b where ITEM_ID = 12),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 9),500,1600,'Kg',8.5,13,to_date('02/20/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (8,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 2),(Select ref(b) from ITEMS b where ITEM_ID = 7),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 3),50,1000,'Kg',2.5,3.8,to_date('05/11/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (9,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 3),(Select ref(b) from ITEMS b where ITEM_ID = 16),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 10),100,800,'Kg',10.5,16,to_date('05/15/2023','MM/DD/YYYY'));
Insert into MANUFACTURER_INVENTORY_TABLE values (10,(select ref(a) from MANUFACTURER_TABLE a where MANUFACTURER_ID = 4),(Select ref(b) from ITEMS b where ITEM_ID = 1),(select ref(c) from LOCATION_OF_ITEM_TABLE c where ITEM_LOCATION_ID = 4),100,1000,'Kg',0.4,1,to_date('01/12/2023','MM/DD/YYYY'));
-- Inserts data into the table storing inventory of manufacturers and has REF to MANUFACTURER_TABLE for showing manufacturer, ITEMS to show the particular item in inventory and LOCATION_OF_ITEMS_TABLE to show the position of item within the warehouse
