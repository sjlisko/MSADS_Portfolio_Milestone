#!/usr/bin/env python
# coding: utf-8

# In[1]:


# to import the libraries 

import tweepy
import json
import sys
from twitter_login_fn import oauth_login
from twitter_login_fn import appauth_login
from DB_fn import save_to_DB
import pymongo 
from pymongo import MongoClient 
from bson.json_util import dumps
import pandas as pd


# In[3]:


# 

def simple_search(api, query, max_results=20):
  # the first search initializes a cursor, stored in the metadata results,
  #   that allows next searches to return additional tweets
  search_results = [status for status in tweepy.Cursor(api.search, q=query).items(max_results)]
  
  # for each tweet, get the json representation
  tweets = [tweet._json for tweet in search_results]
  
  return tweets


# In[4]:


# use a main so can get command line arguments
if __name__ == '__main__':
    # Make a list of command line arguments, omitting the [0] element
    # which is the script itself.
    args = sys.argv[1:]
    if not args or len(args) < 4:
        print('usage: python twitter_simple_search.py <query> <num tweets> <DB name> <collection name>')
        sys.exit(1)
    query = args[0]
    num_tweets = int(args[1])
    DBname = args[2]
    DBcollection = args[3]
    


# In[5]:


# to pull in api info to be able to extract tweets
api = appauth_login()
print ("Twitter Authorization: ", api)


# In[7]:


# access Twitter search
result_tweets = simple_search(api,"PPP loan", max_results = 2000)
print(result_tweets)
 
# to create a datasets of tweets that have more than 100 retweets and less than 50
# this is to examine the types of tweets that are retweeted
unpopular_tweets = []
popular_tweets = []
    
for tweet in result_tweets: 
    if tweet["retweet_count"] > 100:
        popular_tweets.append(tweet)
    elif tweet["retweet_count"] < 50:
        unpopular_tweets.append(tweet)
            
unpopular_tweets = unpopular_tweets[:100]
popular_tweets = popular_tweets[:100]


# In[10]:


# this is to examine the tweets of more than 100 retweets
    
print("Tweets with more than 100 retweets")
for tweet in popular_tweets:
    print("Created at: ", tweet["created_at"])
    print("Username: ", tweet["user"]["name"])
    print("Retweets: ", tweet["retweet_count"])
    print("Tweet text :", tweet["text"]) 
    print("\n") 


# In[11]:


# this is to examine the tweets that have less than 50 retwets

print("Tweets with less than 50 retweets")
for tweet in unpopular_tweets:
    print("Created at: ", tweet["created_at"])
    print("Username: ", tweet["user"]["name"])
    print("Retweets: ", tweet["retweet_count"])
    print("Tweet text :", tweet["text"]) 
    print("\n") 


# In[12]:


# to examine the firast 20 users and see how many that are following (friend count)
for tweet in result_tweets[:20]:
    print(tweet['user']['screen_name'],'  Friends: ',tweet['user']['friends_count'])


# In[13]:


# to create data frame
PPPtweets1_df = pd.DataFrame(result_tweets)
print(PPPtweets1_df)


# In[ ]:


# to save to MongoDB
save_to_DB('PPP1loan', 'PPP1coll', 'result_tweets')

