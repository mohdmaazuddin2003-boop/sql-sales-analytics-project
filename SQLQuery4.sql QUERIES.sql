-- Monthly Revenue
SELECT d.month, SUM(s.total_amount) AS revenue
FROM sales s
JOIN dates d ON s.date_id = d.date_id
GROUP BY d.month
ORDER BY d.month;

-- Top Selling Category
SELECT p.category, SUM(s.quantity) AS total_sold
FROM sales s
JOIN products p ON s.product_id = p.product_id
GROUP BY p.category
ORDER BY total_sold DESC;

-- Top Customers
SELECT TOP 3 c.name, SUM(s.total_amount) AS spending
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
GROUP BY c.name
ORDER BY spending DESC;

-- Yearly Revenue
SELECT d.year, SUM(s.total_amount) AS revenue
FROM sales s
JOIN dates d ON s.date_id = d.date_id
GROUP BY d.year;

-- Sales Summary View
CREATE VIEW sales_summary AS
SELECT c.name, p.product_name, d.month, s.total_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
JOIN dates d ON s.date_id = d.date_id;

-- previous queries
SELECT * FROM sales;

GO

-- create view (must be after GO)
CREATE VIEW sales_summary AS
SELECT c.name, p.product_name, d.month, s.total_amount
FROM sales s
JOIN customers c ON s.customer_id = c.customer_id
JOIN products p ON s.product_id = p.product_id
JOIN dates d ON s.date_id = d.date_id;