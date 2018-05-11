# getting-and-cleaning-data
Coursera Data Science Assignment - Getting and Cleaning Data


## About this Repository

This repository was created for a peer reviewed assignment for the John Hopkins Data Science Coursera "Getting and Cleaning Data".

The assignment references a UCI data set found here: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

## Files in the Repository

### README.md

This file

### run_analysis.R

An R script that reads in data from the UCI Human Activity Recognition Using Smartphones Data Set, joins the testing and training data sets and creates a tidy summary data set after summarising the data by subject and activity.  More details can be found in the codebook and comments within the run_analysis.R script

### UCI_tidysummary.txt

The summarised tidy data set output from the R script above.  This data can be read into R with the following command from the same working directory as the file:

`UCI_tidy<-read.table("UCI_tidysummary.txt")`
