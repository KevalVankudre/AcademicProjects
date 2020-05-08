# Marketa Analytics - Understanding Promotions

# Objective
We are supposed to study the Criteo dataset and implement various Attribution models on the dataset and find the best model. We also need to simulate the ROI for each model and comment on the best model according to our findings.

#Dataset 
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/objective.PNG)

Blog:
https://blog.griddynamics.com/cross-channel-marketing-spend-optimization-deep-learning/
 
# Clat Document
 https://docs.google.com/document/d/1DLM4eJ_ZYoxjd5eog_X3P22VM0B1l3M9zBS8Ym2FdV8/edit?ts=5e4db30e#

# Attribution Modelling

Today, people will visit your site several times prior to converting. They'll find your blog post, return directly a week later, and click a retargeting ad the next day. Then, they will finally convert!
So which marketing channel gets credit? Was your blog responsible for the new sale? Or was it your Facebook Ad?
When trying to show clients the value of each marketing channel, it can be difficult. With multiple touchpoints in the buyer journey, each channel plays its part.
These are the questions at the heart of attribution models.

Attribution modeling is a framework for analyzing which touchpoints, or marketing channels, receive credit for a conversion. Each attribution model distributes the value of a conversion across each touchpoint differently.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/attributionmodel.PNG)

A model comparison tool allows you to analyze how each model distributes the value of a conversion.

First-click attribution. The other one-touch model, first-click attribution, gives 100 percent of the credit to the first action the customer took on their conversion journey. It ignores any subsequent engagements the customer may have had with other marketing efforts before converting.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/fta.PNG)

Last-click attribution. With this model, all the credit goes to the customer’s last touchpoint before converting. This one-touch model doesn’t take into consideration any other engagements the user may with the company’s marketing efforts leading up to that last engagement.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/lta.PNG)

Linear attribution. This multi-touch attribution model gives equal credit to each touchpoint along the user’s path.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/linear.PNG)

Time decay attribution. This model gives the touchpoints that occured closer to the time of the conversion more credit than touchpoints further back in time. The closer in time to the event, the more credit a touchpoint receives.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/timedecay.PNG)

U-shaped attribution. The first and last engagement get the most credit and the rest is assigned equally to the touchpoints that occured in between. In Google Analytics, the first and last engagements are each given 40 percent of the credit and the other 20 percent is distributed equally across the middle interactions.
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/ushaped.PNG)

#Dashboards
We have used # Streamlit # to create the visualisation dashboards. We have implemented the various models on our dataset and our budget optimization algorithm  suggest that # U-shaped # attribution model gives the best ROI

First Touch Attribution
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/fta_slider.png)

Last Touch Attribution
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/ltadashboard.png)

Linear Attribution
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/lineardashboard.png)

Time- Decay Attribution
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/td_dashboard.png)

U-shaped Attribution
![]()

Budget OPtimization 
![](https://github.com/Team-11-VKAS/INFO7374DigitalMarketingAnalytics/blob/master/Assignment3/3b/images/budgetOptimization.png)
