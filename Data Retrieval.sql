SELECT * FROM JOB_TABLE;
-- This query displays everything from object table JOB_TABLE

-------------------------------------------------------------------------------------------

SELECT EMP_ID, DEREF(JOB) FROM LOGISTIC_EMPLOYEE_TABLE;
--This query displays the EMP_ID and the correspoding dereferenced JOB object from LOGISTIC_EMPLOYEE_TABLE

-------------------------------------------------------------------------------------------

SELECT * FROM ADDRESS_TABLE;
-- This query displays everything from object table ADDRESS_TABLE

-------------------------------------------------------------------------------------------

SELECT BUYER_ID, SHOP_NAME, DEREF(ADDRESS) FROM BUYER_TABLE;
--THis query displays the BUYER_ID, SHOP_NAME and the dereferenced ADDRESS object pointing to ADDRESS_TABLE from object table BUYER_TABLE

-------------------------------------------------------------------------------------------

SELECT a.MANUFACTURER_ID, a.MANUFACTURER_NAME, a.ADDRESS.COUNTRY_NAME from MANUFACTURER_TABLE a;
--This query displays the MANUFACTURER_ID, MANUFACTURER_NAME and retrieves the attribute COUNTRY_NAME from column object ADDRESS from object table MANUFACTURER_TABLE

-------------------------------------------------------------------------------------------

SELECT a.TRUCK_ID, a.TRUCK_MODEL, DEREF(b.MECHANIC), b.ISSUE_ID FROM TRUCKS_TABLE a, TABLE(a.TRUCK_ISSUES) b;
--This query displays the TRUCK_ID and TRUCK_MODEL from object table TRUCKS_TABLE and dereferenced object MECHANIC ponting to LOGISTIC_EMPLOYEE_TABLE and ISSUE_ID from nested table TRUCK_ISSUES

-------------------------------------------------------------------------------------------

SELECT BUYER_ORDER_ID, DEREF(SHOP), DEREF(ORDER_PLANNER), DEREF(b.MANUFACTURER_ORDERED), ORDER_DELIVERY FROM BUYER_ORDER_TABLE a, TABLE(ORDERED_ITEMS) b;
--This query displays BUYER_ORDER_ID, dereferenced object SHOP pointing to BUYER_TABLE, dereferenced object ORDER_PLANNER ponting to LOGISTIC_EMPLOYEE_TABLE and ORDER_DELIVERY froM BUYER_ORDER_TABLE and dereferenced object MANUFACTURER_ORDERED pointing to MANUFACTURER_TABLE from nested table ORDERED_ITEMS

-------------------------------------------------------------------------------------------

SELECT BUYER_ORDER_ID, DEREF(SHOP), DEREF(ORDER_PLANNER), ORDER_DATE, b.ORDER_CONTENTS_ID, DEREF(b.MANUFACTURER_ORDERED) FROM BUYER_ORDER_TABLE a, TABLE(a.ORDERED_ITEMS) (+) b ;
--This query displays BUYER_ORDER_ID, dereferenced object SHOP pointing to BUYER_TABLE, dereferenced object ORDER_PLANNER pointing to LOGISTIC_EMPLOYEE_TABLE, ORDER_DATE from BUYER_ORDER_TABLE and ORDER_CONTENTS_ID and dereferenced object MANUFACTURER_ORDERED pointing to MANUFACTURER_TABLE from nested table ORDERED_ITEMS where there are no ordered items

-------------------------------------------------------------------------------------------

SELECT VALUE(a) FROM ADDRESS_TABLE a WHERE COUNTRY_NAME = 'Spain';
--This query displays data of objects from object table ADDRESS_TABLE where the COUNTRY_NAME attribute is 'Spain' so that all addresses in Spain are displayed

-------------------------------------------------------------------------------------------

SELECT VALUE(a) FROM LOGISTIC_EMPLOYEE_TABLE a WHERE a.JOB.JOB_TITLE LIKE 'Mechanic';
--This query displays data of objects from object table LOGISTIC_EMPLOYEE_TABLE where the JOB_TITLE attribute of column object JOB is 'Mechanic' so that details of only mechanics are retrieved

-------------------------------------------------------------------------------------------

SELECT VALUE(a) FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.ITEM.ITEM_WEIGHT <= 20 AND PRICE < 2 AND ITEM_QUANTITY > 100;
--This query displays data of objects from object table MANUFACTURER_INVENTORY_TABLE where ITEM_WEIGHT attribute of column object ITEM is less than or equal to 20 and PRICE less that 2 and ITEM_QUANTITY is greater than 100

