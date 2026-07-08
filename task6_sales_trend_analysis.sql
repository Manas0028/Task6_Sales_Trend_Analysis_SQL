-- =====================================================
-- TASK 6: Sales Trend Analysis Using Aggregations
-- Dataset: Sales_store_full_data
-- Database: MySQL
-- =====================================================

-- View Dataset
SELECT * FROM Sales_store_full_data;

-- =====================================================
-- 1. Monthly Revenue and Order Volume
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Amount) AS Total_Revenue,
    COUNT(DISTINCT OrderID) AS Total_Orders
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- =====================================================
-- 2. Monthly Revenue Only
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Amount) AS Monthly_Revenue
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Monthly_Revenue DESC;

-- =====================================================
-- 3. Monthly Order Volume
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    COUNT(DISTINCT OrderID) AS Order_Volume
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- =====================================================
-- 4. Average Order Value Per Month
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    ROUND(AVG(Amount),2) AS Average_Order_Value
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- =====================================================
-- 5. Highest Revenue Month
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Revenue DESC
LIMIT 1;

-- =====================================================
-- 6. Top 3 Months by Revenue
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Revenue DESC
LIMIT 3;

-- =====================================================
-- 7. Revenue by Category
-- =====================================================

SELECT
    Category,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY Category
ORDER BY Revenue DESC;

-- =====================================================
-- 8. Revenue by State
-- =====================================================

SELECT
    State,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY State
ORDER BY Revenue DESC;

-- =====================================================
-- 9. Profit by Month
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Profit) AS Total_Profit
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- =====================================================
-- 10. Monthly Quantity Sold
-- =====================================================

SELECT
    YEAR(OrderDate) AS Year,
    MONTH(OrderDate) AS Month,
    SUM(Quantity) AS Total_Quantity
FROM Sales_store_full_data
GROUP BY YEAR(OrderDate), MONTH(OrderDate)
ORDER BY Year, Month;

-- =====================================================
-- 11. Top 5 Customers by Revenue
-- =====================================================

SELECT
    CustomerName,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY CustomerName
ORDER BY Revenue DESC
LIMIT 5;

-- =====================================================
-- 12. Payment Mode Analysis
-- =====================================================

SELECT
    PaymentMode,
    COUNT(*) AS Total_Orders,
    SUM(Amount) AS Revenue
FROM Sales_store_full_data
GROUP BY PaymentMode
ORDER BY Revenue DESC;

-- =====================================================
-- End of Task
-- =====================================================
