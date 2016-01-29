## Human Activity Recognition Using Smartphones Dataset

#### About the Dataset

The original dataset for this project is available at:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

```
The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.


Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.
```


#### Variables

* Subject

    Identifier of the subject who carried out the experiment.

    1..30   

* Activity

    Activity performed by the subject

    1    WALKING

    2    WALKING_UPSTAIRS

    3    WALKING_DOWNSTAIRS

    4    SITTING

    5    STANDING

    6    LAYING

* Features

    The complete list of variables of each feature vector are the following:

1. tBodyAcc-mean()-X	|	282. fBodyAcc-energy()-X
2. tBodyAcc-mean()-Y	|	283. fBodyAcc-energy()-Y
3. tBodyAcc-mean()-Z	|	284. fBodyAcc-energy()-Z




