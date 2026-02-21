# 🍕 Pizza Sales Analysis Project (MySQL)

**SQL Data Analysis Project | Basic • Intermediate • Advanced Queries**

This project analyzes a Pizza Sales dataset using MySQL to extract business insights related to revenue, order trends, product performance, and category contribution.

The project demonstrates SQL proficiency from basic aggregations to advanced window functions.

---

## 📂 Database Structure

The project uses 4 relational tables:

1. **order_details**
2. **orders**
3. **pizza_types**
4. **pizzas**

### 🔹 order_details
- order_details_id (Primary Key)
- order_id
- pizza_id
- quantity

### 🔹 orders
- order_id (Primary Key)
- order_date
- order_time

### 🔹 pizza_types
- pizza_type_id (Primary Key)
- name
- category
- ingredients

### 🔹 pizzas
- pizza_id (Primary Key)
- pizza_type_id
- size
- price

---

# 📊 SQL Analysis Breakdown

---

## 🟢 Basic Level Queries

1️⃣ Total number of orders  
→ 21,350 total orders  

2️⃣ Total revenue generated  
→ $817,860.05  

3️⃣ Highest priced pizza  
→ The Greek Pizza (XXL) – $35.95  

4️⃣ Most common pizza size  
→ Large (L)  

5️⃣ Top 5 most ordered pizzas  
- big_meat_s  
- thai_ckn_l  
- five_cheese_l  
- four_cheese_l  
- classic_dlx_m  

---

## 🟡 Intermediate Level Queries

6️⃣ Total quantity by pizza category  
- Classic  
- Supreme  
- Chicken  
- Veggie  

7️⃣ Orders distribution by hour  
→ Peak orders between 12 PM – 2 PM  

8️⃣ Category-wise pizza distribution  

9️⃣ Daily total pizzas ordered & average per order  

---

## 🔴 Advanced Level Queries

🔟 Top 3 pizzas by revenue  
- The Thai Chicken Pizza  
- The Barbecue Chicken Pizza  
- The California Chicken Pizza  

1️⃣1️⃣ Percentage revenue contribution per pizza type  

1️⃣2️⃣ Cumulative revenue over time  
→ Used SQL Window Function (OVER ORDER BY)

1️⃣3️⃣ Top 3 pizzas by revenue within each category  

---

## 🛠️ Concepts Used

- SELECT, GROUP BY, ORDER BY  
- JOIN (INNER JOIN, USING)  
- Aggregate Functions (SUM, COUNT)  
- Subqueries  
- Window Functions (OVER)  
- Revenue Calculations  
- Date & Time Functions (HOUR)

---

## 📈 Business Insights

- Large size pizzas are most preferred  
- Chicken category generates highest revenue  
- Lunch hours are peak sales time  
- A few pizza types contribute major revenue share  
- Revenue shows steady cumulative growth over time  

---

## 🚀 Project Highlights

✔ Real-world business dataset  
✔ Multi-table joins  
✔ Revenue analysis  
✔ Category contribution analysis  
✔ Time-based trend analysis  
✔ Advanced SQL techniques  

---

## 📎 Project File

Full Project PDF:  
Pizza Project with MySQL  

---

### 👨‍💻 Created By

**Nilesh Patil**
