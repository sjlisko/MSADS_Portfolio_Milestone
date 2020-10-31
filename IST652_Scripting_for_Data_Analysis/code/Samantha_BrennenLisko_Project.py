#!/usr/bin/env python
# coding: utf-8

# In[1]:


# Samantha Brennen-Lisko
# Project on PPP Loans

# Questions that will be being researched

# What Business Congressional Districts gave out the most loans?
# How many businesses were in each loan range? 
# What is the percentage of the types of business to receive the loans?
# Which businesses took out the most loans?
# Which lending banks processed the most loans?




# Import data and libraries used to examine the data
# pandas for our data frames and matplot lib for our graphs.

import pandas as pd
from matplotlib import pyplot as plt
import seaborn as sns
import numpy as np
import matplotlib.mlab as mlab
PPPloans = pd.read_csv(r'C:\Users\sjlis\Desktop\Classes\IST652 Data\PPP_data_150k_plus.csv')


# In[2]:


# Examine and clean data
# head() shows the first 5 rows
PPPloans.head()


# In[3]:


# describe() computes a summary of statistics, we are using include 'all' to see all variable
PPPloans.describe(include = 'all')


# In[4]:


## Remove a, b, c, d, e, from loan range column and confirm removal

PPPloans['LoanRange'] = PPPloans['LoanRange'].str.replace('a', '')
PPPloans['LoanRange'] = PPPloans['LoanRange'].str.replace('b', '')
PPPloans['LoanRange'] = PPPloans['LoanRange'].str.replace('c', '')
PPPloans['LoanRange'] = PPPloans['LoanRange'].str.replace('d', '')
PPPloans['LoanRange'] = PPPloans['LoanRange'].str.replace('e', '')
PPPloans.head()


# In[5]:


# to drop unneeded columns

PPPloans.drop(columns=['Address', 'NAICSCode', 'RaceEthnicity','Gender', 'Veteran', 'CD'])


# In[6]:


# Histogram of loan range
# the majority of loans are in the $150K to #350K bin

num_bins = 5
n, bins, patches = plt.hist(PPPloans.LoanRange, num_bins, facecolor='blue', alpha=0.5)
plt.xticks(rotation=45)
plt.title('Histogram of Loan Ranges')
plt.xlabel('Loan Ranges')
plt.ylabel('Count of Loans')
plt.show()


# In[7]:


# Count of loan ranges

PPPloans['LoanRange'].value_counts().plot(kind='barh', color=['red','blue'], figsize=(8, 6))
plt.xlabel("Count of Loan Ranges", labelpad=12)
plt.ylabel("Loan Ranges", labelpad=12)
plt.title("Count of Loan Ranges", y=1.02);


# In[8]:


# Count of loans by State
# California, Texas, New York, Florida have the highest loans

PPPloans['State'].value_counts().plot(kind='barh', color=['black', 'red', 'green', 'blue', 'orange'], figsize=(12, 12))
plt.xlabel("Count of Loans", labelpad=18)
plt.ylabel("State", labelpad=18)
plt.title("Count of Loans per State", y=1.02);


# In[9]:


# Stacked bar chart showing loan ranges breakdown by state
# this confirms $150K -$350K and $350K - $1M are the top two but now we can see a brakdown by state

PPPloans.groupby(['State','LoanRange']).size().unstack().plot(kind='bar',stacked=True, figsize=(12, 10))
plt.xlabel("States", labelpad=18)
plt.ylabel("Loan Ranges", labelpad=18)
plt.title("Breakdown oF Loan Count by Loan Range and State", y=1.02);
plt.show()


# In[10]:


# Count of loans by Business Type
# the top 3 busness types, C-corp, LLC and S-corp

PPPloans['BusinessType'].value_counts().plot(kind='barh', color=['red', 'green', 'blue', 'orange'], figsize=(8, 6))
plt.xlabel("Count of Loans", labelpad=18)
plt.ylabel("Business Type", labelpad=18)
plt.title("Count of Loans per Type of Business", y=1.02);


