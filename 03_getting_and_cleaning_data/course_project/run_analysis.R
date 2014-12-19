## Course: Getting and Cleaning Data (getdata-016)
## Author: Tommaso Bolis
## Course project assignment:
## - You should create one R script called run_analysis.R that does the following. 
##   1. Merges the training and the test sets to create one data set.
##   2. Extracts only the measurements on the mean and standard deviation for each measurement. 
##   3. Uses descriptive activity names to name the activities in the data set
##   4. Appropriately labels the data set with descriptive variable names. 
##   5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

## Step 1. Merges the training and the test sets to create one data set.

# Uses "rbind" and "cbind" function for merging training and testing datasets
dataset = 
    rbind(
        cbind(
            read.csv("UCI HAR Dataset/train/X_train.txt", sep="", header=FALSE),
            read.csv("UCI HAR Dataset/train/Y_train.txt", sep="", header=FALSE),
            read.csv("UCI HAR Dataset/train/subject_train.txt", sep="", header=FALSE)
        ),
        cbind(
            read.csv("UCI HAR Dataset/test/X_test.txt", sep="", header=FALSE),
            read.csv("UCI HAR Dataset/test/Y_test.txt", sep="", header=FALSE),
            read.csv("UCI HAR Dataset/test/subject_test.txt", sep="", header=FALSE)
        )
    )

## Step 2. Extracts only the measurements on the mean and standard deviation for each measurement. 

# Loads features file containing dataset column names
features = read.csv("UCI HAR Dataset/features.txt", sep="", header=FALSE, col.names= c("code", "name"))
features = features[grep(".*mean.*|.*std.*|.*Mean.*", features$name),]
dataset <- dataset[,c(features$code , dim(dataset)[2] -1, dim(dataset)[2])]

## Step 3. Uses descriptive activity names to name the activities in the data set

# Loads activity labels file
activities <- read.csv("UCI HAR Dataset/activity_labels.txt", sep="", header=FALSE, col.names= c("code", "name"))
dataset[,dim(dataset)[2] -1] = activities$name[dataset[,dim(dataset)[2] - 1]]

## Step 4. Appropriately labels the data set with descriptive variable names. 

# Make features names more readable
features$name = gsub('-mean', 'Mean', features$name)
features$name = gsub('-std', 'Std', features$name)
features$name = gsub('[-()]', '', features$name)
names(dataset) <- c(as.vector(features$name), "activity", "subject")

## Step 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

tidyDataset <- aggregate(dataset, by=list(activity = dataset$activity, subject=dataset$subject), mean)
tidyDataset <- tidyDataset[,1:(dim(tidyDataset)[2] - 2)]

# Writes tidy dataset on file
write.table(tidyDataset, "tidy.txt", sep="\t", row.name=FALSE)
