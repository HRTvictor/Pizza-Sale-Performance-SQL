# 🍕 Pizza Hut Sales Performance Analysis (SQL)

![SQL](https://img.shields.io/badge/SQL-MySQL-blue.svg)
![Data Analysis](https://img.shields.io/badge/Analysis-Sales-orange.svg)
![Status](https://img.shields.io/badge/Status-Completed-green.svg)

## 📌 Project Overview
This project focuses on analyzing a comprehensive dataset of pizza orders to uncover critical insights into **customer behavior**, **product performance**, and **operational efficiency**. By processing four primary relational tables, the analysis provides data-driven answers to business-critical questions.

## 🗂️ Dataset Architecture
The analysis is performed on four interconnected tables:
* **Orders**: Tracks the date and time of every order placed.
* **Order_Details**: Contains granular information about the quantity and pizza IDs for each order.
* **Pizzas**: Stores details regarding pizza size and price.
* **Pizza_Types**: Includes descriptive data like category, ingredients, and names.

---

## 🚀 Key Business Insights

### 1. High-Level Metrics
* **Total Orders**: A total of **21,350** orders were processed during the analyzed period.
* **Total Revenue**: The total sales generated amount to **$817,860.05**.
* **Average Daily Volume**: On average, **138 pizzas** are ordered per day.

### 2. Product Performance
* **Highest Priced Pizza**: "The Greek Pizza" leads the premium segment at **$35.95**.
* **Popular Choice**: The **Large (L)** size is the most common pizza size ordered, with **18,526** units.
* **Top 3 Revenue Drivers**:
    1.  **Thai Chicken Pizza**: $43,434.25
    2.  **Barbecue Chicken Pizza**: $42,768.00
    3.  **California Chicken Pizza**: $41,409.50

### 3. Category & Sales Contribution
* Sales are well-distributed across categories, with **Classic** pizzas contributing the most at **26.9%** of total revenue.
* The **Supreme** category offers the highest variety with **9** different pizza types.

### 4. Operational Trends
* **Peak Hours**: Order volume surges significantly during lunch (**12:00 PM - 1:00 PM**) and the dinner rush (**5:00 PM - 7:00 PM**).

---

## 🛠️ SQL Techniques Used
To extract these insights, the following SQL features were utilized:
* **Joins**: Combining multiple relational tables (Inner Joins).
* **Aggregations**: `SUM()`, `COUNT()`, `AVG()`, and `ROUND()`.
* **Grouping**: Complex `GROUP BY` and `ORDER BY` operations.
* **Window Functions**: Utilized `RANK()` and `OVER(PARTITION BY...)` for category-wise ranking.
* **Subqueries**: Implementing nested queries for calculating cumulative revenue and daily averages.

---

## 👨‍💻 Author
**Harshit Raj** *Computer Science Student at Technocrats Institute of Technology*

---
