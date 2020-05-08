# 24X7 Marketing Analytics

# Clat Document

Project Proposal
https://docs.google.com/document/d/1igMoi3mZADtiqcIq8iaHGmIh9aPfQDz_IuzyJ3MWNBA/edit#

Final Document
https://docs.google.com/document/d/16JvOQND4J9NYPhTfENWLDYOoS-Mw8NRdcqVIvuBO74M/edit#heading=h.7sa4zxkhmsum


# Objective:
Marketing analytics is the practice of measuring, managing and analyzing marketing performance to maximize its effectiveness and optimize return on investment (ROI). Understanding marketing analytics allows marketers to be more efficient at their jobs and minimize wasted web marketing dollars.

Beyond the obvious sales and lead generation applications, marketing analytics can offer profound insights into customer preferences and trends.  

In this project we are focussing on the Marketting aspects of the online retail business.

# Our POC:
Our dataset has the following relationships:

We are looking at the open-sourced dataset provided by Instacart for 3 Million Orders.
https://www.Instacart.com/datasets/grocery-shopping-2017

# The dataset has the following tables:
 orders (3.4m rows, 206k users):
order_id: order identifier
user_id: customer identifier
eval_set: which evaluation set this order belongs in (see SET described below)
order_number: the order sequence number for this user (1 = first, n = nth)
order_dow: the day of the week the order was placed on
order_hour_of_day: the hour of the day the order was placed on
days_since_prior: days since the last order, capped at 30 (with NAs for order_number = 1)
 products (50k rows):
product_id: product identifier
product_name: name of the product
aisle_id: foreign key
department_id: foreign key
 aisles (134 rows):
aisle_id: aisle identifier
aisle: the name of the aisle
 departments (21 rows):
department_id: department identifier
department: the name of the department
 order_products__SET (30m+ rows):
order_id: foreign key
product_id: foreign key
add_to_cart_order: order in which each product was added to cart
reordered: 1 if this product has been ordered by this user in the past, 0 otherwise
where SET is one of the four following evaluation sets (eval_set in orders):
"prior": orders prior to that users most recent order (~3.2m orders)
"train": training data supplied to participants (~131k orders)
"test": test data reserved for machine learning competitions (~75k orders)
 

# Data Pre-processing and Data Wrangling
To remove any kind of anomalies in the dataset (remove null values, duplicate values and fill missing values)

We have used pandas, xsv and trifacta in the event of pre-processing our data for the purpose of building the dashboard.

# Key Features
Create a Market Analytics Environment
Calculate CLV 
Find the churn rate and purchase frequency
Find Customer Acquisition Cost
Customer Segmentation
Stock preddictive Analysis
Dashboard using streamlit
