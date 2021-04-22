# Real Estate Project 
## IronHack Mid-Bootcamp Project 
### [Sam Katterfield](https://github.com/samcana) & [Isabel Jabs](https://github.com/IsabelJabs)
### April 2021

## Content

- [Project Outline](#project-outline)
- [The Data](#the-data)
- [Visualisation](#visualisation)
- [Machine Learning](#machine-learning)
- [Review and Outlook](#review-and-outlook)
- [Links](#links)

## Project Outline

We build a machine learning model for a real estate company to predict the selling prices of houses based on a variety of features on which the value of the house is evaluated. 
The senior management of the real estate company also wants us to explore the characteristics of the houses using some business intelligence tools. One of those parameters includes understanding which factors are responsible for higher property value - $650.000 and above.

![Project_process](https://user-images.githubusercontent.com/81168853/115729162-7858de80-a385-11eb-9281-ccc290097ab7.png)

More on our workflow: [Trello Board](https://trello.com/b/ebLY8eYt/realestateproject)

Process Documentation: [Log file](https://docs.google.com/document/d/1vGG2OElHPCnsIPhQQ6l-QAzZkvlcBCnOHNquINd_YxM)

## The Data

The data contains many categorical features such as the view, condition, number of bedrooms of the houses, as well as numerical features such as squarefoot of the property, house, basement and price of the houses. 
The highest correlation in the data were between sqft_living and sqft_above with 88%, which we found through a heatmap. One of the features we dropped was therefore the sqft_living column. 
After having visualised the areas during EDA in Tableau, we created 4 areas to which we assigned the zipcodes. The 4 areas increase by increasing price per price per squarefoot. We created bins for the columns yr_renovated, yr_built and bathroom. 
We removed an outlier (33) in the number of bedrooms and changed the datetime format of the selling date as well as the categorical features to strings.
No duplicates or null values were found in the data. 

## Visualisation
For the house sizes we found there is a trend for increasing prices with increasing house size. However the scatter plot also shows a density of data points for a regular house size. There is a reference line at $650.000 houses to compare the difference to the cheaper houses.
![House_size](https://user-images.githubusercontent.com/81168853/115725218-f0bda080-a381-11eb-9c47-68dc8d388599.png)

With the features condition and grade you can see that the condition is at least at 3 for houses priced above $650.000. However most houses if above or below 650k are in condition 3. 
The trend for the grade compared to the house price is more clear. With better grades the house prices increase. 
![Condition_view](https://user-images.githubusercontent.com/81168853/115725250-f915db80-a381-11eb-8fee-f33ab584eb4d.png)

[Tableau](https://public.tableau.com/profile/sam.katterfield#!/vizhome/Tableau_Task_16190903588900/Project_House_Story?publish=yes)
[Tableau: Expensive houses](https://public.tableau.com/profile/isabeljabs#!/vizhome/Project_House/Areas?publish=yes)

## Machine Learning 
In the first iteration of the machine learning the accuracy score was R2: 73% -- test R2: 72%.

This was after we had introducted the column areas. The binning of the columns yr_renovated, yr_built and bathroom were making the accuracy of the first iteration worse, so we decided to undo that. 

Before the second iteration to improve we implied several data pre-processing steps. The logarithmic transformation for the sqft columns, for which we plotted the histograms and the qq method graph. For three of the size (sqft) columns this was a better fit. We dropped the basement size column to simplify, otherwise we could have dealt with the zeros (house has no basement). 

The graphs show that after the logarithmic transformation the histogram is close to a normal distribution. 

![Bildschirmfoto 2021-04-22 um 16 38 02](https://user-images.githubusercontent.com/81168853/115733627-57928800-a389-11eb-9051-cd2ee816c3da.png)
![Bildschirmfoto 2021-04-22 um 16 38 10](https://user-images.githubusercontent.com/81168853/115733644-5b260f00-a389-11eb-873b-c3b32a4b4601.png)

We furthermore used the normalization and standardization for the numerical columns. Unfortunately after these 3 steps the model accuracy dropped to train R2: 70% -- test R2: 66%.

The next step was to encode the categorical columns and run the third iteration: train R2: 78% -- test R2: 73%, which is better than the result of the first iteration. 
The graph shows that there are a few outliers that differ from the ideal model line. A quantile handling of the squarefoot lot like described in the outlook can be a way to improve this result.
![Screenshot 2021-04-22 at 17 04 25](https://user-images.githubusercontent.com/81168853/115740804-785ddc00-a38f-11eb-9cc1-f52230e25293.png)

[to the Jupyter Notebook](https://github.com/samcana/project_house/blob/main/machine_learning_real_estate.ipynb)

## Review and Outlook
The features for house prices above $650.000 are the condition, the house size, area and the grade. 

More features can be explored in terms of their factor in driving the house prices up.

The accuracy of the model was improved mainly by encoding the categorical columns. There can be more research in how the other data pre-processing steps have had an improving effect on the accuracy of the model by testing them isolated. 

As an outlook another step is to deal with the outliers of the sqft_lot15 column, which is the whole property of the house. The upper 25% of very large properties are 440 data rows, which can be removed and the accuracy score of the model be improved again.   

## Links
[Presentation](https://docs.google.com/presentation/d/15ReH73ckD4kU4OfbE6p0_4IH5iOdUybCF8ErZlP1mZI/edit#slide=id.g59d6898307_0_0)

[Jupyter Notebook](https://github.com/samcana/project_house/blob/main/machine_learning_real_estate.ipynb)

[Tableau](https://public.tableau.com/profile/sam.katterfield#!/vizhome/Tableau_Task_16190903588900/Project_House_Story?publish=yes)

[Tableau: Expensive houses](https://public.tableau.com/profile/isabeljabs#!/vizhome/Project_House/Areas?publish=yes)

[SQL](https://github.com/samcana/project_house/blob/main/SQL/SQL_Queries.sql)
