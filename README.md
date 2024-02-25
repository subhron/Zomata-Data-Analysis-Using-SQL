# Zomata-Data-Analysis-Using-SQL

Exploring and Analyzing Zomato Data Using SQL

Many are familiar with Zomato, an Indian multinational company specializing in restaurant aggregation and food delivery services. The aim of delving into the Zomato dataset is to gain insights into the company's operations. The dataset encompasses over 9000 rows featuring various columns such as Restaurant ID, Name, City, Location, Cuisines, and more.

During the exploration of the data using SQL, several tasks were undertaken:

1. Reviewing table details including column names, data types, and constraints.
2. Detecting and addressing duplicate values within the RestaurantID column.
3. Removing unnecessary columns from the dataset.
4. Consolidating two distinct tables and introducing a new column, Country_Name, utilizing the primary key, CountryCode.
5. Correcting misspelled city names for accuracy.
6. Utilizing window functions to calculate rolling counts of restaurants.
7. Evaluating statistical metrics such as minimum, maximum, and average values for votes, ratings, and currency.
8. Introducing a new categorical column for ratings.
   
Subsequently, the focus shifted towards analyzing the data with SQL, uncovering key insights including:

1. The majority of data in the Zomato Dataset (90.67%) pertains to restaurants listed in India, followed by the USA (4.45%).
2. Among 15 countries represented, only two offer online delivery options, with approximately 28.01% of Indian restaurants and 46.67% of UAE restaurants providing this service.
3. Given the dataset's heavy emphasis on India, efforts were directed towards extracting insights on Indian restaurants.
4. Notably, Connaught Place in New Delhi boasts the highest number of listed restaurants (122), followed by Rajouri Garden (99) and Shahdara (87).
5. The favored cuisine in Connaught Place is North Indian Food.
6. Only 54 out of 122 restaurants in Connaught Place offer table booking services.
7. Restaurants in Connaught Place with table booking facilities exhibit an average rating of 3.9/5, compared to 3.7/5 for those without such provisions.
8. Kolkata, India hosts the best moderately priced restaurant meeting criteria such as an average cost for two below 1000, a rating exceeding 4, votes surpassing 4, and offering both table booking and online delivery services, specializing in Indian cuisine. This establishment is named 'India Restaurant' (RestaurantID - 20747).




