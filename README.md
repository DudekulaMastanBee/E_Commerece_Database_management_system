# E_Commerece_Database_management_system
##  Project Overview

The **E-Commerce Database Management System** is a MySQL-based database project designed to manage the core operations of an online shopping platform.
It provides an organized way to store and manage customer information, product categories, product details, customer orders, and payment transactions. The project uses SQL queries to retrieve, update, analyze, and manage data efficiently.

##  Project Objectives

- Store and manage customer information.
- Organize products under different categories.
- Maintain customer order details and order statuses.
- Track payment methods, amounts, and payment statuses.
- Monitor and automatically update product stock.
- Generate category-wise sales reports.
- Identify best-selling products.
- Retrieve customer purchase history.

##  Technology Stack

Database: MySQL
Query Language: SQL
Database Management Tool: MySQL Workbench
Database Design: ER Diagram
Database Type: Relational Database (RDBMS)

##  Database Design

The project consists of five relational tables connected through Primary Keys (PK) and Foreign Keys (FK).

### 1. Customers
Stores customer information.
- customer_id (Primary Key)
- customer_name
- email
- phone
- city

### 2. Categories
Stores product category information.
- category_id (Primary Key)
- category_name

### 3. Products
Stores product details and available stock.
- product_id (Primary Key)
- category_id (Foreign Key)
- product_name
- price
- stock_quantity

### 4. Orders
Maintains customer order information.
- order_id (Primary Key)
- customer_id (Foreign Key)
- product_id (Foreign Key)
- quantity
- order_date
- order_status

### 5. Payments
Stores payment transaction details.

- payment_id (Primary Key)
- order_id (Foreign Key)
- payment_method
- payment_amount
- payment_status
- payment_date

##  Sample Database Records

The project includes the following sample records:

Customers: 10 records
Categories: 5 records
Products: 10 records
Orders: 12 records
Payments: 12 records

## 💡 SQL Concepts Implemented

This project covers fundamental and advanced SQL concepts.

### 1. CRUD Operations
- INSERT
- SELECT
- UPDATE
- DELETE

### 2. SQL Functions
- String Functions
- Numeric Functions
- Date Functions
- Aggregate Functions

### 3. SQL Clauses
- WHERE
- GROUP BY
- HAVING
- ORDER BY
- LIMIT

### 4. SQL Joins
- INNER JOIN
- LEFT JOIN
- RIGHT JOIN

### 5. Subqueries
- Nested Queries
- IN Operator
- NOT EXISTS
- Aggregate-based Subqueries

### 6. Views
- Customer_Order_Details
- Category_Sales_Report

### 7. TCL Commands
- COMMIT
- ROLLBACK
- SAVEPOINT

### 8. Stored Procedures
- Display products below a specified stock quantity.
- Count orders placed by customers from a particular city.
- Retrieve details of a particular order.

### 9. Triggers
- Prevent negative stock quantities.
- Automatically reduce product stock when a new order is placed.

## ⚙️ Key Features

- Customer and product management.
- Category-wise product organization.
- Order and payment tracking.
- Stock quantity management.
- Customer purchase history.
- Sales analysis using aggregate functions.
- Category-wise sales reporting.
- Automated stock updates using triggers.
- Reusable database operations using stored procedures.
- Transaction management using TCL commands.

## 🚀 How to Run the Project

**Prerequisites:**
- MySQL Server
- MySQL Workbench

**Steps:**

1. Install and open MySQL Workbench.
2. Connect to your MySQL server.
3. Create a new database:

```sql
CREATE DATABASE ecommerce_db;
```

4. Select the database:

```sql
USE ecommerce_db;
```

5. Open your project SQL script in MySQL Workbench.
6. Execute the SQL statements in the following order:
   - Create database tables.
   - Insert sample records.
   - Execute SQL queries.
   - Create views.
   - Create stored procedures.
   - Create triggers.
   - Perform transaction operations.
7. Verify the results by executing SELECT queries.

## 📈 Expected Outcomes

- Efficient management of e-commerce database records.
- Accurate tracking of customer orders and payments.
- Better inventory management through automated stock updates.
- Simplified data retrieval using SQL queries and joins.
- Business insights through aggregate functions and sales reports.

## 🎓 Learning Outcomes

Through this project, I gained practical experience in:

- Designing relational databases.
- Creating tables and defining relationships.
- Writing SQL queries for real-world scenarios.
- Retrieving data using joins and subqueries.
- Generating reports using aggregate functions and views.
- Managing transactions using TCL commands.
- Automating database operations using triggers.
- Implementing reusable operations using stored procedures.

## 👩‍💻 Author

**D. Mastan Bee**

B.Tech – Information Technology (2026)

**GitHub:** [DudekulaMastanBee](https://github.com/DudekulaMastanBee)

---

⭐ If you find this project useful, feel free to explore the repository!
