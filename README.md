/*
  STEP 4a: Identifying Normalization Violations
  
  1. 1NF Violation: 
     The column "customer_phones" has multi-valued data. 
     According to 1NF, every column must contain only atomic values. 
     Quoted offending column: customer_phones.

  2. Functional Dependency 1 (product_name -> product_category, product_price):
     This breaks 3NF because product_category and product_price depend on the product_name, 
     which is not a primary key of the sales_record table. This is a partial dependency 
     (on part of the information) or a transitive dependency in this flat table.

  3. Functional Dependency 2 (customer_email -> customer_name, customer_city, customer_country):
     This breaks 3NF because customer details depend on the email, not on the sale_id. 
     Non-key attributes are depending on another non-key attribute (transitive dependency).

  4. Update Anomaly Example:
     If a product's price changes (e.g., "Product A" goes from $10 to $12), 
     we would have to find and update every single row in the sales_record table 
     where "Product A" was ever sold. If we miss one row, the data becomes inconsistent.
*/