# In[11]:


# Stacked bar chart showing loan range by business type
# this confirms $150K -$350K and $350K - $1M are the top two
# the top 3 business types, C-corp, LLC, S-corp

PPPloans.groupby(['BusinessType','LoanRange']).size().unstack().plot(kind='bar',stacked=True, figsize=(8, 6))
plt.xlabel("Business Types", labelpad=12)
plt.ylabel("Count of Loans", labelpad=12)
plt.title("Breakdown oF Loan Count by Loan Range per Business Type", y=1.02);
plt.show()


# In[12]:


# Stacked bar chart showing loan range per business type
# this confirms $150K -$350K and $350K - $1M are the top two
# the top 3 business types, C-corp (Orange), LLC Brown), S-corp (Purple)

PPPloans.groupby(['LoanRange','BusinessType']).size().unstack().plot(kind='bar',stacked=True, figsize=(10, 12))
plt.xlabel("Loan Range", labelpad=12)
plt.ylabel("Count of Loans", labelpad=12)
plt.title("Breakdown oF Loan Count by Business Type per Loan Range", y=1.02);
plt.show()


# In[22]:


# Stacked bar chart showing business type by state
# this confirms $150K -$350K and $350K - $1M are the top two
# the top 3 business types, C-corp, LLC, S-corp

PPPloans.groupby(['State','BusinessType']).size().unstack().plot(kind='bar',stacked=True, figsize=(12, 12))
plt.xlabel("State", labelpad=16)
plt.ylabel("Count of Loans by Business Type", labelpad=16)
plt.title("Breakdown of Number of Loans by Business Type and State", y=1.02);
plt.show()


# In[14]:


# sum of jobs retained by state

PPPloans.groupby('State').JobsRetained.sum().plot(kind='bar', color=['black', 'red', 'green', 'blue', 'orange'], figsize=(12, 12))
plt.xlabel("State", labelpad=16)
plt.ylabel("Sum of Jobs Retained", labelpad=16)
plt.title("Sum of Jobs Reatined by State", y=1.02);
plt.show()


# In[15]:


# import ScaleFOrmatter to turn off scientific notation on the y axis
from matplotlib.ticker import ScalarFormatter


# In[16]:


# sum of jobs retianed by loan range


PPPloans.groupby('LoanRange').JobsRetained.sum().plot(kind='bar', color=['black', 'red', 'green', 'blue', 'orange'], figsize=(10, 10))
plt.xlabel("Loan Ranges", labelpad=16)
plt.ylabel("Sum of Jobs Retained", labelpad=16)
plt.title("Sum of Jobs Reatined by Loan Ranges", y=1.02);
plt.show()


# In[17]:


# sum of jobs retianed by business type


PPPloans.groupby('BusinessType').JobsRetained.sum().plot(kind='bar', color=['black', 'red', 'green', 'blue', 'orange'], figsize=(10, 10))
plt.xlabel("Business Types", labelpad=16)
plt.ylabel("Sum of Jobs Retained", labelpad=16)
plt.title("Sum of Jobs Reatined by Business Types", y=1.02);
plt.show()


# In[18]:


# line graph of sount of loans by date of loan

PPPloans.groupby('DateApproved').LoanRange.count().plot(kind='line', color=['red'], figsize=(10, 10))
plt.xlabel("Dates of Loan Approval", labelpad=16)
plt.ylabel("Number of Loans Approved", labelpad=16)
plt.title("Number of Loans Approved by Date", y=1.02);
plt.show()


# In[20]:


# count of loans by lender
# To many lenders to see if 


PPPloans.groupby('Lender').LoanRange.count().plot(kind='bar', color=['black', 'red', 'green', 'blue', 'orange'], figsize=(12, 10))
plt.xlabel("Lenders", labelpad=16)
plt.ylabel("Coubt of Loans", labelpad=16)
plt.title("Count of Loans by Lender", y=1.02);
plt.show()

