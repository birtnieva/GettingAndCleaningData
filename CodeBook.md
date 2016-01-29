
# Code Book
## Getting and Cleaning Data Course Project

### Dataset
The dataset for this project is available at:
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

### Variables

Subject
    1..30

Activity
    1   WALKING
    2   WALKING_UPSTAIRS
    3   WALKING_DOWNSTAIRS
    4   SITTING
    5   STANDING
    6   LAYING

Mean Value & Standard Deviations (-1.00000000..1.00000000)
    Body Acceleration Time X Y Z
    Gravity Acceleration Time X Y Z
    Body Acceleration Jerk Time X Y Z
    Body Angular Velocity (Gyro) Time X Y Z
    Body Angular Velocity (Gyro) Jerk Time X Y Z
    Body Acceleration Magnitude Time
    Gravity Acceleration Magnitude Time
    Body Acceleration Jerk Magnitude Time
    Body Angular Velocity (Gyro) Magnitude Time
    Body Angular Velocity (Gyro) Jerk Magnitude
    Body Acceleration Frequency X Y Z
    Body Acceleration Jerk Frequency X Y Z
    Body Angular Velocity (Gyro) Frequency X Y Z
    Body Acceleration Magnitude Frequency
    Body Acceleration Jerk Magnitude Frequency
    Body Angular Velocity (Gyro) Magnitude Frequency
    Body Angular Velocity (Gyro) Jerk Magnitude Frequency

### Transformations

(1) merge training & test data sets
(2) mean and standard deviation measurements only
(3) use activity names (activity_labels.txt)
(4) use variable names (features_info.txt)
(5) saved the tidy data into file 1
(6) compute the average of each variable for each activity and each subject
(7) saved the output to second tidy data file


