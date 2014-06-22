Antonio Senatore - Tiny Dataset
========================================================

This is an R Markdown document for the "Cleaning Data Project"

TIny Dataset
-------------------------

The tiny dataset I provided is the first tidy dataset, after the following steps :

* Merges the training and the test sets to create one data set

* Extracts only the measurements on the mean and standard deviation for each measurement. 
* Uses descriptive activity names to name the activities in the data set
* Appropriately labels the data set with descriptive variable names. 

I missed the following step:

_Creates a second, independent tidy data set with the average of each variable for each activity and each subject_



Variables
-------------------------

Variables are only measurements (features)on the mean and standard deviation for each measurement. The script applies a regular expression  to the rows (see the script section):

These are the measurement features:

*  tBodyAcc-mean()-X
*	tBodyAcc-mean()-Y
*	tBodyAcc-mean()-Z
*	tBodyAcc-std()-X
*	tBodyAcc-std()-Y
*	tBodyAcc-std()-Z
*	tGravityAcc-mean()-X
*	tGravityAcc-mean()-Y
*	tGravityAcc-mean()-Z
*	tGravityAcc-std()-X
*	tGravityAcc-std()-Y
*	tGravityAcc-std()-Z
*	tBodyAccJerk-mean()-X
*	tBodyAccJerk-mean()-Y
*	tBodyAccJerk-mean()-Z
*	tBodyAccJerk-std()-X
*	tBodyAccJerk-std()-Y
*	tBodyAccJerk-std()-Z
*	tBodyGyro-mean()-X
*	tBodyGyro-mean()-Y
*	tBodyGyro-mean()-Z
*	tBodyGyro-std()-X
*	tBodyGyro-std()-Y
*	tBodyGyro-std()-Z
*	tBodyGyroJerk-mean()-X
*	tBodyGyroJerk-mean()-Y
*	tBodyGyroJerk-mean()-Z
*	tBodyGyroJerk-std()-X
*	tBodyGyroJerk-std()-Y
*	tBodyGyroJerk-std()-Z
*	tBodyAccMag-mean()
*	tBodyAccMag-std()
*	tGravityAccMag-mean()
*	tGravityAccMag-std()
*	tBodyAccJerkMag-mean()
*	tBodyAccJerkMag-std()
*	tBodyGyroMag-mean()
*	tBodyGyroMag-std()
*	tBodyGyroJerkMag-mean()
*	tBodyGyroJerkMag-std()
*	fBodyAcc-mean()-X
*	fBodyAcc-mean()-Y
*	fBodyAcc-mean()-Z
*	fBodyAcc-std()-X
*	fBodyAcc-std()-Y
*	fBodyAcc-std()-Z
*	fBodyAcc-meanFreq()-X
*	fBodyAcc-meanFreq()-Y
*	fBodyAcc-meanFreq()-Z
*	fBodyAccJerk-mean()-X
*	fBodyAccJerk-mean()-Y
*	fBodyAccJerk-mean()-Z
*	fBodyAccJerk-std()-X
*	fBodyAccJerk-std()-Y
*	fBodyAccJerk-std()-Z
*	fBodyAccJerk-meanFreq()-X
*	fBodyAccJerk-meanFreq()-Y
*	fBodyAccJerk-meanFreq()-Z
*	fBodyGyro-mean()-X
*	fBodyGyro-mean()-Y
*	fBodyGyro-mean()-Z
*	fBodyGyro-std()-X
*	fBodyGyro-std()-Y
*	fBodyGyro-std()-Z
*	fBodyGyro-meanFreq()-X
*	fBodyGyro-meanFreq()-Y
*	fBodyGyro-meanFreq()-Z
*	fBodyAccMag-mean()
*	fBodyAccMag-std()
*	fBodyAccMag-meanFreq()
*	fBodyBodyAccJerkMag-mean()
*	fBodyBodyAccJerkMag-std()
*	fBodyBodyAccJerkMag-meanFreq()
*	fBodyBodyGyroMag-mean()
*	fBodyBodyGyroMag-std()
*	fBodyBodyGyroMag-meanFreq()
*	fBodyBodyGyroJerkMag-mean()
*	fBodyBodyGyroJerkMag-std()
*	fBodyBodyGyroJerkMag-meanFreq()

furthermore, I have added the following:

* subject
* ActivityId
* Activity Description



Script
-------------------------


The script implements the first 4 steps of the projectr (not the 5th) and genrates only the first tidy dataset

### phase 1 - read files


in phase one the scripts reads all the relevant files.
*training set
*test set
*test subject
*training subject
*activity label
*test_activity
*training_activity

it uses read.table

### phase 2 - merge 

The script merges the following data frames (separately)
training + test set
training + test subject
training + test activities

it uses merge

### phase 3 - extract measurements

In this phase Extracts only the measurements (features)on the mean and standard deviation for each measurement.
The script applies a regular expresison to the rows:

logicalMeanStdFeatures<-allfeatures[regexpr("std",allfeatures$V2)>0 | regexpr("mean",allfeatures$V2)>0  ,c(1,2)]

### phase 4 - add activities, subjects and labels

In this phase the script merges the dataset with the activities, the activity labels and the subject.
Finally it sets the labels using the function colnames.



**The script finally stores the file into the disk**

