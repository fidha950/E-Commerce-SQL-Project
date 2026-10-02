USE ecommerce_project;


-- =====================================================
-- 1. DATA EXPLORATION
-- =====================================================

-- Total records in all tables

SELECT 'customers' AS table_name, COUNT(*) AS total_rows FROM customers
UNION ALL
SELECT 'geolocation', COUNT(*) FROM geolocation
UNION ALL
SELECT 'order_items', COUNT(*) FROM order_items
UNION ALL
SELECT 'order_payments', COUNT(*) FROM order_payments
UNION ALL
SELECT 'order_reviews', COUNT(*) FROM order_reviews
UNION ALL
SELECT 'orders', COUNT(*) FROM orders
UNION ALL
SELECT 'products', COUNT(*) FROM products
UNION ALL
SELECT 'sellers', COUNT(*) FROM sellers;


-- Table structures

DESCRIBE customers;
DESCRIBE geolocation;
DESCRIBE order_items;
DESCRIBE order_payments;
DESCRIBE order_reviews;
DESCRIBE orders;
DESCRIBE products;
DESCRIBE sellers;


-- Sample records

SELECT * FROM customers LIMIT 10;
SELECT * FROM geolocation LIMIT 10;
SELECT * FROM order_items LIMIT 10;
SELECT * FROM order_payments LIMIT 10;
SELECT * FROM order_reviews LIMIT 10;
SELECT * FROM orders LIMIT 10;
SELECT * FROM products LIMIT 10;
SELECT * FROM sellers LIMIT 10;


-- =====================================================
-- 2. BASIC STATISTICAL EXPLORATION
-- =====================================================

-- Order Items price

SELECT
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    AVG(price) AS average_price
FROM order_items;


-- Products cost and price

SELECT
    MIN(cost) AS minimum_cost,
    MAX(cost) AS maximum_cost,
    AVG(cost) AS average_cost,
    MIN(price) AS minimum_price,
    MAX(price) AS maximum_price,
    AVG(price) AS average_price
FROM products;


-- Payment value

SELECT
    MIN(payment_value) AS minimum_payment,
    MAX(payment_value) AS maximum_payment,
    AVG(payment_value) AS average_payment
FROM order_payments;


-- =====================================================
-- 3. DISTINCT VALUE ANALYSIS
-- =====================================================

-- Order Status
SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_status
ORDER BY Total_Orders DESC;


-- Payment Type
SELECT
    payment_type,
    COUNT(*) AS Total_Payments
FROM order_payments
GROUP BY payment_type
ORDER BY Total_Payments DESC;


-- Customer State
SELECT
    customer_state,
    COUNT(*) AS Total_Customers
FROM customers
GROUP BY customer_state
ORDER BY Total_Customers DESC;


-- Product Category
SELECT
    product_category_name,
    COUNT(*) AS Total_Products
FROM products
GROUP BY product_category_name
ORDER BY Total_Products DESC;


-- =====================================================
-- 4. NULL VALUE CHECKING
-- =====================================================

-- Customers

SELECT
    COUNT(*) AS Total_Rows,
    SUM(customer_id IS NULL) AS Null_customer_id,
    SUM(customer_unique_id IS NULL) AS Null_customer_unique_id,
    SUM(customer_zip_code_prefix IS NULL) AS Null_zip_code,
    SUM(customer_city IS NULL) AS Null_city,
    SUM(customer_state IS NULL) AS Null_state
FROM customers;


-- Order Items

SELECT
    COUNT(*) AS Total_Rows,
    SUM(order_id IS NULL) AS Null_Order_ID,
    SUM(order_item_id IS NULL) AS Null_Order_Item_ID,
    SUM(product_id IS NULL) AS Null_Product_ID,
    SUM(seller_id IS NULL) AS Null_Seller_ID,
    SUM(price IS NULL) AS Null_Price,
    SUM(freight_value IS NULL) AS Null_Freight
FROM order_items;


-- Geolocation

