
import pandas as pd
import random
from matplotlib import pyplot as plt
import seaborn as sns


data = pd.read_csv(r"C:\Vivek\NEU\ADM\Final Final\ADMApp\orders.csv")


Order_totals = pd.read_csv(r"C:\Vivek\NEU\ADM\Final Final\ADMApp\OrderTotals.csv")
Order_totals



user_count = Order_totals.groupby('user_id')[['user_id']].count()

# In[7]:


user_count.rename(columns = {'user_id':'Transaction_count'}, inplace = True) 

user_count = user_count.reset_index()


user_count = pd.merge(user_count, Order_totals[['user_id','cost_y']], on = 'user_id', how = 'inner') 

#as_index helps on not losing the other columns
user_count_total = user_count.groupby(['user_id', 'Transaction_count'], as_index = False)[['cost_y']].sum()

user_count_total['avg_spend'] = user_count_total['cost_y']/user_count_total['Transaction_count']

user_count_total['spend_score']=0


# In[18]:


spend_mean = user_count_total['avg_spend'].mean()
spend_median = user_count_total['avg_spend'].median()
spend_std = user_count_total['avg_spend'].std()
print(spend_mean)
print(spend_median)
print(spend_std)

for ind in user_count_total.index:
    if(user_count_total['avg_spend'][ind] < (spend_median - spend_std)):
        user_count_total['spend_score'][ind] = 'Coral'
    elif((spend_median - spend_std) <= user_count_total['avg_spend'][ind] < (spend_median)):
        user_count_total['spend_score'][ind] = 'Ruby'
    elif((spend_median) <= user_count_total['avg_spend'][ind] < (spend_median + spend_std)):
        user_count_total['spend_score'][ind] = 'Sapphire'
    elif((spend_median + spend_std) <= user_count_total['avg_spend'][ind] < (spend_median + (2*spend_std))):
        user_count_total['spend_score'][ind] = 'Emerald'
    elif((spend_median + (2*spend_std)) < user_count_total['avg_spend'][ind]):
        user_count_total['spend_score'][ind] = 'Diamond'


ss1 = user_count_total["spend_score"][(user_count_total["spend_score"] == 'Coral')]
ss2 = user_count_total["spend_score"][(user_count_total["spend_score"] == 'Ruby')]
ss3 = user_count_total["spend_score"][(user_count_total["spend_score"] == 'Sapphire')]
ss4 = user_count_total["spend_score"][(user_count_total["spend_score"] == 'Emerald')]
ss5 = user_count_total["spend_score"][(user_count_total["spend_score"] == 'Diamond')]
#ss21_40 = df["Spending Score (1-100)"][(df["Spending Score (1-100)"] >= 21) & (df["Spending Score (1-100)"] <= 40)]
#ss41_60 = df["Spending Score (1-100)"][(df["Spending Score (1-100)"] >= 41) & (df["Spending Score (1-100)"] <= 60)]
#ss61_80 = df["Spending Score (1-100)"][(df["Spending Score (1-100)"] >= 61) & (df["Spending Score (1-100)"] <= 80)]
#ss81_100 = df["Spending Score (1-100)"][(df["Spending Score (1-100)"] >= 81) & (df["Spending Score (1-100)"] <= 100)]
ssx = ["Coral", "Ruby", "Sapphire", "Emerald", "Diamond"]
ssy = [len(ss1.values), len(ss2.values), len(ss3.values), len(ss4.values), len(ss5.values)]
plt.figure(figsize=(15,6))
sns.barplot(x=ssx, y=ssy, palette="nipy_spectral_r")
plt.title("Spending Scores")
plt.xlabel("Score")
plt.ylabel("Number of Customer Having the Score")
plt.show()


user_count_total['gender'] = user_count_total.user_id.apply(lambda x: random.choice(['F', 'M'])) 


user_count_total['state'] = user_count_total.user_id.apply(lambda x: random.choice(['MA', 'CA','NY','NJ','OH','TX','VA','LA','TN','KY','MD','IL','AZ','FL'])) 


