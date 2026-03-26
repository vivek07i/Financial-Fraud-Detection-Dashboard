-- Total Transactions
SELECT COUNT(*) AS total_transactions
FROM transactions;

---------------------------------------------------

-- Fraud Percentage
SELECT 
    (SUM(is_fraud) * 100.0 / COUNT(*)) AS fraud_percentage
FROM transactions;

---------------------------------------------------

-- Fraud by Region
SELECT 
    region,
    COUNT(*) AS total_transactions,
    SUM(is_fraud) AS fraud_cases
FROM transactions
GROUP BY region
ORDER BY fraud_cases DESC;

---------------------------------------------------

-- Peak Fraud Hours
SELECT 
    HOUR(transaction_time) AS hour,
    COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY hour
ORDER BY fraud_count DESC;

---------------------------------------------------

-- High Value Suspicious Transactions
SELECT *
FROM transactions
WHERE amount > 100000
AND is_fraud = 1;

---------------------------------------------------

-- CTE: User Transaction Summary
WITH user_summary AS (
    SELECT 
        region,
        COUNT(*) AS total_txn,
        SUM(amount) AS total_amount
    FROM transactions
    GROUP BY region
)
SELECT * FROM user_summary;

---------------------------------------------------

-- Window Function: Rank Regions by Fraud
SELECT 
    region,
    SUM(is_fraud) AS fraud_cases,
    RANK() OVER (ORDER BY SUM(is_fraud) DESC) AS fraud_rank
FROM transactions
GROUP BY region;