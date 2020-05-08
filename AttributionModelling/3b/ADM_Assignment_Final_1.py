#!/usr/bin/env python
# coding: utf-8

# In[6]:


#!/usr/bin/env python
# coding: utf-8

# In[12]:


import pandas as pd
import matplotlib.pyplot as plt 
import numpy as np
from sklearn.utils import resample
from sklearn.preprocessing import MinMaxScaler
from sklearn.model_selection import train_test_split
import keras
import streamlit as st
plt.style.use('ggplot')


# In[15]:


def add_derived_columns(df):
    df_ext = df.copy()
    df_ext['jid'] = df_ext['uid'].map(str) + '_' + df_ext['conversion_id'].map(str)
    
    min_max_scaler = MinMaxScaler()
    for cname in ('timestamp', 'time_since_last_click'):
        x = df_ext[cname].values.reshape(-1, 1) 
        df_ext[cname + '_norm'] = min_max_scaler.fit_transform(x)
    
    return df_ext

def filter_journeys_by_length(df, min_touchpoints):
    if min_touchpoints <= 1:
        return df
    else:
        grouped = df.groupby(['jid'])['uid'].count().reset_index(name="count")
        return df[df['jid'].isin( grouped[grouped['count'] >= min_touchpoints]['jid'].values )]

def sample_campaigns(df, n_campaigns):    
    campaigns = np.random.choice( df['campaign'].unique(), n_campaigns, replace = False )
    return df[ df['campaign'].isin(campaigns) ]

def balance_conversions(df):
    df_minority = df[df.conversion == 1]
    df_majority = df[df.conversion == 0]
    
    df_majority_jids = np.array_split(df_majority['jid'].unique(), 100 * df_majority.shape[0]/df_minority.shape[0] )
    
    df_majority_sampled = pd.DataFrame(data=None, columns=df.columns)
    for jid_chunk in df_majority_jids:
        df_majority_sampled = pd.concat([df_majority_sampled, df_majority[df_majority.jid.isin(jid_chunk)]])
        if df_majority_sampled.shape[0] > df_minority.shape[0]:
            break
    
    return pd.concat([df_majority_sampled, df_minority]).sample(frac=1).reset_index(drop=True)

def map_one_hot(df, column_names, result_column_name):
    mapper = {} 
    for i, col_name in enumerate(column_names):
        for val in df[col_name].unique():
            mapper[str(val) + str(i)] = len(mapper)
         
    df_ext = df.copy()
    
    def one_hot(values):
        v = np.zeros( len(mapper) )
        for i, val in enumerate(values): 
            v[ mapper[str(val) + str(i)] ] = 1
        return v    
    
    df_ext[result_column_name] = df_ext[column_names].values.tolist()
    df_ext[result_column_name] = df_ext[result_column_name].map(one_hot)
    
    return df_ext
    
#data_file = 'C:/Vivek/NEU/ADM/Assignment3/pcb_dataset_final.tsv'

@st.cache
def load_data():
    dfp = pd.read_csv(r'C:/Vivek/NEU/ADM/Assignment3/pcb_dataset_final_sample.csv')
    return dfp;

df0 = load_data()

   

n_campaigns = 100

df1 = add_derived_columns(df0)
df2 = sample_campaigns(df1, n_campaigns)
df3 = filter_journeys_by_length(df2, 2)
df4 = balance_conversions(df3)
df5 = map_one_hot(df4, ['cat1', 'cat2', 'cat3', 'cat4', 'cat5', 'cat6', 'cat8'], 'cats')
df6 = map_one_hot(df5, ['campaign'], 'campaigns').sort_values(by=['timestamp_norm'])
print(df6.shape[0])
print( df6[df6.conversion == 1].shape[0])

# Time Decay

df6['day'] = np.floor(df0.timestamp / 86400.).astype(int) 
d = df6.groupby(['uid']).count()
df_converted_test = df6[df6['conversion'] == 1]
df6_max_day_dict = {}
for uid in df_converted_test['uid'].unique():
    df6_max_day_dict[uid] = df_converted_test[df_converted_test['uid'] == uid]['day'].max()





# In[16]:


# Data exploration

def journey_lenght_histogram(df):
    counts = df.groupby(['jid'])['uid'].count().reset_index(name="count").groupby(['count']).count()
    return counts.index, counts.values / df.shape[0]

hist_x, hist_y = journey_lenght_histogram(df4)

plt.plot(range(len(hist_x)), hist_y, label='all journeys')
plt.yscale('log')
plt.xlim(0, 120)
plt.xlabel('Journey length (number of touchpoints)')
plt.ylabel('Fraction of journeys')


# In[17]:

#Time Decay
def time_decay_touch_attribution(df):
    
    def count_by_campaign(df):
        counters = np.zeros(n_campaigns)
        for campaign_one_hot in df['campaigns'].values:
            campaign_id = np.argmax(campaign_one_hot)
            counters[campaign_id] = counters[campaign_id] + 1
        return counters
        
    campaign_impressions = count_by_campaign(df)
    
    def count_by_timedecay_campaign(df):
        counters = np.zeros(n_campaigns)
        for campaign_one_hot, day, uid in zip(df['campaigns'].values, df['day'].values, df['uid'].values):
            campaign_id = np.argmax(campaign_one_hot)
            time_decay_coefficient = 2**(-(df6_max_day_dict[uid] - day)/7)
            counters[campaign_id] = counters[campaign_id] + time_decay_coefficient
        return counters
    
    df_converted = df[df['conversion'] == 1]
    campaign_conversions = count_by_timedecay_campaign(df_converted)
        
    return campaign_conversions / campaign_impressions
    
