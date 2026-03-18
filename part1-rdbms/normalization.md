1.1 — Anomaly Analysis :
## Anomaly Analysis:
- ***Insert Anomaly:*** Insert anomaly occurs when we add new data to only field of the table without adding respective data to it's related which araise into data redundancy and poor table design. _For Eg:_ In order_flat table when try new **"Customer : Krishna as C009**, then have provide it's respective customer details like customer_email,customer_city.Then If new customer places a order then respective details like order_id,product_id,product_name,category,unit_price,quantity,order_date,sales_rep_id,sales_rep_name,	sales_rep_email and office_address.If any one fields is missing it would directly affect the table design and could be data redundancy.

- ***Update Anomaly:*** update anomaly occurs when we try to update a field data in a table then that data needs to be updated on each and every occurance on that particular table. Otherwise there would mismatch in data which led to data redundancy._For.Eg:_ In order_flat table when we update a email id of a customer,Sneha Iyer	from **"sneha@gmail.com"** to 
**"sneha_iyer@gmail.com"**, then that need to be updated on all 22 occurance on the orders_flat table. Otherwise as mentioned above it may led to mismatch in data which led to data redundancy.

- ***Delete Anomaly:*** delete anomaly occurs when we try to delete a field data in a table then we have to delete all relevant data of that particular field and from it's all occurance.In order to avoid to mismatch in data which may led to data redundancy and poor table design._For.Eg:_ In orders_flat table when we delete a Product Id **"P008"**, then the need to that product related field like product_name,category,unit_price,quantity and Order Id.or In simple words we have to delete the whole row of 187 on the orders_flat table.In order to avoid the data mismatch and data redundancy.

## Normalization Justification:
The single flat table may seem simpler for initial setup, the _orders_flat.csv_ dataset clearly demonstrates that normalization is a necessity for data integrity and efficiency, rather than over-engineering.

- _Data Redundancy & Storage Inefficiency:_
In flat table structure lead massive duplications. For.Eg: **Rohan Mehta (C001)** appears **20 times** where his email id and city is repeated every row.Similarly **Laptop (P001)** and its unit price are repeated **27times**.This redundancy wastes storage and increases the risk of _"data rot"_.
- _update Anomaly:_
Maintaining the consistency across the table is more important single flat table.
we update a email id of a customer,Sneha Iyer	from **"sneha@gmail.com"** to 
**"sneha_iyer@gmail.com"**, then that need to be updated on all 22 occurance on the orders_flat table.If we make typo error on on row or if didn't update properly on one row.then database will get confused about her email address.

- _Insert Anomaly and Delete Anomaly:_
The current structure prevents from storing data indenpendently as we on insert anomaly above If we add a new **"Customer : Krishna as C009**, then have provide it's respective customer details like customer_email,customer_city.Then If new customer places a order then respective details like order_id,product_id,product_name,category,unit_price,quantity,order_date,sales_rep_id,sales_rep_name,	sales_rep_email and office_address. Conversely, if we delete the only order for a specific product, we lose all record of that product’s existence, including its name and price.

_By normalizing this data into separate Customers, Products, SalesReps, and Orders tables, we ensure that each fact is stored in exactly one place, guaranteeing integrity and allowing for more flexible data management._








