CREATE OR REPLACE TYPE JOB_OBJECT as object 
(  JOB_ID               NUMBER,
   JOB_TITLE            VARCHAR(254)) 
--Row object JOB_OBJECT
/   
CREATE TABLE JOB_TABLE OF JOB_OBJECT 
(  JOB_TITLE NOT NULL ENABLE,
   PRIMARY KEY (JOB_ID) ENABLE)
--Object table for JOB_OBJECT
/
CREATE OR REPLACE TYPE LOGISTIC_EMPLOYEE_OBJECT as object    
(  EMP_ID               NUMBER,
   JOB                  REF JOB_OBJECT, --Column object JOB
   FIRST_NAME           VARCHAR(254),
   LAST_NAME            VARCHAR(254),
   DOB                  DATE,
   EMPLOYMENT_DATE      DATE,
   MEMBER PROCEDURE NAME_N_JOINDATE) --A member procedure that displays the full name and join date of the employee as a text
/
CREATE OR REPLACE TYPE BODY LOGISTIC_EMPLOYEE_OBJECT as
    MEMBER PROCEDURE NAME_N_JOINDATE is
    str varchar(200);fname varchar(200); lname varchar(200); empdate varchar(200);
         BEGIN
             fname := SELF.FIRST_NAME;
             lname := SELF.LAST_NAME;
             empdate := CAST(EMPLOYMENT_DATE AS varchar);
             str := CONCAT(CONCAT(CONCAT(CONCAT(fname,' '),lname),' joined on '),empdate);
             dbms_output.put_line(str); 
		 --or it can be dbms_output.put_line(CONCAT(CONCAT(CONCAT(CONCAT(SELF.FIRST_NAME,' '),SELF.LAST_NAME),' joined on '),CAST(EMPLOYMENT_DATE AS varchar)));
         END;
END;
-- First and last names are stored in variables as varchar while employment date is converted to varchar and stored in empdate
-- These variables are then concatenated with 'joined on' and output
/
CREATE TABLE LOGISTIC_EMPLOYEE_TABLE OF LOGISTIC_EMPLOYEE_OBJECT
(  FIRST_NAME NOT NULL ENABLE,
   LAST_NAME NOT NULL ENABLE,
   DOB NOT NULL ENABLE,
   EMPLOYMENT_DATE NOT NULL ENABLE,
   PRIMARY KEY (EMP_ID) ENABLE)
--object table for LOGISTIC_EMPLOYEE_OBJECT
/
CREATE OR REPLACE TYPE ADDRESS_OBJECT as object
(  ADDRESS_ID           NUMBER,
   APT_NO               NUMBER,
   BUILDING_NO          NUMBER,
   STREET_NAME          VARCHAR(254),
   CITY_NAME            VARCHAR(254),
   REGION_NAME          VARCHAR(254),
   PIN_CODE             VARCHAR(254),
   COUNTRY_NAME         VARCHAR(254))
--Row object ADDRESS_OBJECT
/   
CREATE TABLE ADDRESS_TABLE OF ADDRESS_OBJECT 
(  COUNTRY_NAME NOT NULL ENABLE,
   PIN_CODE NOT NULL ENABLE,
   STREET_NAME NOT NULL ENABLE,
   BUILDING_NO NOT NULL ENABLE,
   PRIMARY KEY (ADDRESS_ID) ENABLE)
--object table for ADDRESS_OBJECT
/
CREATE OR REPLACE TYPE ITEMS_OBJECT as object
(  ITEM_ID              NUMBER,
   ITEM_NAME            VARCHAR(254),
   ITEM_WEIGHT          NUMBER)
--Row object ITEMS_OBJECT
/   
CREATE TABLE ITEMS OF ITEMS_OBJECT 
(  ITEM_NAME NOT NULL ENABLE, 
   ITEM_WEIGHT NOT NULL ENABLE, 
   PRIMARY KEY (ITEM_ID) ENABLE)
--object table for ITEMS_OBJECT
/
CREATE OR REPLACE TYPE LOCATION_OF_ITEM_OBJECT as object
(  ITEM_LOCATION_ID     NUMBER,                
   FLOOR_NO             NUMBER,
   SHELF_NO             NUMBER,
   SHELF_LEVEL_NO       NUMBER)
--Row object LOCATION_OF_ITEM_OBJECT
/  
CREATE TABLE LOCATION_OF_ITEM_TABLE OF LOCATION_OF_ITEM_OBJECT 
(  FLOOR_NO NOT NULL ENABLE,
   SHELF_NO NOT NULL ENABLE,
   PRIMARY KEY (ITEM_LOCATION_ID) ENABLE)
--object table for LOCATION_OF_ITEM_OBJECT
/
CREATE OR REPLACE TYPE BUYER_OBJECT as object --buyers as object with their details
(  BUYER_ID             NUMBER,
   ADDRESS              ref ADDRESS_OBJECT, --Column object ADDRESS
   SHOP_NAME            VARCHAR(254),
   SHOP_EMAIL           VARCHAR(254))
