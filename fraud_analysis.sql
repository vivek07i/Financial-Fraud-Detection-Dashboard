-- Total transactions
SELECT COUNT(*) AS total_transactions FROM transactions;

-- High-risk transactions (amount > threshold)
SELECT *
FROM transactions
WHERE amount > 100000;

-- Fraud count by region
SELECT region, COUNT(*) AS fraud_cases
FROM transactions
WHERE is_fraud = 1
GROUP BY region
ORDER BY fraud_cases DESC;

-- Time-based fraud analysis
SELECT HOUR(transaction_time) AS hour, COUNT(*) AS fraud_count
FROM transactions
WHERE is_fraud = 1
GROUP BY hour
ORDER BY fraud_count DESC;