SELECT
    COUNT(*) AS Total_Rows,
    SUM(zip_code_prefix IS NULL) AS Null_Zip,
    SUM(geolocation_lat IS NULL) AS Null_Latitude,
    SUM(geolocation_lng IS NULL) AS Null_Longitude,
    SUM(geolocation_city IS NULL) AS Null_City,
    SUM(geolocation_state IS NULL) AS Null_State
FROM geolocation;


-- Order Payments

SELECT
    COUNT(*) AS Total_Rows,
    SUM(order_id IS NULL) AS Null_Order_ID,
    SUM(payment_sequential IS NULL) AS Null_Payment_Sequential,
    SUM(payment_type IS NULL) AS Null_Payment_Type,
    SUM(payment_installments IS NULL) AS Null_Installments,
    SUM(payment_value IS NULL) AS Null_Payment_Value
FROM order_payments;


-- Order Reviews

SELECT
    COUNT(*) AS Total_Rows,
    SUM(review_id IS NULL) AS Null_Review_ID,
    SUM(order_id IS NULL) AS Null_Order_ID,
    SUM(review_score IS NULL) AS Null_Review_Score,
    SUM(review_comment_title IS NULL) AS Null_Comment_Title,
    SUM(review_comment_message IS NULL) AS Null_Comment_Message
FROM order_reviews;


-- Orders

SELECT
    COUNT(*) AS Total_Rows,
    SUM(order_id IS NULL) AS Null_Order_ID,
    SUM(customer_id IS NULL) AS Null_Customer_ID,
    SUM(order_status IS NULL) AS Null_Order_Status,
    SUM(order_purchase_timestamp IS NULL) AS Null_Purchase_Date,
    SUM(order_delivered_customer_date IS NULL) AS Null_Delivered_Date,
    SUM(order_estimated_delivery_date IS NULL) AS Null_Estimated_Date
FROM orders;


-- Products

SELECT
    COUNT(*) AS Total_Rows,
    SUM(product_id IS NULL) AS Null_Product_ID,
    SUM(product_category_name IS NULL) AS Null_Category,
    SUM(product_name IS NULL) AS Null_Product_Name,
    SUM(product_brand IS NULL) AS Null_Brand,
    SUM(product_weight_g IS NULL) AS Null_Weight,
    SUM(product_length_cm IS NULL) AS Null_Length,
    SUM(product_height_cm IS NULL) AS Null_Height,
    SUM(product_width_cm IS NULL) AS Null_Width,
    SUM(cost IS NULL) AS Null_Cost,
    SUM(price IS NULL) AS Null_Price
FROM products;


-- Sellers

SELECT
    COUNT(*) AS Total_Rows,
    SUM(seller_id IS NULL) AS Null_Seller_ID,
    SUM(seller_zip_code_prefix IS NULL) AS Null_Zip,
    SUM(seller_city IS NULL) AS Null_City,
    SUM(seller_state IS NULL) AS Null_State
FROM sellers;


-- =====================================================
-- 5. DUPLICATE CHECKING
-- =====================================================

-- Customers

SELECT
    customer_id,
    COUNT(*) AS Duplicate_Count
FROM customers
GROUP BY customer_id
HAVING COUNT(*) > 1;


-- Orders

SELECT
    order_id,
    COUNT(*) AS Duplicate_Count
FROM orders
GROUP BY order_id
HAVING COUNT(*) > 1;



-- Order Items

SELECT
    order_id,
    order_item_id,
    COUNT(*) AS Duplicate_Count
FROM order_items
GROUP BY order_id, order_item_id
HAVING COUNT(*) > 1
LIMIT 100;


-- Reviews

SELECT
    review_id,
    COUNT(*) AS Duplicate_Count
FROM order_reviews
GROUP BY review_id
HAVING COUNT(*) > 1;



-- Products

SELECT
    product_id,
    COUNT(*) AS Duplicate_Count
FROM products
GROUP BY product_id
HAVING COUNT(*) > 1;


-- Sellers

SELECT
    seller_id,
    COUNT(*) AS Duplicate_Count
FROM sellers
GROUP BY seller_id
HAVING COUNT(*) > 1;


-- =====================================================
-- 6. DATA TYPE CHECKING / CLEANING
-- =====================================================

