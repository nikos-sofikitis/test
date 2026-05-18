CREATE SCHEMA IF NOT EXISTS bad;
SET search_path TO bad;

-- 1. Customer Table
CREATE TABLE customer (
    customer_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    email VARCHAR(255) NOT NULL UNIQUE,
    name VARCHAR(160) NOT NULL, -- Το ζητάει η εκφώνηση
    city VARCHAR(80),           -- Το ζητάει η εκφώνηση
    country VARCHAR(60)         -- Το ζητάει η εκφώνηση
);

-- 2. Customer Phone Table
CREATE TABLE customer_phone (
    customer_id BIGINT NOT NULL REFERENCES customer(customer_id),
    phone VARCHAR(20) NOT NULL,
    PRIMARY KEY (customer_id, phone)
);

-- 3. Product Table
CREATE TABLE product (
    product_id BIGINT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    category VARCHAR(60),
    unit_price NUMERIC(10, 2) NOT NULL CHECK (unit_price >= 0)
);

-- 4. Sale Table (Η "Κεφαλίδα")
CREATE TABLE sale (
    sale_id BIGINT PRIMARY KEY, -- Εδώ χρησιμοποιούμε το ID από το αρχικό sales_record
    customer_id BIGINT NOT NULL REFERENCES customer(customer_id),
    sale_date DATE NOT NULL
);

-- 5. Sale Item Table (Οι "Γραμμές")
CREATE TABLE sale_item (
    sale_id BIGINT NOT NULL REFERENCES sale(sale_id),
    product_id BIGINT NOT NULL REFERENCES product(product_id),
    quantity INT NOT NULL CHECK (quantity > 0),
    unit_price_at_sale NUMERIC(10, 2) NOT NULL CHECK (unit_price_at_sale >= 0),
    line_total NUMERIC(10, 2),
    PRIMARY KEY (sale_id, product_id)
);