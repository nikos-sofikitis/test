SET search_path TO bad;

-- 1. Καθαρισμός πινάκων (για να μπορείς να το ξανατρέξεις αν χρειαστεί)
TRUNCATE sale_item, sale, customer_phone, product, customer CASCADE;

-- 2. Γέμισμα Πελατών (1.000 εγγραφές)
INSERT INTO customer (email, name, city, country)
SELECT 
    'user' || i || '@example.com', 
    'Customer ' || i, 
    'City ' || (i % 50), 
    'Greece'
FROM generate_series(1, 1000) s(i);

-- 3. Γέμισμα Προϊόντων (100 εγγραφές)
INSERT INTO product (name, category, unit_price)
SELECT 
    'Product ' || i, 
    'Category ' || (i % 10), 
    (random() * 500 + 10)::numeric(10,2)
FROM generate_series(1, 100) s(i);

-- 4. Γέμισμα Πωλήσεων (5.000 εγγραφές)
INSERT INTO sale (sale_id, customer_id, sale_date)
SELECT 
    i, 
    (floor(random() * 1000) + 1)::int,
    CURRENT_DATE - (floor(random() * 365) || ' days')::interval
FROM generate_series(1, 5000) s(i);

-- 5. Γέμισμα Sale Items (Περίπου 2-3 προϊόντα ανά πώληση)
INSERT INTO sale_item (sale_id, product_id, quantity, unit_price_at_sale)
SELECT 
    s.sale_id,
    (floor(random() * 100) + 1)::int,
    (floor(random() * 5) + 1)::int,
    (random() * 100 + 10)::numeric(10,2)
FROM sale s
CROSS JOIN LATERAL generate_series(1, (random() * 2 + 1)::int); -- 1 έως 3 προϊόντα ανά πώληση