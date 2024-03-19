# Logistic-Company-Database
This repository contains the SQL code used to create, manipulate and retrieve data for a hypothetical Logistic company using PL/SQL

14 objects and correspondingly 14 object tables are created. 2 of those tables are nested tables.

**JOB_OBJECT** – Stores the id and title of jobs.
**LOGISTIC_EMPLOYEE_OBJECT** – stores the details of employees like first and last names, dob, employment date and references the job object for the employee’s job.
**ADDRESS_OBJECT** – stores different addresses associated with the warehouse with attributes such as country name, region name, city name, pin code etc.
**ITEMS_OBJECT** – stores all the items handled by the company and has attributes name, weight and id.
**LOCATION_OF_ITEM_OBJECT** - stores the possible location of items which is the floor number, shelf number and level number.
**BUYER_OBJECT** – stores the buyer details like shop name and email.
**TRUCK_ISSUES_OBJECT** – stores issues with trucks and is stored as nested table inside trucks table with attributes issue id, description, fix date and references job object to assign the mechanic.
**TRUCKS_OBJECT** – stores information of trucks like id, max weight etc.
**MANUFACTURER_OBJECT** – stores details of manufacturers like name, email, id and address.
**CARGO_DETAILS_OBJECT** – stores details of cargo that is both being sent to buyers or received from manufacturers with attributes like truck, id etc.
**ORDERS_TO_MANUFACTURERS_OBJECT** – stores the orders placed to the manufacturer and has attributes like id, cargo, order planner and so forth.
**ORDER_CONTENTS_OBJECT** – contain the orders that were received from buyers and sent to manufacturers and is stored as a nested table for object collection and has attributes id, manufacturer ordered, item and quantity.
**BUYER_ORDER_OBJECT** – contains orders placed by buyers and had order contents table as a nested table within it and has attributes like shop, id, planner, items, date, delivery etc.
**MANUFACTURER_INVENTORY_OBJECT** – stores all the items and the manufacturers who supply them and has attributes like id, manufacturer, item, location of item, seller and warehouse quantities, sell and buy prices etc. It also references manufacturer_object, item_object and location_of_item object.

I implemented 5 methods – 3 member methods, 1 map method and 1 order method.

**NAME_N_JOINDATE** – it is a member procedure for the logistic employee object which outputs the name and the employment start date of an employee
**DELIVERY_TIME_COMPARE** – it is a map method that compares the delivery time in days of different orders. We have used the order by clause to later sort them according to the delivery times.
**T_ITEMS** – it is a member procedure that finds the total count of items present in a buyer’s order. This is calculated by using the CARDINALITY function to retrieve the total number of rows in a nested table as each item is stored as a row in the nested table ORDERED_CONTENTS_TABLE
**MARGIN** – it is a member function used to return the margin that is profited from the sales of items. The function returns the difference between the sell price and the buy price to get the margin.
**AMOUNT** – it is an order method that compares two manufactures and the amount of a particular item with them. This can be used to find out manufacturers who have more inventory to make larger purchases. The order method compares the amount to items and returns 1, -1 or 0 for more than, less than and equal amounts respectively.
