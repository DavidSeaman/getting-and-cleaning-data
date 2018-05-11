# Code Book for the 'UCI_tidysummary.txt' data table

David Seaman - May 2018
"Getting-and-Cleaning-Data Course - John Hopkins, Data Science Course on Coursera"

To read the data in R:
`UCI_tidy<-read.table("UCI_tidysummary.txt")`

## Source Data
Data was sourced from thew UCI Machine Learning Repository, loacted here:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The original data contains a randomly split set of training and testing data incorporating results of 30 subjects carrying out 6 different activities while wearing a Samsung Smart phone.  Individual observations from the Smart Phones sensors were recorded.

## Tidy Data Summary Creation
The tidy data summary file privided in this repo (UCI_tidysummarty.txt), was created from the original UCI HAR data set in R as follows:

1. X_test, y_test, X_train and y_train - csv files read in test and train tables combined using rbind
2. Columns labeled with column names found in features.csv. "-" substituted for "_" and "()" removed
3. Activity for each observation added as a column of categorical names of the activity associated with each observation
4. Column of subject identify the subject (1-30) of each subject
5. Only "mean" and "std" data was kept, other measurements discarded
6. Finally the data was grouped by Subject and Activity, the mean of each measurement was stored in the feature columns

See run_analysis.R for a more detailed description of the data processing to create

