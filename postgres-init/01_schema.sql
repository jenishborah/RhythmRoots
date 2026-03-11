-- ==========================================
-- RhythmRoots Hybrid E-Commerce SQL Schema
-- PostgreSQL Database
-- ==========================================


-- USERS TABLE
-- Stores customer accounts
CREATE TABLE users (

    user_id SERIAL PRIMARY KEY,

    name VARCHAR(100) NOT NULL,

    email VARCHAR(120) UNIQUE NOT NULL,

    password_hash TEXT NOT NULL

);



-- ALBUMS TABLE (Products)
-- Core product data stored in SQL
CREATE TABLE albums (

    album_id SERIAL PRIMARY KEY,

    title VARCHAR(200) NOT NULL,

    artist VARCHAR(200),

    genre VARCHAR(100),

    price DECIMAL(10,2) NOT NULL,

    stock_quantity INT NOT NULL DEFAULT 0

);



-- ORDERS TABLE
-- Each row represents a purchase transaction
CREATE TABLE orders (

    id SERIAL PRIMARY KEY,

    user_id INT NOT NULL,

    total_amount DECIMAL(10,2) NOT NULL,

    status VARCHAR(20) DEFAULT 'PAID',

    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT fk_orders_user
        FOREIGN KEY(user_id)
        REFERENCES users(user_id)
        ON DELETE CASCADE

);



-- ORDER ITEMS TABLE
-- Stores individual items inside each order
CREATE TABLE order_items (

    order_id INT NOT NULL,

    product_id INT NOT NULL,

    quantity INT NOT NULL,

    price_at_purchase DECIMAL(10,2) NOT NULL,

    PRIMARY KEY(order_id, product_id),

    CONSTRAINT fk_order_items_order
        FOREIGN KEY(order_id)
        REFERENCES orders(id)
        ON DELETE CASCADE,

    CONSTRAINT fk_order_items_album
        FOREIGN KEY(product_id)
        REFERENCES albums(album_id)
        ON DELETE CASCADE

);



-- ==========================================
-- INDEXES FOR PERFORMANCE
-- ==========================================

CREATE INDEX idx_orders_user
ON orders(user_id);

CREATE INDEX idx_order_items_product
ON order_items(product_id);

CREATE INDEX idx_album_genre
ON albums(genre);