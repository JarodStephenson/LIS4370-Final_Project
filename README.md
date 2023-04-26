# LIS4370-Final_Project
BostonHousingStat

For the final project I have decided to create a package in R that will analyze a dataset called the "Boston Housing Dataset" which contains 506 observations of 14 variables. 

This package performs statistical analysis on any specified variable in the
Boston Housing Dataset, correlation analysis that will rank the most significant variables on medv, and generates three plots based on the most statistically significant variables on "medv" in the Boston Housing Dataset. This package is designed to help us see how the variables in the dataset affect the housing values.

There are three functions in this package which are: boston_stats(), BostonMEDV(), and boston_corr().

The boston_stats() function returns summary statistics of any specified variable in the Boston Housing Dataset.

The BostonMEDV() function uses correlation analysis to find the top 3 most statistically significant variables on 'medv' based on their correlation coefficent and will then plot all three against 'medv'. 

The final function is boston_corr() which performs correlation analysis and ranks the correlation of all the variables in the Boston Housing Dataset in descending order of statistical significance against 'medv'.

Link to my blog on this project:
https://wordpress.com/view/lis4370rprogramming.wordpress.com