SHOW COLUMNS FROM order_items;

-- Run this only if order_id is not already VARCHAR(50)
-- ALTER TABLE order_items
-- MODIFY COLUMN order_id VARCHAR(50);

SELECT COUNT(*) AS total_rows
FROM order_items;


-- =====================================================
-- 7. ACTUAL SQL DATA CLEANING
-- =====================================================

-- Remove duplicate rows and standardize customer city/state

DROP TABLE IF EXISTS customers_clean;

CREATE TABLE customers_clean AS
SELECT DISTINCT
    customer_id,
    customer_unique_id,
    customer_zip_code_prefix,
    TRIM(LOWER(customer_city)) AS customer_city,
    UPPER(TRIM(customer_state)) AS customer_state
FROM customers;



-- Check cleaned customer data

SELECT *
FROM customers_clean
LIMIT 10;


-- Compare original and cleaned rows

SELECT COUNT(*) AS Original_Rows
FROM customers;

SELECT COUNT(*) AS Cleaned_Rows
FROM customers_clean;


-- =====================================================
-- 8. OUTLIER / INVALID VALUE CHECKING
-- =====================================================

-- Order Items: price, freight and discount range

SELECT
    MIN(price) AS Minimum_Price,
    MAX(price) AS Maximum_Price,
    AVG(price) AS Average_Price,
    MIN(freight_value) AS Minimum_Freight,
    MAX(freight_value) AS Maximum_Freight,
    MIN(discount_rate) AS Minimum_Discount,
    MAX(discount_rate) AS Maximum_Discount
FROM order_items;


-- Invalid values in Order Items

SELECT *
FROM order_items
WHERE price < 0
   OR freight_value < 0
   OR discount_rate < 0
LIMIT 100;


-- Products: invalid values

SELECT *
FROM products
WHERE cost < 0
   OR price < 0
   OR product_weight_g < 0
   OR product_length_cm < 0
   OR product_height_cm < 0
   OR product_width_cm < 0
LIMIT 100;


-- Payment: invalid values

SELECT *
FROM order_payments
WHERE payment_value < 0
   OR payment_installments < 0
LIMIT 100;


-- Review score validation

SELECT *
FROM order_reviews
WHERE review_score NOT BETWEEN 1 AND 5;


-- Orders: date consistency check

SELECT *
FROM orders
WHERE order_delivered_customer_date IS NOT NULL
  AND order_purchase_timestamp IS NOT NULL
  AND order_delivered_customer_date < order_purchase_timestamp
LIMIT 100;


-- Discount rate check

SELECT
    MIN(discount_rate) AS Minimum_Discount,
    MAX(discount_rate) AS Maximum_Discount,
    AVG(discount_rate) AS Average_Discount
FROM order_items;


-- =====================================================
-- 9. INNER JOIN
-- =====================================================

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_status,
    o.order_purchase_timestamp
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
LIMIT 10;


-- =====================================================
-- 10. LEFT JOIN
-- =====================================================

SELECT
    c.customer_id,
    c.customer_city,
    c.customer_state,
    o.order_id,
    o.order_status
FROM customers c
LEFT JOIN orders o
    ON c.customer_id = o.customer_id
LIMIT 10;


-- =====================================================
-- 11. THREE-TABLE JOIN
-- =====================================================

SELECT
    o.order_id,
    o.order_status,
    oi.order_item_id,
    oi.product_id,
    p.product_category_name,
    p.product_brand,
    oi.price,
    oi.freight_value
FROM orders o
INNER JOIN order_items oi
    ON o.order_id = oi.order_id
INNER JOIN products p
    ON oi.product_id = p.product_id
LIMIT 10;


-- =====================================================
-- 12. USER-DEFINED FUNCTIONS
-- =====================================================

-- Remove functions if they already exist

DROP FUNCTION IF EXISTS CalculateDiscountedPrice;

DELIMITER //

