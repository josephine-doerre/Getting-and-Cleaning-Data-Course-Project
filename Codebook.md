# Codebook for the "tidy_data"-set

Field of Study: Human Activity Recognition Using Smartphones

The dataset has N=180 rows and 88 columns. 180 rows have no missing values on any column.

## Resource: UCI Machine Learning Repository
Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. 
A Public Domain Dataset for Human Activity Recognition Using Smartphones. 
21th European Symposium on Artificial Neural Networks, Computational Intelligence and Machine Learning, ESANN 2013. 
Bruges, Belgium 24-26 April 2013.

activityrecognition@smartlab.ws
www.smartlab.ws

## The Study Set up
- n = 30 participants (19.48 yrs old)
- participants performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING)
- wearing a smartphone (Samsung Galaxy S II) on the waist
- the smartphone kept track of several movement parameters: 3-axial linear acceleration and 3-axial angular velocity
- the dataset was randomly partitioned into 30 % test data and 70 % train data

## Processing steps from raw to tidy data
Originally there were several raw text-files: 'features.txt'; 'train/X_train.txt': Training set; 'train/y_train.txt': Training labels; 'test/X_test.txt': Test set; 'test/y_test.txt': Test labels. 
- load required packages
- read the txt-files into R Studio with read.table("path", col.names = "...")
- get an overview of what the data look like with 'dim()' and 'str()'
- the 'feature.txt' contain the names of the 561 columns; transpose them and save as 'column_names'
- combine the 'column_names' and test and train data sets with the 'colnames'-command
- join the participants-ids, the activity-labels to the two data sets 'test' and 'train' into 'testdata' and 'traindata' (labels the data set with descriptive variable names, step 4 of the assignment)
- follow the assignment tasks: 1. Merge the training and the test sets to create one data set
- merging the two data-sets with the 'bind_rows'-command: get the new table 'all_data'
- convert the new data set into a tibble class with 'tbl_df'
- solve the second and third assignment task with a pipline sequence in R Studio
- Extract mean and standard deviation for each measurement: with the 'contains' command within 'select'
- add descriptive activity names: with the 'mutate' function
- relocate the label column to the beginning of the table
- fifth step of the assignment: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject: do this in a pipline with 'group_by' and the 'across' command within 'summarise'
- save this tidy dataset with 88 columns and 180 rows as 'tidy_data'
- save the final data set as a text-file with write.table(..., row.name=FALSE)

# Variables

## id
The unique identification number (id) of the participants of the study. 
Range from 1-30, Type: numeric

## activity
The activity label variable with 6 levels:
1: WALKING, 2: WALKING_UPSTAIRS, 3: WALKING_DOWNSTAIRS, 4: SITTING, 5: STANDING, 6: LAYING
Type: character

The other Variables come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
The acceleration signal was separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ).
Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). 
Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 
Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag.

These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.
For detailed informations visit the publishers website: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones#

## List oft all accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ in the tidy_data-set

The set of variables that were estimated from these signals are: 
mean(): Mean value
std(): Standard deviation

All following Variables are normalized and bounded within [-1,1].

- tBodyAcc-mean()-X; tBodyAcc-mean()-Y; tBodyAcc-mean()-Z
- tGravityAcc-mean()-X; tGravityAcc-mean()-Y; tGravityAcc-mean()-Z
- tBodyAccJerk-mean()-X; tBodyAccJerk-mean()-Y; tBodyAccJerk-mean()-Z
- tBodyGyro-mean()-X; tBodyGyro-mean()-Y; tBodyGyro-mean()-Z
- tBodyGyroJerk-mean()-X; tBodyGyroJerk-mean()-Y; tBodyGyroJerk-mean()-Z
- tBodyAccMag-mean()
- tGravityAccMag-mean()
- tBodyAccJerkMag-mean()
- tBodyGyroMag-mean()
- tBodyGyroJerkMag-mean()
- fBodyAcc-mean()-X; fBodyAcc-mean()-Y; fBodyAcc-mean()-Z
- fBodyAcc-meanFreq()-X; fBodyAcc-meanFreq()-Y; fBodyAcc-meanFreq()-Z
- fBodyAccJerk-mean()-X, fBodyAccJerk-mean()-Y; fBodyAccJerk-mean()-Z
- fBodyAccJerk-meanFreq()-X; fBodyAccJerk-meanFreq()-Y; fBodyAccJerk-meanFreq()-Z
- fBodyGyro-mean()-X; fBodyGyro-mean()-Y; fBodyGyro-mean()-Z
- fBodyGyro-meanFreq()-X; fBodyGyro-meanFreq()-Y; fBodyGyro-meanFreq()-Z
- fBodyAccMag-mean()
- fBodyAccMag-meanFreq()
- fBodyBodyAccJerkMag-mean()
- fBodyBodyAccJerkMag-meanFreq()
- fBodyBodyGyroMag-mean()
- fBodyBodyGyroMag-meanFreq()
- fBodyBodyGyroJerkMag-mean()
- fBodyBodyGyroJerkMag-meanFreq()
- angle(tBodyAccMean,gravity)
- angle(tBodyAccJerkMean),gravityMean)
- angle(tBodyGyroMean,gravityMean)
- angle(tBodyGyroJerkMean,gravityMean)
- angle(X,gravityMean); angle(Y,gravityMean); angle(Z,gravityMean)
- tBodyAcc-std()-X; tBodyAcc-std()-Y; tBodyAcc-std()-Z
- tGravityAcc-std()-X; tGravityAcc-std()-Y; tGravityAcc-std()-Z
- tBodyAccJerk-std()-X; tBodyAccJerk-std()-Y; tBodyAccJerk-std()-Z
- tBodyGyro-std()-X; tBodyGyro-std()-Y; tBodyGyro-std()-Z
- tBodyGyroJerk-std()-X; tBodyGyroJerk-std()-Y; tBodyGyroJerk-std()-Z
- tBodyAccMag-std()
- tGravityAccMag-std()
- tBodyAccJerkMag-std()
- tBodyGyroMag-std()
- tBodyGyroJerkMag-std()
- fBodyAcc-std()-X; fBodyAcc-std()-Y; fBodyAcc-std()-Z
- fBodyAccJerk-std()-X; fBodyAccJerk-std()-Y; fBodyAccJerk-std()-Z
- fBodyGyro-std()-X; fBodyGyro-std()-Y; fBodyGyro-std()-Z
- fBodyAccMag-std()
- fBodyBodyAccJerkMag-std()
- fBodyBodyGyroMag-std()
- fBodyBodyGyroJerkMag-std()


