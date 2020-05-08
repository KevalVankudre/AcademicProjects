import os
import pandas as pd
import random
from matplotlib import pyplot as plt
import seaborn as sns
import boto3

client = boto3.client('s3')

Order_totals  = pd.read_csv('https://admfinal.s3.amazonaws.com/OrderTotals.csv')

user_count = Order_totals.groupby('user_id')[['user_id']].count()

user_count.rename(columns = {'user_id':'Transaction_count'}, inplace = True) 

user_count = user_count.reset_index()

user_count1 = pd.merge(user_count, Order_totals[['user_id','cost_y']], on = 'user_id', how = 'inner') 

#as_index helps on not losing the other columns
user_count_total = user_count1.groupby(['user_id', 'Transaction_count'], as_index = False)[['cost_y']].sum()
user_count_total['avg_spend'] = user_count_total['cost_y']/user_count_total['Transaction_count']
user_count_total['spend_score'] = 0
spend_mean = user_count_total['avg_spend'].mean()
spend_median = user_count_total['avg_spend'].median()
spend_std = user_count_total['avg_spend'].std()

for ind in user_count_total.index:
    if(user_count_total['avg_spend'][ind] < (spend_median - spend_std)):
        user_count_total['spend_score'][ind] = 1
    elif((spend_median - spend_std) <= user_count_total['avg_spend'][ind] < (spend_median + spend_std)):
        user_count_total['spend_score'][ind] = 2
    elif((spend_median + spend_std) <= user_count_total['avg_spend'][ind] < (spend_median + (2*spend_std))):
        user_count_total['spend_score'][ind] = 3
    elif((spend_median + (2*spend_std)) <= user_count_total['avg_spend'][ind] < (spend_median + (3*spend_std))):
        user_count_total['spend_score'][ind] = 4
    elif((spend_median + (3*spend_std)) < user_count_total['avg_spend'][ind]):
        user_count_total['spend_score'][ind] = 5

ss1 = user_count_total["spend_score"][(user_count_total["spend_score"] == 1)]
ss2 = user_count_total["spend_score"][(user_count_total["spend_score"] == 2)]
ss3 = user_count_total["spend_score"][(user_count_total["spend_score"] == 3)]
ss4 = user_count_total["spend_score"][(user_count_total["spend_score"] == 4)]
ss5 = user_count_total["spend_score"][(user_count_total["spend_score"] == 5)]

ssx = ["1", "2", "3", "4", "5"]
ssy = [len(ss1.values), len(ss2.values), len(ss3.values), len(ss4.values), len(ss5.values)]

plt.figure(figsize=(15,6))
sns.barplot(x=ssx, y=ssy, palette="nipy_spectral_r")
plt.title("Spending Scores")
plt.xlabel("Score")
plt.ylabel("Number of Customer Having the Score")
#plt.show()
plt.savefig("out.png")