/   
CREATE TABLE BUYER_TABLE OF BUYER_OBJECT 
(  SHOP_NAME NOT NULL ENABLE, 
   SHOP_EMAIL NOT NULL ENABLE, 
   PRIMARY KEY (BUYER_ID) ENABLE)
--object table for BUYER_OBJECT
/
CREATE OR REPLACE TYPE TRUCK_ISSUES_OBJECT as object --object for issues with trucks
(  ISSUE_ID             NUMBER,
   ISSUE_DESCRIPTION    VARCHAR(254),
   MECHANIC             REF LOGISTIC_EMPLOYEE_OBJECT, --Column object MECHANIC
   REPORTED_DATE        DATE,
   FIXED_DATE           DATE)
/
CREATE OR REPLACE TYPE TRUCK_ISSUES_TABLE as table of TRUCK_ISSUES_OBJECT
--nested table for TRUCK_ISSUES_OBJECT
/
CREATE OR REPLACE TYPE TRUCKS_OBJECT as object --trucks as objects
(  TRUCK_ID             NUMBER,
   TRUCK_MODEL          VARCHAR(254),
   MAX_WEIGHT           NUMBER,
   MAX_VOL              NUMBER,
   TRUCK_ISSUES TRUCK_ISSUES_TABLE) --Nested table TRUCK_ISSUES_TABLE containing the issues that has been reported on trucks and their status
/   
CREATE TABLE TRUCKS_TABLE OF TRUCKS_OBJECT 
(  TRUCK_MODEL NOT NULL ENABLE, 
   MAX_WEIGHT NOT NULL ENABLE,
   MAX_VOL NOT NULL ENABLE,
   PRIMARY KEY (TRUCK_ID) ENABLE) 
NESTED TABLE TRUCK_ISSUES STORE AS TRUCK_ISSUES_NESTED
RETURN AS VALUE
--object table for TRUCKS_OBJECT
/
CREATE OR REPLACE TYPE MANUFACTURER_OBJECT as object --object for manufacturers
(  MANUFACTURER_ID      NUMBER,
   MANUFACTURER_NAME    VARCHAR(254),
   ADDRESS              ref ADDRESS_OBJECT, --Column object ADDRESS
   MANUFACTURER_EMAIL   VARCHAR(254))
/   
CREATE TABLE MANUFACTURER_TABLE OF MANUFACTURER_OBJECT 
(  MANUFACTURER_NAME NOT NULL ENABLE, 
   MANUFACTURER_EMAIL NOT NULL ENABLE,
   PRIMARY KEY (MANUFACTURER_ID) ENABLE)
--object table for MANUFACTURER_OBJECT
/
CREATE OR REPLACE TYPE CARGO_DETAILS_OBJECT as object --object to store details about cargo shipments
(  CARGO_ID             NUMBER,
   TRUCK                REF TRUCKS_OBJECT, --Column object TRUCKS_OBJECT
   CARGO_WEIGHT         NUMBER,
   CARGO_DIRECTION      VARCHAR(254),
   START_DATE           DATE,
   DELIVERY_DATE        DATE,
   MAP MEMBER FUNCTION DELIVERY_TIME_COMPARE RETURN NUMBER) --Map method that compares the delivery times of different Cargo
/
 CREATE OR REPLACE TYPE BODY CARGO_DETAILS_OBJECT AS
    MAP MEMBER FUNCTION DELIVERY_TIME_COMPARE RETURN NUMBER IS
        BEGIN
            RETURN (SELF.DELIVERY_DATE - SELF.START_DATE);
        END DELIVERY_TIME_COMPARE;
END;
--This map method subtracts the start date from delivery date and compares the objects based on the obtained value which is the number of days taken for delivery
/
CREATE TABLE CARGO_DETAILS_TABLE OF CARGO_DETAILS_OBJECT 
(  CARGO_WEIGHT NOT NULL ENABLE,
   CARGO_DIRECTION NOT NULL ENABLE, 
   START_DATE NOT NULL ENABLE, 
   PRIMARY KEY (CARGO_ID) ENABLE)
--object table for CARGO_DETAILS_OBJECT
/
CREATE OR REPLACE TYPE ORDERS_TO_MANUFACTURER_OBJECT as object --object for the orders made to manufacturers
(  ORDERS_TO_MANUFACTURER_ID NUMBER,
   ORDER_PLANNER        REF LOGISTIC_EMPLOYEE_OBJECT, --Column object 
   MANUFACTURER         REF MANUFACTURER_OBJECT, --Column object
   ORDER_CARGO          REF CARGO_DETAILS_OBJECT, --Column object
   ORDER_DATE           DATE,
   RECIEVE_DATE         DATE)
/  
CREATE TABLE ORDERS_TO_MANUFACTURER_TABLE OF ORDERS_TO_MANUFACTURER_OBJECT
(  ORDER_PLANNER NOT NULL ENABLE,
   ORDER_DATE NOT NULL ENABLE, 
   PRIMARY KEY (ORDERS_TO_MANUFACTURER_ID) ENABLE)
