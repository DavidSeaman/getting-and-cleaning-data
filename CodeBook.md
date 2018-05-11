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

## UCI_tidysummary.txt Features

The data table can be read into R using the following code:
`UCI_tidy<-read.table("UCI_tidysummary.txt")`

The data table contains 180 rows and 81 columns

Each row contains a unique subject and activity, where the smart phone observartions for the unique subject and activity have been averaged.  Column names have the text string "Mean-" appended to the start of the name to identify that these are averaged values taken from the original data set.

Columns are arranged as follows:
[1] Subject
    1..30 identification of subject number 
[2] Activity
    Categorical vector identifying the Activity which is one of:
    
[3..81] Averaged data from the UCI data set as per description below:

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ
tGravityAcc-XYZ
tBodyAccJerk-XYZ
tBodyGyro-XYZ
tBodyGyroJerk-XYZ
tBodyAccMag
tGravityAccMag
tBodyAccJerkMag
tBodyGyroMag
tBodyGyroJerkMag
fBodyAcc-XYZ
fBodyAccJerk-XYZ
fBodyGyro-XYZ
fBodyAccMag
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

The set of variables that were estimated from these signals are: 

mean: Mean value
std: Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

