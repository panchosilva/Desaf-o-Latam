#!/usr/bin/env python

from pyspark.sql import SparkSession
from pyspark.sql.functions import when, col

sess = SparkSession\
        .builder\
        .master("local[*]")\
        .appName('recode-business-data')\
        .enableHiveSupport()\
        .getOrCreate()



"""
Given a business entry collection, apply the following recoding schema
"""
# load data
load_business_data = sess.read.json('subsample_business.json')


# 1 if business accepts insurance, 0 otherwise
load_business_data\
    .select(
        when((col('attributes.AcceptsInsurance') == 'True')\
             | (col('attributes.AcceptsInsurance') == "\'True\'")\
             | (col('attributes.AcceptsInsurance') == "u\'True\'"), 1)\
        .otherwise(0).alias('insurance'))

# 1 if business is age-restricted, 0 otherwise
load_business_data\
    .select(
        when((col('attributes.AgesAllowed') == 'allages')\
            | (col('attributes.AgesAllowed') == "\'allages\'")\
            | (col('attributes.AgesAllowed') == "u\'allages\'"), 1)\
        .otherwise(0).alias('all_ages_allowed'))

# 1 if business allows alcohol consumption, 0 otherwise
load_business_data\
    .select(
        when((col('attributes.Alcohol') == 'beer_and_wine')\
             | (col('attributes.Alcohol') == "\'beer_and_wine\'")\
             | (col('attributes.Alcohol') == "u\'beer_and_wine\'")\
             | (col('attributes.Alcohol') == 'full_bar')\
             | (col('attributes.Alcohol') == "\'full_bar\'")\
             | (col('attributes.Alcohol') == "u\'full_bar\'"), 1)\
        .otherwise(0).alias('alcohol_consumption'))

# 1 if business accepts bitcoin as payment method, 0 otherwise
load_business_data\
    .select(
        when((col('attributes.BusinessAcceptsBitcoin') == 'True')\
             | (col('attributes.BusinessAcceptsBitcoin') == True)\
             | (col('attributes.BusinessAcceptsBitcoin') == "\'True\'")\
             | (col('attributes.BusinessAcceptsBitcoin') == "u\'True\'"), 1)\
        .otherwise(0).alias('bitcoin_friendly'))

# 1 if business is food related, 0 otherwise
load_business_data\
    .select(
        when((col('categories').rlike('Food'))\
             | (col('categories').rlike('Restaurants'))\
             | (col('categories').rlike('Bars')), 1)\
        .otherwise(0).alias('food_business'))

# 1 if business is finance related, 0 otherwise
load_business_data\
    .select(when(
        (col('categories').rlike('Banks'))\
         | (col('categories').rlike('Insurance'))\
         | (col('categories').rlike('Finance')), 1)\
        .otherwise(0).alias('finance_business'))

# 1 if business is health related, 0 otherwise
load_business_data\
    .select(when(
        (col('categories').rlike('Fitness'))\
        | (col('categories').rlike('Hospitals'))\
        | (col('categories').rlike('Health')), 1)\
            .otherwise(0).alias('health_business'))

# 1 if business allows smoking, 0 otherwise
load_business_data\
    .select(when((col('attributes.Smoking') == '\'yes\'')\
                 |(col('attributes.Smoking') == 'u\'yes\'')\
                 |(col('attributes.Smoking') == 'yes')\
                 |(col('attributes.Smoking') == '\'outdoor\'')\
                 |(col('attributes.Smoking') == 'u\'outdoor\'')\
                 |(col('attributes.Smoking') == 'outdoor'), 1)\
           .otherwise(0).alias('smokers'))

# 1 if business offers free wifi to its customers, 0 otherwise
load_business_data\
    .select(when((col('attributes.WiFi') == '\'free\'')\
                | (col('attributes.WiFi') == 'u\'free\'')\
                | (col('attributes.WiFi') == 'free'), 1)\
           .otherwise(0).alias('free_wifi'))

# 1 if business can be considered expensive, 0 otherwise (applies only to restaurants)
load_business_data\
    .select(when((col('attributes.RestaurantsPriceRange2') == 3)\
                 | (col('attributes.RestaurantsPriceRange2') == 4), 1)\
            .otherwise(0).alias('splurge'))

# 1 if business is kid friendly, 0 otherwise
load_business_data\
    .select(when((col('attributes.GoodForKids') == 'True')\
                 | (col('attributes.GoodForKids') == True)\
                 | (col('attributes.GoodForKids') == "\'True\'")\
                 | (col('attributes.GoodForKids') == "u\'True\'"), 1)\
            .otherwise(0).alias('kids_friendly'))

# 1 if business has tv, 0 otherwise
load_business_data\
    .select(when((col('attributes.HasTV') == 'True')\
                 | (col('attributes.HasTV') == True)\
                 | (col('attributes.HasTV') == "\'True\'")\
                 | (col('attributes.HasTV') == "u\'True\'"), 1)\
            .otherwise(0).alias('has_tv'))

# 1 if business is dog friendly, 0 otherwise
load_business_data\
    .select(when((col('attributes.DogsAllowed') == 'True')\
                 | (col('attributes.DogsAllowed') == True)\
                 | (col('attributes.DogsAllowed') == "\True'\'")\
                 | (col('attributes.DogsAllowed') == "u\'True\'"), 1)\
            .otherwise(0).alias('dogs_friendly'))

# 1 if business can be considered as loud or very loud, 0 otherwise
load_business_data\
    .select(when((col('attributes.NoiseLevel') == 'loud')\
                 | (col('attributes.NoiseLevel') == "\'loud\'")\
                 | (col('attributes.NoiseLevel') == "u\'loud\'")\
                 | (col('attributes.NoiseLevel') == "very_loud")\
                 | (col('attributes.NoiseLevel') == "\'very_loud\'")\
                 | (col('attributes.NoiseLevel') == "u\'very_loud\'"), 1)\
            .otherwise(0).alias('loud_place'))

# 1 if business offers happy hours, 0 otherwise (applies only to restaurants)
load_business_data\
    .select(when((col('attributes.HappyHour') == 'True')\
                 | (col('attributes.HappyHour') == True)\
                 | (col('attributes.HappyHour') == "\'True\'")\
                 | (col('attributes.HappyHour') == "u\'True\'"), 1)\
            .otherwise(0).alias('happy_hour'))
