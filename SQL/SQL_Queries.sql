USE house_price_regression
# Use the alter table command to drop the column date from the database, as we would not use it in the analysis with SQL. 
ALTER TABLE house_price_data
DROP COLUMN date;
# Limit your returned results to 10.
SELECT * FROM house_price_regression.house_price_data
LIMIT 10;

# Use sql query to find how many rows of data you have.
SELECT COUNT('id') FROM house_price_regression.house_price_data;

# Now we will try to find the unique values in some of the categorical columns:
# What are the unique values in the column bedrooms?
SELECT DISTINCT bedrooms FROM house_price_data;
# What are the unique values in the column bathrooms?
SELECT DISTINCT bathroom FROM house_price_data;
# What are the unique values in the column floors?
SELECT DISTINCT floors from house_price_data;
# What are the unique values in the column condition?
SELECT DISTINCT kondition from house_price_data;
# What are the unique values in the column grade?
SELECT DISTINCT grade from house_price_data;

# Arrange the data in a decreasing order by the price of the house. 
# Return only the IDs of the top 10 most expensive houses in your data.
SELECT id, price from house_price_data
ORDER BY price DESC
LIMIT 10;

# What is the average price of all the properties in your data?
SELECT avg(price) from house_price_data;

# In this exercise we will use simple group by to check the properties of some of the categorical variables in our data
# What is the average price of the houses grouped by bedrooms? 
# The returned result should have only two columns, bedrooms and Average of the prices. 
# Use an alias to change the name of the second column.
SELECT bedrooms, avg(h.price) as average_price from house_price_data h
GROUP BY h.bedrooms;

# What is the average sqft_living of the houses grouped by bedrooms? 
# The returned result should have only two columns, bedrooms and Average of the sqft_living. 
# Use an alias to change the name of the second column.
SELECT bedrooms, avg(sqft_living) as average_sqft_living from house_price_data h
GROUP BY h.bedrooms;

# What is the average price of the houses with a waterfront and without a waterfront? 
# The returned result should have only two columns, waterfront and Average of the prices. 
# Use an alias to change the name of the second column.
SELECT waterfront, avg(price) as average_price from house_price_data h
GROUP BY h.waterfront;

# Is there any correlation between the columns condition and grade? 
# You can analyse this by grouping the data by one of the variables and then aggregating the results of the other column. 
# Visually check if there is a positive correlation or negative correlation or no correlation between the variables.
SELECT avg(grade), kondition from house_price_data h
GROUP BY h.kondition
ORDER BY kondition ASC;
SELECT avg(kondition), grade from house_price_data h
GROUP BY h.grade
ORDER BY grade ASC

# One of the customers is only interested in the following houses:
# Number of bedrooms either 3 or 4
# Bathrooms more than 3
# One Floor
# No waterfront
# Condition should be 3 at least
# Grade should be 5 at least
# Price less than 300000
# For the rest of the things, they are not too concerned. Write a simple query to find what are the options available for them?
SELECT id, price FROM house_price_data
WHERE (bedrooms = 3 or 4) and (bathroom >3) and (floors= 1) and (waterfront=0) and (kondition >=3) and (grade > 4) and (price <300000);

# Your manager wants to find out the list of properties whose prices are twice more than the average of all the properties in the database. 
# Write a query to show them the list of such properties. You might need to use a sub query for this problem.
# Since this is something that the senior management is regularly interested in, create a view of the same query.
CREATE VIEW Property_price_twice_average AS
SELECT id, price 
from house_price_data
WHERE price > 2 *
(SELECT avg(price) as avg_price 
from house_price_data);
# select * from property_price_twice_average

# Most customers are interested in properties with three or four bedrooms. 
# What is the difference in average prices of the properties with three and four bedrooms?
SELECT h.bedrooms, avg(h.price) as average_price from house_price_data h
GROUP BY h.bedrooms
HAVING bedrooms BETWEEN 3 and 4;

# What are the different locations where properties are available in your database? (distinct zip codes)
SELECT DISTINCT zipcode FROM house_price_data;

# Show the list of all the properties that were renovated.
SELECT id from house_price_data 
where yr_renovated >0;

# Provide the details of the property that is the 11th most expensive property in your database.
SELECT id, price from house_price_data
ORDER BY price DESC
LIMIT 11;
# id '6065300370', price '4210000'
