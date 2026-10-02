# 🛒 E-Commerce Database Analysis Using SQL

## 📌 Project Overview

This project focuses on exploring, cleaning, validating and analyzing an E-Commerce database using SQL.

The project uses a MySQL database named `ecommerce_project` containing 8 interconnected tables related to customers, orders, products, payments, reviews, sellers and geolocation.

The project follows a complete SQL data analytics workflow, from data exploration and quality checking to advanced analysis and business questions.

## 🎯 Project Objectives

* Explore the structure and scale of the database
* Check data quality using NULL, duplicate and invalid-value checks
* Clean and standardize customer data
* Perform relational joins between tables
* Create User-Defined Functions (UDFs)
* Create Stored Procedures
* Perform analytical queries
* Extract useful business insights from the data

## 🛠️ Tools & Technologies

* **Database:** MySQL
* **Language:** SQL
* **Tool:** MySQL Workbench / MySQL CLI

## 🗂️ Database Tables

The project contains 8 tables:

* `customers`
* `orders`
* `order_items`
* `order_payments`
* `order_reviews`
* `products`
* `sellers`
* `geolocation`

## 🔍 Project Workflow

### 1. Data Exploration

* Checked total records in all tables
* Inspected table structures using `DESCRIBE`
* Viewed sample records
* Calculated minimum, maximum and average values
* Analyzed distinct values

### 2. Data Quality Assessment

* NULL value checking
* Duplicate record checking
* Duplicate key checking
* Invalid value checking
* Outlier checking
* Date consistency validation

### 3. Data Cleaning

Created a cleaned customer table called `customers_clean`.

Cleaning included:

* Removing duplicate rows using `DISTINCT`
* Trimming customer city values
* Standardizing city names to lowercase
* Standardizing state values to uppercase

### 4. SQL Joins

The project includes:

* INNER JOIN
* LEFT JOIN
* Three-table JOIN

### 5. User-Defined Functions

Created two functions:

* `CalculateDiscountedPrice`
* `CalculateProfit`

### 6. Stored Procedures

Created two stored procedures:

* `GetOrdersByStatus`
* `GetProductsByPriceRange`

### 7. Business Analysis

The project answers analytical questions related to:

* Total orders
* Orders by status
* Orders by customer state
* Total sales by product category
* Average product price by category
* Payment method analysis
* Top 10 sellers by sales
* Review score analysis

## 🧠 SQL Concepts Used

* SELECT
* WHERE
* GROUP BY
* HAVING
* ORDER BY
* COUNT()
* SUM()
* AVG()
* MIN()
* MAX()
* ROUND()
* CASE WHEN
* INNER JOIN
* LEFT JOIN
* Subqueries
* User-Defined Functions
* Stored Procedures
* Window Functions
* RANK()

## 📊 Business Value

The analysis can help understand:

* Order volume and order status
* Regional customer demand
* Product category sales
* Product pricing
* Payment method usage
* Seller performance
* Customer review distribution


## 🚀 Future Scope

* Build a Power BI or Tableau dashboard
* Extend data cleaning to products, sellers and geolocation
* Add automated data-quality checks
* Analyze delivery time
* Perform customer lifetime value analysis

## 📌 Conclusion

This project demonstrates the practical use of SQL for data exploration, data quality assessment, data cleaning, relational joins, reusable SQL functions, stored procedures and business analysis.

It provides hands-on experience in working with a relational E-Commerce database and extracting meaningful information using SQL.
