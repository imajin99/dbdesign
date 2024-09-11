## 1. Schema Design

![sales](./drawSQL-schema-table.png)

- table **users** : store personal user or customer information 
- table **item** : store item that are in sales
- table **store** : store basic information for each store
- table **store_location** : relation between store and location, assuming in one location can have 2 or more store
- table **order** : store order data by user and specific store
- table **order_item** : sales detail from order, since one order can have multiple item

## 2. Design performance for write and read

let's say we want to insert 50 million sales data, which is a lot and will take some time. After the data got inserted into order and order_item table, the next problem will be read data issue. there are several way that can be solution to achieve better read performance:

1. create index on order and order_item tables, this will make read much more faster if we fetch a few rows.
2. partition table, we can partition the order tables by date (months) or by store location id, this will make the query to only read from certain part of the child tables, theoretically it still one table but physically the table will be devided into several child tables based on the column that we partitioned on.