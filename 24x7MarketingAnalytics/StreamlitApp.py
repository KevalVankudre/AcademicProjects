import pandas as pd
import numpy as np
import seaborn as sns
from matplotlib import pyplot as plt
import streamlit as st
import plotly.graph_objects as go


import boto3
#client = boto3.client('s3')
#user_demo  = pd.read_csv('https://admfinal.s3.amazonaws.com/FinalOutput.csv')

html_temp = """
<div style="background-color:tomato;padding:15px;">
<h1><center>24x7 Marketing Analytics </center></h1>
</div>
"""

#st.markdown('<style>h1{color: red;}</style>', unsafe_allow_html=True)
st.markdown(html_temp, unsafe_allow_html=True)


## Insert multi-select box
columns = st.selectbox('What column do you want to display', ["", "Order Frequency vs Weekday", "Freq distribution by days","Frequency of Day of Week vs Hour of Day",
"Most sold products","Number of customers by States", "Number of customer orders by States"],0)


@st.cache(allow_output_mutation=True)
def load_final_data(): 
    client = boto3.client('s3')
    test = pd.read_csv('https://admfinal.s3.amazonaws.com/FinalOutput.csv')
    return test

user_demo = load_final_data()


@st.cache(allow_output_mutation=True)
def load_data(): 
    client = boto3.client('s3')
    test = pd.read_csv('https://admfinal.s3.amazonaws.com/orders.csv')
    return test

orders = load_data()


@st.cache(allow_output_mutation=True)
def load_product_data(): 
    client = boto3.client('s3')
    test = pd.read_csv('https://admfinal.s3.amazonaws.com/products.csv')
    return test

products = load_product_data()

@st.cache(allow_output_mutation=True)
def load_order_products_data(): 
    client = boto3.client('s3')
    test = pd.read_csv('https://admfinal.s3.amazonaws.com/order_products__train.csv')
    return test

order_products = load_order_products_data()


order_products__train_merged = order_products.merge(products, on='product_id')

best_seller_products = order_products__train_merged.product_name.value_counts()[0:10]

order_user = pd.merge(orders, user_demo, on = "user_id")

if columns == "Order Frequency vs Weekday":
    plt.figure(figsize=(12,8))
    sns.countplot(x="order_dow", data=orders)
    plt.ylabel('Count', fontsize=12)
    plt.xlabel('Day of week', fontsize=12)
    plt.xticks(rotation='vertical')
    plt.title("Frequency of order by week day", fontsize=15)
    plt.show()

    st.pyplot()

elif columns == "Freq distribution by days":
    plt.figure(figsize=(12,8))
    sns.countplot(x="days_since_prior_order", data=orders)
    plt.ylabel('Count', fontsize=12)
    plt.xlabel('Days since prior order', fontsize=12)
    plt.xticks(rotation='vertical')
    plt.title("Frequency distribution by days since prior order", fontsize=15)
    plt.show()

    st.pyplot()

elif columns == "Frequency of Day of Week vs Hour of Day":
    grouped_df = orders.groupby(["order_dow", "order_hour_of_day"])["order_number"].aggregate("count").reset_index()
    grouped_df = grouped_df.pivot('order_dow', 'order_hour_of_day', 'order_number')

    plt.figure(figsize=(9,6))
    sns.heatmap(grouped_df)
    plt.title("Frequency of Day of week Vs Hour of day")
    plt.show()
    st.pyplot()
    
elif columns == "Most sold products":

    plt.figure(figsize=(10,6))
    sns.barplot(x= best_seller_products.index, y=best_seller_products )
    plt.xticks(rotation=90)
    plt.show()
    st.pyplot()

elif columns == "Number of customers by States":

    fig = go.Figure(data=go.Choropleth(
        locations=user_demo.state.value_counts().index, # Spatial coordinates
        z = user_demo.state.value_counts().values, # Data to be color-coded
        locationmode = 'USA-states', # set of locations match entries in `locations`
        colorscale = 'Reds',
        colorbar_title = "Number of customers",
    ))

    fig.update_layout(
        title_text = 'Number of customers by State',
        geo_scope='usa', # limite map scope to USA
    )


    st.plotly_chart(fig)

elif columns == "Number of customer orders by States":

    fig = go.Figure(data=go.Choropleth(
        locations=order_user.state.value_counts().index, # Spatial coordinates
        z = order_user.state.value_counts().values, # Data to be color-coded
        locationmode = 'USA-states', # set of locations match entries in `locations`
        colorscale = 'Reds',
        colorbar_title = "Number of customers",
    ))

    fig.update_layout(
        title_text = 'Number of customers by State',
        geo_scope='usa', # limite map scope to USA
    )

    st.plotly_chart(fig)


plt.title("Customer Lifetime Value vs Acquisition Budget")
plt.bar([1,2,3,4,5], [8618.12,150894.27, 135581.147, 54605.007, 29605.933])
plt.xlabel("Grouped CLV Score")
plt.ylabel("Acquisition Budget per Group")
plt.legend()
st.pyplot()