CREATE FUNCTION CalculateDiscountedPrice(
    p_price DECIMAL(10,2),
    p_discount_rate DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_price - (p_price * p_discount_rate / 100);
END //

DELIMITER ;


-- Test UDF 1

SELECT
    price,
    discount_rate,
    CalculateDiscountedPrice(price, discount_rate) AS Final_Price
FROM order_items
LIMIT 10;


-- UDF 2

DROP FUNCTION IF EXISTS CalculateProfit;

DELIMITER //

CREATE FUNCTION CalculateProfit(
    p_selling_price DECIMAL(10,2),
    p_product_cost DECIMAL(10,2)
)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN p_selling_price - p_product_cost;
END //

DELIMITER ;


-- Test UDF 2

SELECT
    product_id,
    cost,
    price,
    CalculateProfit(price, cost) AS Profit
FROM products
LIMIT 10;


-- =====================================================
-- 13. STORED PROCEDURES
-- =====================================================

-- Procedure 1

DROP PROCEDURE IF EXISTS GetOrdersByStatus;

DELIMITER //

CREATE PROCEDURE GetOrdersByStatus(
    IN p_status VARCHAR(30)
)
BEGIN

    -- Step 1: Count orders
    SELECT
        p_status AS Order_Status,
        COUNT(*) AS Total_Orders
    FROM orders
    WHERE order_status = p_status;

    -- Step 2: Show order details
    SELECT
        order_id,
        customer_id,
        order_status,
        order_purchase_timestamp
    FROM orders
    WHERE order_status = p_status;

END //

DELIMITER ;


-- Test Procedure 1

CALL GetOrdersByStatus('delivered');

CALL GetOrdersByStatus('shipped');



-- Procedure 2

DROP PROCEDURE IF EXISTS GetProductsByPriceRange;

DELIMITER //

CREATE PROCEDURE GetProductsByPriceRange(
    IN p_min_price DECIMAL(10,2),
    IN p_max_price DECIMAL(10,2)
)
BEGIN
    SELECT
        product_id,
        product_category_name,
        product_brand,
        cost,
        price
    FROM products
    WHERE price BETWEEN p_min_price AND p_max_price
    ORDER BY price;
END //

DELIMITER ;


-- Test Procedure 2

CALL GetProductsByPriceRange(100, 500);

CALL GetProductsByPriceRange(500, 1000);

-- =====================================================
-- 14. ANALYTICAL QUESTIONS
-- =====================================================

-- Q1. Total Orders

SELECT COUNT(*) AS Total_Orders
FROM orders;


-- Q2. Orders by Status

SELECT
    order_status,
    COUNT(*) AS Total_Orders
FROM orders
GROUP BY order_status
ORDER BY Total_Orders DESC;


-- Q3. Orders by Customer State

SELECT
    c.customer_state,
    COUNT(o.order_id) AS Total_Orders
FROM customers c
INNER JOIN orders o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_state
ORDER BY Total_Orders DESC;


-- Q4. Total Sales by Product Category

SELECT
    p.product_category_name,
    SUM(oi.price) AS Total_Sales
FROM order_items oi
INNER JOIN products p
    ON oi.product_id = p.product_id
GROUP BY p.product_category_name
ORDER BY Total_Sales DESC;


-- Q5. Average Product Price by Category

SELECT
    p.product_category_name,
    ROUND(AVG(p.price), 2) AS Average_Price
FROM products p
GROUP BY p.product_category_name
ORDER BY Average_Price DESC;


-- Q6. Payment Method Analysis

SELECT
    payment_type,
    COUNT(*) AS Total_Payments,
    ROUND(SUM(payment_value), 2) AS Total_Payment_Value
FROM order_payments
GROUP BY payment_type
ORDER BY Total_Payments DESC;


-- Q7. Top 10 Sellers by Sales

SELECT
    seller_id,
    SUM(price) AS Total_Sales,
    RANK() OVER (ORDER BY SUM(price) DESC) AS Sales_Rank
FROM order_items
GROUP BY seller_id
ORDER BY Sales_Rank
LIMIT 10;


-- Q8. Review Score Analysis

SELECT
    review_score,
    COUNT(*) AS Total_Reviews
FROM order_reviews
GROUP BY review_score
ORDER BY review_score;




 