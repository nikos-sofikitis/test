SET search_path TO bad;


EXPLAIN ANALYZE 
SELECT * FROM sale WHERE customer_id = 500;