#Purchase Frequency is the ratio of the total number of orders and the total number of customer. 
#It represents the average number of orders placed by each customer.
purchase_frequency=sum(user_count_total['Transaction_count'])/user_count_total.shape[0]

repeat_rate=user_count_total[user_count_total.Transaction_count > 1].shape[0]/user_count_total.shape[0]

churn_rate=1-repeat_rate



# Profit Margin
user_count_total['profit_margin']=user_count_total['cost_y']*0.05

# Customer Value
user_count_total['CLV']=(user_count_total['avg_spend']*purchase_frequency)/churn_rate

clv_mean = user_count_total['CLV'].mean()
clv_median = user_count_total['CLV'].median()
clv_std = user_count_total['CLV'].std()
print(clv_mean)
print(clv_median)
print(clv_std)


#Customer lifevalue Score
spend_mean = user_count_total['avg_spend'].mean()
spend_median = user_count_total['avg_spend'].median()
spend_std = user_count_total['avg_spend'].std()
print(spend_mean)
print(spend_median)
print(spend_std)


sort_by_avg = user_count_total.sort_values('CLV')
sort_by_avg


user_count_total['clv_score'] = 0


for ind in user_count_total.index:
    if(user_count_total['CLV'][ind] < (clv_median - clv_std)):
        user_count_total['clv_score'][ind] = 1
    elif((clv_median - clv_std) <= user_count_total['CLV'][ind] < (clv_median)):
        user_count_total['clv_score'][ind] = 2
    elif((clv_median) <= user_count_total['CLV'][ind] < (clv_median + clv_std)):
        user_count_total['clv_score'][ind] = 3
    elif((clv_median + clv_std) <= user_count_total['CLV'][ind] < (clv_median + (2*clv_std))):
        user_count_total['clv_score'][ind] = 4
    elif((clv_median + (2*clv_std)) < user_count_total['CLV'][ind]):
        user_count_total['clv_score'][ind] = 5


ss1 = user_count_total["clv_score"][(user_count_total["clv_score"] == 1)]
ss2 = user_count_total["clv_score"][(user_count_total["clv_score"] == 2)]
ss3 = user_count_total["clv_score"][(user_count_total["clv_score"] == 3)]
ss4 = user_count_total["clv_score"][(user_count_total["clv_score"] == 4)]
ss5 = user_count_total["clv_score"][(user_count_total["clv_score"] == 5)]
ssx = ["1", "2", "3", "4", "5"]
ssy = [len(ss1.values), len(ss2.values), len(ss3.values), len(ss4.values), len(ss5.values)]
plt.figure(figsize=(15,6))
sns.barplot(x=ssx, y=ssy, palette="nipy_spectral_r")
plt.title("CLV Scores")
plt.xlabel("Score")
plt.ylabel("Lifetime Scores")
plt.show()

clv_df = user_count_total.groupby(['clv_score'], as_index = False)[['avg_spend']].sum()
clv_df


clv_df['acq_budget']=0

for i in clv_df.index:
    
    if (clv_df['clv_score'][i]==1):
        print(i)
        clv_df['acq_budget'][i] = ((clv_df['avg_spend'][i]) * 0.35)
    
    elif (clv_df['clv_score'][i]==2):
        print((clv_df['avg_spend'][i]))
        clv_df['acq_budget'] [i]= ((clv_df['avg_spend'][i]) * 0.25)
        
    elif (clv_df['clv_score'][i]==3):
        print((clv_df['avg_spend'][i]))
        clv_df['acq_budget'] [i]= ((clv_df['avg_spend'][i]) * 0.20)
    
    elif (clv_df['clv_score'][i]==4):
        clv_df['acq_budget'] [i] = ((clv_df['avg_spend'][i]) * 0.15)
        
    elif (clv_df['clv_score'][i]==5):
        clv_df['acq_budget'] [i] = ((clv_df['avg_spend'][i]) * 0.10)
        


clv_df


