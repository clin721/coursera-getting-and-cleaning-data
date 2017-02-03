# Code Book

This code book lists all of the data fields found in `tidy_Data.txt`. There is a subject identifier along with 6 activities and 79 different kinds of measurements.

## Process
There are 5 steps (as outlined in the project description) that were taken to create the data produced by `run_analysis.R`:
* The data is first read in and merged using the `rbind()` function. The data was merged based on the naming of the files they came from along with the dimensions of the imported data.
* Regex was used to obtain all fields that contained mean or std from the merged data, and the results from the search were used to subset the data into the desired fields. In total, the regex returned 79 results which can be found under the Measurements heading.
* The activity labels from `activity_labels.txt` are used to replace the categories that were initially read in.
* All of the vague data fields are properly renamed to more understandable names.
* A new table is generated so that each unique subject/activity pair has one data value per measurement (30 subjects x 6 activities = 180 rows)

## Identifiers
* subject : the ID given to the subject, ranging from 1 to 30
* activity : The activity performed while the measurement were taken
+ LAYING
+ SITTING
+ STANDING
+ WALKING
+ WALKING_DOWNSTAIRS
+ WALKING_UPSTAIRS

## Measurements
* tBodyAcc-mean()-X
* tBodyAcc-mean()-Y
* tBodyAcc-mean()-Z
* tBodyAcc-std()-X
* tBodyAcc-std()-Y
* tBodyAcc-std()-Z
* tGravityAcc-mean()-X
* tGravityAcc-mean()-Y
* tGravityAcc-mean()-Z
* tGravityAcc-std()-X
* tGravityAcc-std()-Y
* tGravityAcc-std()-Z
* tBodyAccJerk-mean()-X
* tBodyAccJerk-mean()-Y
* tBodyAccJerk-mean()-Z
* tBodyAccJerk-std()-X
* tBodyAccJerk-std()-Y
* tBodyAccJerk-std()-Z
* tBodyGyro-mean()-X
* tBodyGyro-mean()-Y
* tBodyGyro-mean()-Z
* tBodyGyro-std()-X
* tBodyGyro-std()-Y
* tBodyGyro-std()-Z
* tBodyGyroJerk-mean()-X
* tBodyGyroJerk-mean()-Y
* tBodyGyroJerk-mean()-Z
* tBodyGyroJerk-std()-X
* tBodyGyroJerk-std()-Y
* tBodyGyroJerk-std()-Z
* tBodyAccMag-mean()
* tBodyAccMag-std()
* tGravityAccMag-mean()
* tGravityAccMag-std()
* tBodyAccJerkMag-mean()
* tBodyAccJerkMag-std()
* tBodyGyroMag-mean()
* tBodyGyroMag-std()
* tBodyGyroJerkMag-mean()
* tBodyGyroJerkMag-std()
* fBodyAcc-mean()-X
* fBodyAcc-mean()-Y
* fBodyAcc-mean()-Z
* fBodyAcc-std()-X
* fBodyAcc-std()-Y
* fBodyAcc-std()-Z
* fBodyAcc-meanFreq()-X
* fBodyAcc-meanFreq()-Y
* fBodyAcc-meanFreq()-Z
* fBodyAccJerk-mean()-X
* fBodyAccJerk-mean()-Y
* fBodyAccJerk-mean()-Z
* fBodyAccJerk-std()-X
* fBodyAccJerk-std()-Y
* fBodyAccJerk-std()-Z
* fBodyAccJerk-meanFreq()-X
* fBodyAccJerk-meanFreq()-Y
* fBodyAccJerk-meanFreq()-Z
* fBodyGyro-mean()-X
* fBodyGyro-mean()-Y
* fBodyGyro-mean()-Z
* fBodyGyro-std()-X
* fBodyGyro-std()-Y
* fBodyGyro-std()-Z
* fBodyGyro-meanFreq()-X
* fBodyGyro-meanFreq()-Y
* fBodyGyro-meanFreq()-Z
* fBodyAccMag-mean()
* fBodyAccMag-std()
* fBodyAccMag-meanFreq()
* fBodyBodyAccJerkMag-mean()
* fBodyBodyAccJerkMag-std()
* fBodyBodyAccJerkMag-meanFreq()
* fBodyBodyGyroMag-mean()
* fBodyBodyGyroMag-std()
* fBodyBodyGyroMag-meanFreq()
* fBodyBodyGyroJerkMag-mean()
* fBodyBodyGyroJerkMag-std()
* fBodyBodyGyroJerkMag-meanFreq()

## Variables by Step

1. `train.x`, `train.y`, `train.subject`, `test.x`, `test.y`, and `test.subject` are the tables that were obtained by reading in the test and training data. `x.data`, `y.data`, and `subject.data` are the results of merging the test and training data.
2. `features` is the data read in from the features file, and wanted.indices are the features that contain either `mean` or `std`.
3. `activity` contains the labels for the activity codes contained in `activity_labels.txt`
4. `final.data` is the result of merging `x.data`, `y.data`, and `subject.data` by using `cbind()`
5. `new.data` is obtained after calculating the averages for all of the data fields in `final.data` based on subjects/activities. The result is then written into `tidy_Data.txt`



