import pandas as pd
import matplotlib.pyplot as plt

df = pd.read_csv('../data/transactions.csv')

df.dropna(inplace=True)

fraud_counts = df['is_fraud'].value_counts()
print(fraud_counts)


region_fraud = df.groupby('region')['is_fraud'].sum()
print(region_fraud)


region_fraud.plot(kind='bar')
plt.title("Fraud Cases by Region")
plt.xlabel("Region")
plt.ylabel("Fraud Count")
plt.show()

high_value = df[df['amount'] > 100000]
print(high_value.head())
