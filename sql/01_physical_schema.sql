-- 1. ΠΡΩΤΑ Ο ΓΟΝΕΑΣ CATEGORY (χωρίς ξένα κλειδιά)
CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- 2. CUSTOMER
CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE
);

-- 3. PRODUCT (Δείχνει στο Category)
CREATE TABLE product (
    product_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    category_id INT NOT NULL REFERENCES category(category_id),
    description TEXT,
    price DECIMAL(10, 2) NOT NULL
);

-- 4. ORDERS (Δείχνει στον Customer)
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount DECIMAL(10, 2) NOT NULL
);

-- 5. ADDRESS (Δείχνει στον Customer)
CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customer(customer_id),
    line1 VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    postal_code VARCHAR(20) NOT NULL,
    country VARCHAR(50) NOT NULL
);

-- 6. ORDER_ITEM (Δείχνει σε Orders και Product)
CREATE TABLE order_item (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL REFERENCES orders(order_id),
    product_id INT NOT NULL REFERENCES product(product_id),
    quantity INT NOT NULL,
    unit_price_at_sale DECIMAL(10, 2) NOT NULL
);




