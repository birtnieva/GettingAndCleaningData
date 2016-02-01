# GettingAndCleaningData

## Transformations

1. Creates a "data" directory and sets it as the working directory
2. Downloads the data set from: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
3. Loads the data set into R.
4. Merges the train data set from subject_test, y_test and x_test files by cbind.
5. Merges the test data set from subject_train, y_train and x_train files by cbind.
6. Merges the train and test data sets by rbind.
7. Creates an index from "features.txt" of strings containing "mean()" and "std()".
8. Subsets the merged data using the index.
9. Creates a vector of names using the index.
10. Applies the names to the data set and cleans names with repeated string "Body".
11. Save the tidy data set as file: "tidy_data_set_1.txt"
12. Create a copy of tidy_data_set_2 in R
13. Group data set by subject and activity using dyplyr package.
14. Average data set by subject and activity.
15.  Save the tidy data set as file: "tidy_data_set_2.txt"

