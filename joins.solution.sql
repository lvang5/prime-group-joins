--Get all customers and their addresses. 
SELECT * FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id";


--Get all orders and their line items.
SELECT * FROM "orders" JOIN "line_items" ON "orders"."id" = "line_items"."order_id";

--Which warehouses have cheetos?

SELECT * FROM "warehouse_product" JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" WHERE "description" = 'cheetos';


--Which warehouses have diet pepsi?

SELECT * FROM "warehouse_product" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id" WHERE "description" = 'diet pepsi';


--Get the number of orders for each customer. NOTE: It is OK if those without orders are not included in results.

SELECT "customers"."first_name", COUNT ("orders"."id") FROM "customers" JOIN "addresses" ON "customers"."id" = "addresses"."customer_id" JOIN "orders" ON "addresses"."id" = "orders"."address_id" GROUP BY "customers"."id";

--How many customers do we have?

SELECT COUNT("id") FROM "customers";

--How many products do we carry?

SELECT COUNT("id") FROM "products";


--What is the total available on-hand quantity of diet pepsi?
SELECT SUM("on_hand") FROM  "warehouse_product" JOIN "products" ON "warehouse_product"."product_id" = "products"."id" JOIN "warehouse" ON "warehouse_product"."warehouse_id" = "warehouse"."id" WHERE "description" = 'diet pepsi';

--(Stretch) How much was the total cost for each order?


--(Stretch) How much has each customer spent in total?


--(Stretch) How much has each customer spent in total? Customers who have spent $0 should still show up in the table. It should say 0, not NULL (research coalesce).