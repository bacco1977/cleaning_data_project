cleaning_data_project
=====================

The script implements the first 4 steps of the projectr (not the 5th) and genrates only the first tidy dataset

phase 1 - read files
==========================

in phase one the scripts reads all the relevant files.
*training set
*test set
*test subject
*training subject
*activity label
*test_activity
*training_activity

it uses read.table

phase 2 - merge 
================

The script merges the following data frames (separately)
training + test set
training + test subject
training + test activities

it uses merge

phase 3 - extract measurements
===============================
In this phase Extracts only the measurements (features)on the mean and standard deviation for each measurement.
The script applies a regular expresison to the rows:

logicalMeanStdFeatures<-allfeatures[regexpr("std",allfeatures$V2)>0 | regexpr("mean",allfeatures$V2)>0  ,c(1,2)]

phase 4 - add activities, subjects and labels
==============================================
In this phase the script merges the dataset with the activities, the activity labels and the subject.
Subjects and Activities are added to the dataset using cbind
Finally it sets the labels using the function colnames.



The script finally stores the file into the disk
