# Real Estate Project 
## IronHack Mid-Bootcamp Project 
### [Sam Katterfield](https://github.com/samcana) & [Isabel Jabs](https://github.com/IsabelJabs)
### April 2021

## Content

- [Project Outline](#project-outline)
- [The Data](#the-data)
- [Visualisation](#visualisation)
- [Machine Learning](#machine-learning)
- [Insights](#insights)
- [Review](#review)

## Project Outline

We build a machine learning model for a real estate company to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated. 
Senior management also wants to explore the characteristics of the houses using some business intelligence tools. One of those parameters includes understanding which factors are responsible for higher property value - $650K and above.

![ProjectProcess](https://user-images.githubusercontent.com/81168853/115700547-10939b00-a367-11eb-87b7-4a8cf22dd681.png)
More on our workflow: [Trello Board](https://trello.com/b/ebLY8eYt/realestateproject)

Process Documentation: [Log file](doc/Project Log)

## The Data

The data contains many categorical features such as the view, condition, number of bedrooms of the houses, as well as numerical features such as squarefoot of the property, house, basement and price of the houses. 
The highest correlation in the data were between sqft_living and sqft_above with 88%, which we found through a heatmap. One of the features we dropped was therefore the sqft_living column. 
After having visualised the areas during EDA in Tableau, we created 4 areas to which we assigned the zipcodes. The 4 areas increase by increasing price per price per squarefoot. We created bins for the columns yr_renovated, yr_built and bathroom. 
We removed an outlier (33) in the number of bedrooms. 
No duplicates or null values were found in the data. 





## Visualisation
For the house sizes we found there is a trend for increasing prices with increasing house size. However the scatter plot also shows a density of data points for a regular house size. There is a reference line at $650.000 houses to compare the difference to the cheaper houses.
![House_size](https://user-images.githubusercontent.com/81168853/115725218-f0bda080-a381-11eb-9c47-68dc8d388599.png)

With the features condition and grade you can see that the condition is at least at 3 for houses priced above $650.000. However most houses if above or below 650k are in condition 3. 
The trend for the grade compared to the house price is more clear. With better grades the house prices increase. 
![Condition_view](https://user-images.githubusercontent.com/81168853/115725250-f915db80-a381-11eb-8fee-f33ab584eb4d.png)

## Machine Learning 



## Insights

## Review

