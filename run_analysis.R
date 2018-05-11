# run_analysis.R
# R Script - David Seaman, May 2018
# Completed for Assignment submisstion - John Hopkins, Data Science, Course 3
#
# See Readme.md for more details
# This script reads in data prvided by the UCI Machine Learning Reposoitory,
# and creates a summary tidy data set, also located in this github location
#
message("run_analysis.R")
message("Getting-And-Cleaning-Data Assignment 3")
message("<------------------------------------>")

#############################################################################
# PART 1 - Read in data and merge training and test data sets 
#############################################################################
#
# Part 1 reads in the UCI data and createes a single data set
# The data set is split in two parts  (test and train) to begin with ,
# with subject information in a separate file and activity listing also separate
message("Part 1 - Combining training and test data sets")
if (!file.exists("UCI HAR Dataset")){
  message("UCI folder not found in path, checking if the zip file exisits")
  if (!file.exists("data.zip")) {
    message("Data.zip does not exist, attempting to download..")
    fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(fileurl,"data.zip")
  }
  unzip("Data.zip")
} else {message ("   UCI HAR Dataset found, proceeding with Part 1")}
  
  
# Read in features and use for column names
# remove special characters - and () from the column names
features <-  read.delim("UCI HAR Dataset/features.txt",sep="",header=FALSE)
XColNames <- features[,2]
XColNames <- gsub("-","_",XColNames)
XColNames <- gsub("\\(\\)","",XColNames)

# Read in test data set
X_test <- read.delim("UCI HAR Dataset/test/X_test.txt",sep="",header=FALSE,col.names=XColNames)
y_test <- read.delim("UCI HAR Dataset/test/y_test.txt",sep="",header=FALSE,col.names="activity")
subject_test <- read.delim("UCI HAR Dataset/test/subject_test.txt",sep="",header=FALSE,col.names="subject")
# Read in training data set
X_train <- read.delim("UCI HAR Dataset/train/X_train.txt",sep="",header=FALSE,col.names=XColNames)
y_train <- read.delim("UCI HAR Dataset/train/y_train.txt",sep="",header=FALSE,col.names="activity")
subject_train <- read.csv("UCI HAR Dataset/train/subject_train.txt",sep="",header=FALSE,col.names="subject")

# Read in activity labels
activityLabels <- read.delim("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE)

# combine test and training data sets (X and y)
X_combined <-rbind(X_test,X_train)
y_combined <-rbind(y_test,y_train)
# Combine subject data
subject_combined <- rbind(subject_test,subject_train)

# Create Dataframe from combined data sets
UCI_df <- cbind(subject_combined,y_combined,X_combined)

######################################################################
# Part 2 - Select only mean and std summary columns
#####################################################################
# Select only mean() and std() columns from combined data set
# 
# Open for interpretation, but assuming that all column names containing 
# mean or std should be included in the final data set
message("Part 2 - Selecting mean and std columns")

# Using dplyr library - load and convert data frame
library(dplyr)
UCI <- tbl_df(UCI_df)

selectedColumns = c("subject","activity",(grep("mean|std",XColNames,value=TRUE)))

UCI <- UCI %>%
  select(one_of(selectedColumns))


###########################################################################
### PART 3 - Name activities
###########################################################################
# Uses descriptive activity names to name the activities in the data set
# 
# use the activity names downloaded in the activity.csv file to rename the factor
# values in the activity column with catergorical descriptions

message("Part 3 - Apply activity names to name the factors in the activity column")
UCI <- mutate(UCI,activity=factor(activity,1:6,activityLabels[,2]))

###########################################################################
### PART 4 - appropriately label columns
###########################################################################
# Appropriately labels the data set with descriptive variable names.
# - already using appropriate names from original data source
message("Part 4 - complete, columns labeled")
# Completed as part of the read and merge process in part 1

###########################################################################
### PART 5 - Create tidy data set
###########################################################################
# From the data set in step 4, creates a second, independent tidy data set with the 
# average of each variable for each activity and each subject.
#
# Tidy data set created by averaging data for each subject by activity 
message("Part 5 - Creating tidy data set")

# Create the summary data set
UCI_tidy <- UCI %>%
  group_by(subject,activity) %>%
  summarise_all(funs(mean)) %>%
  ungroup()  

# Apply "Mean" to the column names of the tidy data set columns to indicate they are 
# averaged data
names(UCI_tidy) <- c("subject","activity",paste0("Mean-",(grep("mean|std",XColNames,value=TRUE))))

# Write the indepedentant tidy data summary
write.table(UCI_tidy,"UCI_tidysummary.txt")

# Copy and paste code below to read data table into R:
# UCI_tidy<-read.table("UCI_tidysummary.txt")
message("   Tidy data set saved to UCI_tidysummary.txt in your cwd")
message("run_analysis.R complete")
message("<---------------------->")