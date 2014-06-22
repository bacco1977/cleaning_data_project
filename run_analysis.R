# Cleaning Data course - Project
# You should create one R script called run_analysis.R that does the following. 
#1 Merges the training and the test sets to create one data set.
#2 Extracts only the measurements on the mean and standard deviation for each measurement. 
#3 Uses descriptive activity names to name the activities in the data set
#4 Appropriately labels the data set with descriptive variable names. 
#5 Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 


# Antonio Senatore - I Have only implemented the first 4 points
# loading the training set



xtrain <- read.table (file="UCI HAR Dataset/train/x_train.txt",header=FALSE ) 
ytrain <- read.table (file="UCI HAR Dataset/train/y_train.txt",header=FALSE ) 
subjectTrain <- read.table (file="UCI HAR Dataset/train/subject_train.txt",header=FALSE ) 
activitylabel<- read.table (file="UCI HAR Dataset/activity_labels.txt",header=FALSE ) 




#loading the tests set

xtest <- read.table (file="UCI HAR Dataset/test/x_test.txt",header=FALSE ) 
ytest<- read.table (file="UCI HAR Dataset/test/y_test.txt",header=FALSE ) 
subjecttest<- read.table (file="UCI HAR Dataset/test/subject_test.txt",header=FALSE ) 



# merge test and training  sets and merge the activities into a separate vector
totalactivities<- rbind(ytrain,ytest)
totalsubject<- rbind(subjectTrain,subjecttest)
mergedata<- rbind(totaltrain,totaltest)


#Extracts only the measurements (features)on the mean and standard deviation for each measurement. 

allfeatures<-read.table (file="UCI HAR Dataset/features.txt",header=FALSE ) 

logicalMeanStdFeatures<-allfeatures[regexpr("std",allfeatures$V2)>0 | regexpr("mean",allfeatures$V2)>0  ,c(1,2)]
#logicalMeanStdFeatures<-regexpr("std",allfeatures$V2)>0 | regexpr("mean",allfeatures$V2)>0

#creates a new dataset with only the selected features
  
columnvector<- logicalMeanStdFeatures[,1]

finalDataset <- mergedata[,c(columnvector)]

#add the activities

finalDataset <-cbind (finalDataset,totalactivities)
# giving meaningful name to the columns
colnames(finalDataset)<-logicalMeanStdFeatures[,2]
#add the activities labels

colnames(finalDataset)[length(colnames(finalDataset))]<-"ActivityId"
#Add the activityId lable
finalDataset <- merge(finalDataset,activitylabel,by.x="ActivityId",by.y="V1")
colnames(finalDataset)[length(colnames(finalDataset))]<-"Activity Description"

# adding the subject and the label

finalDataset <-cbind (finalDataset,totalsubject)
colnames(finalDataset)[length(colnames(finalDataset))]<-"Subject"
write.csv(finalDataset,"tidydataset1.txt")

#I Have implemented only the first dataset. 
# I have not implemented the second dataset - Point 5






  