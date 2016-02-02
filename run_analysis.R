## run_analysis.R
## Getting and Cleaning Data Course Project
## By: Birt Nieva



## It uses functions in the dplyr package to do some transformations for tidy data set 2.
## Check if dplyr package is installed and loads it.
if(!("dplyr" %in% rownames(installed.packages()))) {
    message("dplyr package missing, exiting run_script.")
    stop()
} else {
    suppressMessages(library(dplyr))
}



## Checks if directory "./data" exists. If not creates the directory ands sets it as the working directory.
if(!file.exists("./data")) {
    dir.create("./data")
}
mywd <- getwd()
setwd("./data")



# Checks if the data file set exists. If not, it downloads data into working directory.
if(!file.exists("./getdata_projectfiles_UCI_HAR_Dataset.zip")) {
    url1 <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
    download.file(url1,destfile = "./getdata_projectfiles_UCI_HAR_Dataset.zip")
} else {
    message("File 'getdata_projectfiles_UCI_HAR_Dataset.zip' already exists.")
}



## Load data set into R by reading the each file from the zip file using the unz function.
message("Loading data set into R...")
dataset_zip <- "./getdata_projectfiles_UCI_HAR_Dataset.zip"

activity <- read.table(unz(dataset_zip, "UCI HAR Dataset/activity_labels.txt"), header=FALSE)
features <- read.table(unz(dataset_zip, "UCI HAR Dataset/features.txt"), header=FALSE)

trn_s <- read.table(unz(dataset_zip, "UCI HAR Dataset/train/subject_train.txt"), header=FALSE)
trn_x <- read.table(unz(dataset_zip, "UCI HAR Dataset/train/X_train.txt"), header = FALSE)
trn_y <- read.table(unz(dataset_zip, "UCI HAR Dataset/train/y_train.txt"), header = FALSE)

tst_s <- read.table(unz(dataset_zip, "UCI HAR Dataset/test/subject_test.txt"), header = FALSE)
tst_x <- read.table(unz(dataset_zip, "UCI HAR Dataset/test/X_test.txt"), header = FALSE)
tst_y <- read.table(unz(dataset_zip, "UCI HAR Dataset/test/y_test.txt"), header = FALSE)

message("Done loading data set into R. Merging data sets.")



## (1) Merges the data set. Column 1 is the subject, column 2 is the activity type &  column 3-n are the feature data
## Merge the training data set from files: "subject_train.txt", "X_train.txt", & "y_train.txt" using cbind
trn_syx <- cbind(trn_s, trn_y, trn_x)

## Merge the test data set from files: "subject_test.txt", "X_test.txt", & "y_test.txt" using cbind
tst_syx <- cbind(tst_s, tst_y, tst_x)

## Merge the training and test data sets using rbind
syx <- rbind(trn_syx, tst_syx)

message("Done merging data sets.")



## (2) Subsets mean() and std() measurements by taking only the columns containing mean and 
## standard deviation measurements from the data set. 
message("Subsetting and labeling...")

## Create an index from "features.txt" of rows containing the strings "mean()" and "std()"
features_subs <- which(grepl("mean\\(\\)|std\\(\\)",features$V2))

## Subset the merged data set using the index, shifting index to 2 places to align with merged data
tidy_dataset_1 <- syx[,c(1,2,features_subs+2)]



## (3) Uses activity names in "activity_labels.txt" to label activity type
## Matches the numeric value in column 2 of the merged data set with value of column 1 in activity data
## for each numeric value returns the activity name and replaces the value of column 2 of the merged data.
tidy_dataset_1[,2] <- activity$V2[match(tidy_dataset_1[,2], activity$V1)]



## (4) Use variable names in "features_info.txt" to label columns.
names(tidy_dataset_1) <- c("subject", "activity", as.character(features[features_subs,]$V2))

## Modify variables to user friendly format (f - frequecny, t - time)
names(tidy_dataset_1) <- gsub("f(.*(mean|std)\\(\\))", "frequency-\\1", gsub("t(.*(mean|std)\\(\\))", "time-\\1",names(tidy_dataset_1)))
## Modify variables names with repeated string like 'BodyBody' to 'Body'
names(tidy_dataset_1) <- gsub("([a-zA-Z]+)\\1(.*)", "\\1\\2", names(tidy_dataset_1))

message("Writing tidy data set 1 to file.")

## Write result to file "tidy_dataset_1.txt"
write.table(tidy_dataset_1, "tidy_dataset_1.txt", row.names=FALSE, col.names=TRUE)



message("Creating tidy data set 2...")
## (5) Create a second tidy data set using dplyr's summarise_each with the
## average of each variable for each activity and each subject
tidy_dataset_2 <- tidy_dataset_1 %>% group_by(subject,activity) %>% summarise_each(funs(mean))

message("Writing tidy data set 2 to file.")

## Write result to file "tidy_dataset_2.txt"
write.table(tidy_dataset_2, "tidy_dataset_2.txt", row.names=FALSE, col.names=TRUE)



## (6) Clean up
## Revert working directory
setwd(mywd)

## Close connections & Cleanup workspace
rm(list=ls())
closeAllConnections()



message("run_analysis complete, exiting...")
