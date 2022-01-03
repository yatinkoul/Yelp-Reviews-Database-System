# Yelp-Reviews-Database-System

## General Information

This project targets students from University of Maryland (both incoming and current), local
businesses being run in Maryland, and apartments/housing institutions in the state.
A final Tableau visualization for the end user is created so that it’s easier for them to digest and
make sense of the data.

The purpose of this project is to increase the accessibility to the amenities that College Park has to
offer, whether they are prospective students or businesses. A one-stop shop directory that is
convenient and informative.

## Tools Needed:
1. Microsoft SQL Server Management Studio or Azure Data Studio
2. Tableau or Microsoft Excel

## Data Sources and References
- All data was downloaded from Yelp [here](https://www.yelp.com/dataset/documentation/main).
- All data was not from College Park, so we have manually scrapped from the Yelp website for some businesses/restaurants that are local
- The files for each table we will be creating are in the JSON format
- Using Python we concatenate the data together and exported as a CSV file
- Using the CSV file we rearrange the columns in the same order that we put for the insert statements on SQL. This made it easier to copy each insert line on SQL. 
