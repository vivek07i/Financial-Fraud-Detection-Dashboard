import pandas as pd

df = pd.read_csv('transactions_500k.csv')

print("Total Records:", len(df))
print(df.head())

df.dropna(inplace=True)

df['transaction_time'] = pd.to_datetime(df['transaction_time'])
df['hour'] = df['transaction_time'].dt.hour

fraud_counts = df['is_fraud'].value_counts()
print("\nFraud Distribution:\n", fraud_counts)

fraud_percentage = (df['is_fraud'].sum() / len(df)) * 100
print(f"\nFraud Percentage: {fraud_percentage:.2f}%")

region_fraud = df.groupby('region')['is_fraud'].sum().sort_values(ascending=False)
print("\nFraud by Region:\n", region_fraud)

hourly_fraud = df.groupby('hour')['is_fraud'].sum().sort_values(ascending=False)
print("\nPeak Fraud Hours:\n", hourly_fraud.head())

high_value = df[df['amount'] > 100000]
print("\nHigh Value Transactions:\n", high_value.head())


df.to_csv('processed_transactions.csv', index=False)