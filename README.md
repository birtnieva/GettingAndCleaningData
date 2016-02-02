# GettingAndCleaningData

## Transformations

The following describes the transformation done on the data set by the script run_analysis.R to generate the files
"tidy_data_set_1.txt" and "tidy_data_set_2.txt".

1. Merges the test data set from text files - subject_train, y_train and x_train files using cbind. Column 1 contains the train subject ID, column 2 contains the activity ID and columns 3-563 train feature data.

2. Merges the train data set from text files - subject_test, y_test and x_test using cbind. Column 1 contains the test subject ID, column 2 contains the activity ID and columns 3-563 test feature data.

3. Further combines the merged train and test data sets using rbind, creating a 10299 x 563 data set

4. Creates an index from "features.txt" of strings containing "mean()" and "std()".

5. Subsets the merged data using the columns 1, 2 and numbers from the index; creates a 10299 x 68 tidy data set.

6. Creates a vector of names using the index and applies the names to the data set.

7. Changes columns with names starting with 't' to 'time' or 'f' to 'frequency'. 

8. Changes columns with names of repeating string "BodyBody" to "Body".

9. Save the tidy data set as file: "tidy_data_set_1.txt"

10. Create another tidy data set.

11. Using dyplyr package, groups data set by subject and activity.

12. Averages data set by subject and activity.

13.  Save the tidy data set as file: "tidy_data_set_2.txt"