tdta = time_decay_touch_attribution(df6)

#U Shaped

#LTA
def last_touch_attribution(df):
    
    def count_by_campaign(df):
        counters = np.zeros(n_campaigns)
        for campaign_one_hot in df['campaigns'].values:
            campaign_id = np.argmax(campaign_one_hot)
            counters[campaign_id] = counters[campaign_id] + 1
        return counters
        
    campaign_impressions = count_by_campaign(df)
    
    df_converted = df[df['conversion'] == 1]
    idx = df_converted.groupby(['jid'])['timestamp_norm'].transform(max) == df_converted['timestamp_norm']
    campaign_conversions = count_by_campaign(df_converted[idx])
        
    return campaign_conversions / campaign_impressions
    
lta = last_touch_attribution(df6)


#FTA
def first_touch_attribution(df):
    
    def count_by_campaign(df):
        counters = np.zeros(n_campaigns)
        for campaign_one_hot in df['campaigns'].values:
            campaign_id = np.argmax(campaign_one_hot)
            counters[campaign_id] = counters[campaign_id] + 1
        return counters
        
    campaign_impressions = count_by_campaign(df)
    
    df_converted = df[df['conversion'] == 1]
    idx = df_converted.groupby(['jid'])['timestamp_norm'].transform(min) == df_converted['timestamp_norm']
    campaign_conversions = count_by_campaign(df_converted[idx])
        
    return campaign_conversions / campaign_impressions
    
fta = first_touch_attribution(df6)


#Linear Attribution
def linear_attribution(df):
    
    def count_by_campaign(df):
        counters = np.zeros(n_campaigns)
        for campaign_one_hot in df['campaigns'].values:
            campaign_id = np.argmax(campaign_one_hot)
            counters[campaign_id] = counters[campaign_id] + 1
        return counters
        
    campaign_impressions = count_by_campaign(df)
    
    df_converted = df[df['conversion'] == 1]
    campaign_conversions = count_by_campaign(df_converted)
        
    return campaign_conversions / campaign_impressions
    
la = linear_attribution(df6)



#pitches = [0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0]
#attributions = [tdta, lta,fta, la]
#for i, pitch in enumerate(pitches):
 #   for j, attribution in enumerate(attributions):
  #      reward = simulate_budget_roi(df6, 10000, attribution**pitch)

# Visualization of the attribution scores

campaign_idx = range(0, 100)

fig = plt.figure()
#ax = fig.add_subplot(111)
plt.bar( range(len(lta[campaign_idx])), lta[campaign_idx], label='LTA' )
plt.xlabel('Campaign ID')
plt.ylabel('Return per impression')
plt.legend(loc='upper left')



campaign_idx = range(0, 100)

fig2 = plt.figure()
ax2 = fig.add_subplot(111)
graph2 = plt.bar( range(len(la[campaign_idx])), la[campaign_idx], label='LINEAR' )
plt.xlabel('Campaign ID')
plt.ylabel('Return per impression')
plt.legend(loc='upper left')


campaign_id = range(0, 100)

fig3 = plt.figure()
ax3 = fig.add_subplot(111)
plt.bar( range(len(tdta[campaign_id])), tdta[campaign_id], label='Time Decay' )
plt.xlabel('Campaign ID')
plt.ylabel('Return per impression')
plt.legend(loc='upper left')
# In[19]:


st.markdown(
"""
This is a demo dashboard for various attribution models.
""")

page = st.sidebar.selectbox("Choose a page", ["FTA", "LTA","Linear","U Shape","Time Decay","Budget Optimization"])
if page == "FTA":
    if st.checkbox('Show dataframe'):
       st.title("First Touch Attribution Model")
       yfilter = st.slider('Select max value for range',1,99)
       campaign_idx = range(0, yfilter)
       fig1 = plt.figure()
       ax1 = fig.add_subplot(111)
       graph1 = plt.bar( range(len(fta[campaign_idx])), fta[campaign_idx], label='FTA' )
       plt.xlabel('Campaign ID')
       plt.ylabel('Return per impression')
       plt.legend(loc='upper left')
       st.pyplot(fig1)
   
elif page == "LTA":
    st.title("Last Touch Attribution Model")
    st.pyplot(fig)
elif page == "Linear":
    st.title("Linear Attribution Model")
    st.pyplot(fig2)
elif page == "Time Decay":
    st.title("Time Decay Attribution Model")
    st.pyplot(fig3)
elif page == "Budget Optimization":
    st.title("Budget Optimization")
    figfinal = plt.figure()
    plt.scatter([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [418,436,454,482,492,517,555,608], c="b", label = "LTA")
    plt.plot([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [418,436,454,482,492,517,555,608])
    plt.scatter([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [418,436,454,482,492,517,555,608], label = "FTA")
    plt.plot([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [418,436,454,482,492,517,555,608])
    plt.scatter([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [411,431,435,432,427,425,433,432], c="r", label = "LA")
    plt.plot([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [411,431,435,432,427,425,433,432], c="r")
    ##TDA
    plt.scatter([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [384,398,445,479,516,555,606,664], c="g", label = "TDA")
    plt.plot([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [384,398,445,479,516,555,606,664], c="g")
    ##USA
    plt.scatter([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [387,405,453,509,567,591,604,624], c="y", label = "USA")
    plt.plot([0.1, 0.25, 0.5, 1.0, 1.5, 2.0, 2.5, 3.0], [387,405,453,509,567,591,604,624], c="y")
    plt.legend()    
    st.pyplot(figfinal)

# In[ ]:




