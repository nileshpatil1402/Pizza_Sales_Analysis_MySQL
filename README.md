# 🍕 Pizza Sales Analysis   
### Build Project with SQL & Power BI Business Intelligence 

![SQL](https://img.shields.io/badge/SQL-MySQL-blue)
![Power BI](https://img.shields.io/badge/PowerBI-Dashboard-yellow)
![Project Type](https://img.shields.io/badge/Project-Data%20Analytics-green)

---

## 📌 Executive Overview  

This project delivers an end-to-end sales analytics solution designed to extract actionable business intelligence from transactional pizza sales data.

The objective is to transform raw operational data into strategic insights that support:

- Revenue optimization  
- Product performance evaluation  
- Customer demand analysis  
- Operational efficiency improvement  

The solution integrates **MySQL (data modeling & analytics)** and **Power BI (interactive dashboarding)** to provide executive-level reporting and performance tracking.

---

## 🎯 Business Objective  

To address the strategic question:

> **How can transactional sales data be leveraged to identify revenue drivers, optimize product strategy, and enhance operational performance?**

---

## 🏗️ Solution Architecture  

### 🔹 Data Layer – Relational Database (MySQL)

A structured relational schema was implemented using a star schema design:

**Fact Table**
- `order_details`

**Dimension Tables**
- `orders`
- `pizzas`
- `pizza_types`

This architecture ensures:
- Scalable aggregation  
- Efficient joins  
- Clean analytical modeling  

---

### 🔹 Database Schema (SQL)

```sql
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    order_date DATE,
    order_time TIME
);

CREATE TABLE order_details (
    order_details_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    pizza_id VARCHAR(100),
    quantity INT,
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

CREATE TABLE pizzas (
    pizza_id VARCHAR(100) PRIMARY KEY,
    pizza_type_id VARCHAR(50),
    size VARCHAR(10),
    price DECIMAL(6,2)
);

CREATE TABLE pizza_types (
    pizza_type_id VARCHAR(100) PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    ingredients TEXT
);
```

---

## 🔍 SQL Business Analysis  

### Total Orders
```sql
SELECT COUNT(DISTINCT order_id) AS total_orders
FROM orders;
```

### Total Revenue
```sql
SELECT SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id;
```

### Top 3 Revenue Generating Pizzas
```sql
SELECT pizza_types.name,
SUM(order_details.quantity * pizzas.price) AS total_revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY total_revenue DESC
LIMIT 3;
```

### Revenue Contribution Percentage
```sql
SELECT
pizza_types.name AS pizza_type,
SUM(pizzas.price * order_details.quantity) AS revenue,
ROUND(
(SUM(pizzas.price * order_details.quantity) * 100.0) /
(SELECT SUM(pizzas.price * order_details.quantity)
 FROM order_details
 JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id), 2
) AS percentage_contribution
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN pizza_types ON pizzas.pizza_type_id = pizza_types.pizza_type_id
GROUP BY pizza_types.name
ORDER BY percentage_contribution DESC;
```

### Cumulative Revenue Over Time
```sql
SELECT orders.order_date,
SUM(pizzas.price * order_details.quantity) AS daily_revenue,
SUM(SUM(pizzas.price * order_details.quantity))
OVER (ORDER BY orders.order_date) AS cumulative_revenue
FROM order_details
JOIN pizzas ON order_details.pizza_id = pizzas.pizza_id
JOIN orders ON order_details.order_id = orders.order_id
GROUP BY orders.order_date
ORDER BY orders.order_date;
```

---

## 📊 Power BI Dashboard  

### Key Performance Indicators (KPIs)

- 💰 **Total Revenue:** ₹817.86K  
- 🧾 **Total Orders:** 21K  
- 📦 **Total Quantity Sold:** 50K  
- 📈 **Average Order Value:** ₹38.31  

---

### DAX Measures

```DAX
Total Revenue =
SUMX(
    order_details,
    order_details[quantity] * RELATED(pizzas[price])
)

Total Orders =
DISTINCTCOUNT(orders[order_id])

Total Quantity =
SUM(order_details[quantity])

Avg Order Value =
DIVIDE([Total Revenue], [Total Orders])
```

---

## 📈 Analytical Views

- Revenue Trend by Month  
- Revenue by Category  
- Quantity by Size  
- Top 5 Revenue-Generating Pizzas  
- Interactive Date, Category & Size Filters  

---

## 🔍 Key Insights  

- Large size pizzas dominate overall sales volume.  
- Classic and Supreme categories generate the highest revenue share.  
- Thai Chicken, Barbecue Chicken, and California Chicken pizzas are top revenue contributors.  
- Peak ordering hours identified using SQL time-based grouping.  

---

## 💡 Strategic Recommendations  

✔ Expand premium variations in high-performing categories  
✔ Implement targeted promotions for low-performing pizzas  
✔ Optimize staffing during peak hours  
✔ Bundle medium & small pizzas to increase order value  
✔ Apply data-driven pricing strategy for large-size pizzas  

---

## 🧠 Technical Skills Demonstrated  

- Relational Data Modeling (Star Schema)  
- Advanced SQL (Joins, Aggregations, Window Functions)  
- Revenue & KPI Analysis  
- Power BI Dashboard Development  
- DAX Measure Creation  
- Business Intelligence Reporting  

---

## 📂 Repository Structure  

```
Pizza-Sales-Analytics/
│
├── sql/
│   └── pizza_analysis_queries.sql
│
├── powerbi/
│   └── pizza_sales_dashboard.pbix
│
├── report/
│   └── Project_Report.pdf
│
└── README.md
```

---

## 📊 Business Impact  

By transforming raw transactional data into structured intelligence, this project enables:

- Revenue growth optimization  
- Data-driven product decisions  
- Improved operational planning  
- Scalable analytics framework  

---

## 👨‍💻 Author  

**Nilesh Patil**  
Data Analyst | SQL | Power BI | Business Intelligence  

🔗 LinkedIn: https://linkedin.com/in/nilesh-patil-347810362  

---

## 🚀 Future Enhancements  

- Customer segmentation integration  
- Predictive sales forecasting (Python / Machine Learning)  
- Profit margin analysis  
- Inventory optimization  
- Cloud deployment (Azure / AWS)  

---