--object table for ORDERS_TO_MANUFACTURER_OBJECT
/
CREATE OR REPLACE TYPE ORDER_CONTENTS_OBJECT as object --object to store ordered contents of buyer's order
(  ORDER_CONTENTS_ID    NUMBER,
   MANUFACTURER_ORDERED ref ORDERS_TO_MANUFACTURER_OBJECT, --Column object
   ITEM                 ref ITEMS_OBJECT, --Column object
   QUANTITY             NUMBER)
/
CREATE OR REPLACE TYPE ORDER_CONTENTS_TABLE as table of ORDER_CONTENTS_OBJECT
--nested table for ORDERED_CONTENTS_OBJECT
/
CREATE OR REPLACE TYPE BUYER_ORDER_OBJECT as object 
(  BUYER_ORDER_ID       NUMBER,
   SHOP                 ref BUYER_OBJECT, --Column object
   ORDER_PLANNER        ref LOGISTIC_EMPLOYEE_OBJECT, --Column object
   ORDERED_ITEMS        ORDER_CONTENTS_TABLE, --Nested table containin the ordered items in a particular order
   ORDER_DATE           DATE,
   ORDER_DELIVERY       DATE,
   TOTAL_ITEMS   		NUMBER,
   MEMBER PROCEDURE T_ITEMS) -- this member procedure finds the total number of rows in the nested table ordered_items and then we can later insert it into the total_items column
/   
CREATE OR REPLACE TYPE BODY BUYER_ORDER_OBJECT as
    MEMBER PROCEDURE T_ITEMS is
         BEGIN
             SELF.TOTAL_ITEMS := CARDINALITY(ORDERED_ITEMS); 
         END;
END;
-- Finds the total number of rows in the nested table for a particular instance
/
CREATE TABLE BUYER_ORDER_TABLE OF BUYER_ORDER_OBJECT 
(  ORDER_DATE NOT NULL ENABLE,
   SHOP NOT NULL ENABLE,
   ORDER_PLANNER NOT NULL ENABLE, 
   PRIMARY KEY (BUYER_ORDER_ID) ENABLE) 
 NESTED TABLE ORDERED_ITEMS STORE AS ORDERED_ITEMS_NESTED
 RETURN AS VALUE
--object table for BUYER_ORDER_OBJECT
/
CREATE OR REPLACE TYPE MANUFACTURER_INVENTORY_OBJECT as object 
(  INVENTORY_ID         NUMBER,
   MANUFACTURER         REF MANUFACTURER_OBJECT, --Column objects
   ITEM                 REF ITEMS_OBJECT, --Column objects
   LOCATION_OF_ITEM_    REF LOCATION_OF_ITEM_OBJECT, --Column objects
   ITEM_QUANTITY        NUMBER,
   MANUFACTURER_QUANTITY NUMBER,
   UNIT                 VARCHAR(254),
   PRICE                NUMBER,
   SELL_PRICE           NUMBER,
   EXPIRATION_DATE      DATE,
   MEMBER FUNCTION MARGIN RETURN NUMBER, --this member function finds the margin obtained from the sales of items
   ORDER MEMBER FUNCTION AMOUNT(amt MANUFACTURER_INVENTORY_OBJECT) RETURN NUMBER)--this order method compares the quantity of an item that are available with different manufacturers
/
CREATE OR REPLACE TYPE BODY MANUFACTURER_INVENTORY_OBJECT AS
    ORDER MEMBER FUNCTION AMOUNT(amt MANUFACTURER_INVENTORY_OBJECT) RETURN NUMBER IS
	  BEGIN
 		IF (SELF.MANUFACTURER_QUANTITY > amt.MANUFACTURER_QUANTITY) THEN RETURN (1);
		ELSIF (SELF.MANUFACTURER_QUANTITY < amt.MANUFACTURER_QUANTITY) THEN RETURN (-1);
		ELSE RETURN 0;
		END IF;
	  END AMOUNT;
    MEMBER FUNCTION MARGIN RETURN NUMBER IS
	  BEGIN
		RETURN (SELF.SELL_PRICE - SELF.PRICE);
	  END MARGIN;
END;
-- The order methods compares the object's MANUFACTURER_QUANTITY to the compared object and returns either 1,-1 or 0 according to the results
-- The member function returns the difference between the buy price which is PRICE and sell price which is SELL_PRICE of a particular object instance
/
CREATE TABLE MANUFACTURER_INVENTORY_TABLE OF MANUFACTURER_INVENTORY_OBJECT
(  MANUFACTURER NOT NULL ENABLE,
   ITEM NOT NULL ENABLE,
   ITEM_QUANTITY NOT NULL ENABLE,
   MANUFACTURER_QUANTITY NOT NULL ENABLE, 
   UNIT NOT NULL ENABLE,
   PRICE NOT NULL ENABLE, 
   SELL_PRICE NOT NULL ENABLE, 
   PRIMARY KEY (INVENTORY_ID) ENABLE)
--object table for MANUFACTURER_INVENTORY_OBJECT
/