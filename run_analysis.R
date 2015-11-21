##############################################################################################################
#
# This R script can be used to clean data retrieved from the URL:
# https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 
# This data represens data collected from the accelerometers using the Samsung Galaxy S smartphones.
#
# The script assumes that the file is downloaded and unzipped into a folder in your working directory. 
# For detail instructions, please see README.md in the repository.
#
# The script retrieves the data from various files, merges them into one dataset, extracts data only for variables 
# with MEAN and STDDEV values, prepares a clean dataset to conform the Tidy data principles 
# and calculates average values of various variables for each subject and activity.
#
# The script also outputs the tidy data to average_data.txt text file into the working directory 
# that can be used for further data analysis.
#
##############################################################################################################


# remove all variables in the workspace
rm(list=ls())

#use reshape2 for melt, dcast etc.
library(reshape2)


# Load activity_labels 

activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activityLabels[,2] <- as.character(activityLabels[,2])

# Load features
features <- read.table("UCI HAR Dataset/features.txt")
features[,2] <- as.character(features[,2])

# retrieve only the data on mean and standard deviation, also includes MeanFreq
featuresRequired <- grep("mean|std", features[,2])

featuresRequired.names <- features[featuresRequired,2]

# Cleanup names by replacement 
featuresRequired.names = gsub('-mean', 'Mean', featuresRequired.names)
featuresRequired.names = gsub('-std', 'StdDev', featuresRequired.names)
featuresRequired.names <- gsub('[-()]', '', featuresRequired.names)


# Load train datasets
x_train <- read.table("UCI HAR Dataset/train/X_train.txt")[featuresRequired]
y_train <- read.table("UCI HAR Dataset/train/Y_train.txt")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")

#combine all train datasets
train <- cbind(subject_train, y_train, x_train)


# Load test datasets
x_test <- read.table("UCI HAR Dataset/test/X_test.txt")[featuresRequired]
y_test <- read.table("UCI HAR Dataset/test/Y_test.txt")
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")

#combine all test datasets
test <- cbind(subject_test, y_test, x_test)


# merge both train & test datasets and add column names
mergedData <- rbind(train, test)
colnames(mergedData) <- c("subject", "activity", featuresRequired.names)


# turn activities & subjects into factors
mergedData$activity <- factor(mergedData$activity, levels = activityLabels[,1], labels = activityLabels[,2])
mergedData$subject <- as.factor(mergedData$subject)


# Reshape the data into long format by subject, activity, variable and value
mergedData.melted <- melt(mergedData, id = c("subject", "activity"))

# reshape data into wide format with mean value of each variable by subject and activity
mergedData.mean <- dcast(mergedData.melted, subject + activity ~ variable, mean)


# write average data set to average_data.txt file
write.table(mergedData.mean, "average_data.txt", row.names = FALSE, quote = FALSE)