-------------------------------------------------------------------------------------------

SELECT VALUE(a) FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.ITEM.ITEM_NAME IN (SELECT c.ITEM.ITEM_NAME FROM BUYER_ORDER_TABLE b, TABLE(b.ORDERED_ITEMS) c);
--This query displays data of objects from object table MANUFACTURER_INVENTORY_TABLE where ITEM_NAME attribute of column object ITEM is among the ITEM_NAMES from the nested table ORDERED_ITEMS of BUYER_ORDER_TABLE so that only ordered items are displayed

-------------------------------------------------------------------------------------------

DECLARE
    emp LOGISTIC_EMPLOYEE_OBJECT;
BEGIN
    SELECT VALUE(a) INTO emp FROM LOGISTIC_EMPLOYEE_TABLE a WHERE EMP_ID = 1;
    emp.NAME_N_JOINDATE();
END;
-- This pl/sql block uses the member procedure NAME_N_JOINDATE() to display name and join date of employee with EMP_ID = 1 as a text

-------------------------------------------------------------------------------------------

SELECT VALUE(a) FROM CARGO_DETAILS_TABLE a ORDER BY VALUE(a);
-- This query uses map method to sort the objects in the object table CARGO_DETAILS_TABLE according to their delivery time

-------------------------------------------------------------------------------------------

DECLARE
    x BUYER_ORDER_OBJECT;
BEGIN
    SELECT VALUE(a) INTO x FROM BUYER_ORDER_TABLE a WHERE BUYER_ORDER_ID = 1;
    x.T_ITEMS();
    DELETE FROM BUYER_ORDER_TABLE a WHERE BUYER_ORDER_ID = 1;
    INSERT INTO BUYER_ORDER_TABLE VALUES (x);
END;
-- This pl/sql block uses the member procedure T_ITEMS() to find the total items in a buyer's order and insert it into the object table BUYER_ORDER_TABLE column TOTAL_ITEMS where BUYER_ORDER_ID = 1;

-------------------------------------------------------------------------------------------

DECLARE
    x MANUFACTURER_INVENTORY_OBJECT;
    y MANUFACTURER_INVENTORY_OBJECT;
    u varchar(254);
    v varchar(254);
    w varchar(254);
    txt varchar(200);
BEGIN
    SELECT VALUE(a) INTO x FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.MANUFACTURER.MANUFACTURER_ID = 1 AND a.ITEM.ITEM_ID = 12;
    SELECT VALUE(a) INTO y FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.MANUFACTURER.MANUFACTURER_ID = 4 AND a.ITEM.ITEM_ID = 12;
    SELECT a.MANUFACTURER.MANUFACTURER_NAME INTO u FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.MANUFACTURER.MANUFACTURER_ID = 1 AND a.ITEM.ITEM_ID = 12;
    SELECT a.MANUFACTURER.MANUFACTURER_NAME INTO v FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.MANUFACTURER.MANUFACTURER_ID = 4 AND a.ITEM.ITEM_ID = 12;
    SELECT a.ITEM.ITEM_NAME INTO w FROM MANUFACTURER_INVENTORY_TABLE a WHERE a.MANUFACTURER.MANUFACTURER_ID = 1 AND a.ITEM.ITEM_ID = 12;

    CASE x.AMOUNT(y) 
    WHEN (1) THEN
        txt := CONCAT(CONCAT(CONCAT(CONCAT(u,' has more '),w),' than '),v);
    WHEN (-1) THEN
        txt := CONCAT(CONCAT(CONCAT(CONCAT(u,' has less '),w),' than '),v);
    WHEN (0) THEN
	  txt := CONCAT(CONCAT(CONCAT(CONCAT(u,' has equal '),w),' as '),v);
    END CASE;
    dbms_output.put_line(txt);
END;
-- This pl/sql block retrieves data using the order method AMOUNT() to compare quantity of items with different manufacturers
-- Its selected according to the MANUFACTURER_ID and ITEM_ID we input, here ITEM_ID = 12 and MANUFACTURER_ID = (1 and 4)
-- The names of the manufacturers and the item are stored in variables u, v, w
-- The variables x and y store the objects and are later used with the order method AMOUNT() to compare the quantity of items
-- It outputs the result as a text

----------------------------------------------------------------------------------------------

Select a.MANUFACTURER.MANUFACTURER_NAME, a.ITEM.ITEM_NAME, a.MARGIN() FROM MANUFACTURER_INVENTORY_TABLE a;
-- This query utilizes the member function MARGIN() to list out the manufacturers and the items they supply along with their margin