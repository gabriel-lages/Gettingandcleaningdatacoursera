Code Book for Getting and Cleaning Data Course Project
##Coursera getdata-032
### Created by:
Gabriel Lages, 09/24/2015
###Description:
This is a code book that describes the variables, the data, and any transformations or work that I´ve performed to clean up the data

##About the Data Set
```
"The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years.
 Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, 
 LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and 
 gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.
 The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly
 partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 
 30% the test data. The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise
 filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window).
 The sensor acceleration signal, which has gravitational and body motion components, was separated using a 
 Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have
 only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window,
 a vector of features was obtained by calculating variables from the time and frequency domain."
```
**More Information at:** [DataSet Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

**Data Set Downloading Date:** 09/20/2015

###Information about the Data and variables:

- ```features_info.txt```: Contains information about the variables used on the feature vector.
- ```features.txt```: Contains a list with all features.
- ```activity_labels.txt```: Contains a list with the labels for each activity.
- ```train/X_train.txt```: Contains the Training Data.
- ```train/y_train.txt```: Contains the Training labels.
- ```test/X_test.txt```: Contains the Test Data.
- ```test/y_test.txt```: Contains the Test labels.
- ```train/subject_train.txt```: Contains a list where each row identifies the subject who performed the activity.

### Transformations in the Dataset

All the transformations have been made running a R script.

The data set has been downloaded in the [UCI Repository](http://archive.ics.uci.edu/ml/machine-learning-databases/00240/UCI%20HAR%20Dataset.zip)

* The "downloader" R package was used to do it.
```
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download(fileurl, dest="dataset.zip", mode="wb") 
```
*  The unzip function was used to extract the zip file in the directory.
```
unzip("dataset.zip")
```
* The read.table function was used to read the files.
```
x_test<-read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
Sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
Sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")
```
* cbind and rbind functions were used to merge the files.
```
db_test<-cbind(x_test,y_test)
db_test<-cbind(db_test,Sub_test)
db_train<-cbind(x_train,y_train)
db_train<-cbind(db_train,Sub_train)
db_complete<-rbind(db_test,db_train)
```
* The sapply function were used to calculate the measures for each field.
```
db_complete_mean<-sapply(db_complete,mean,na.rm=TRUE)
db_complete_sd<-sapply(db_complete,sd,na.rm=TRUE)
```
* The "data.table" R package was used to do create the final data_table
```
dt_complete <- data.table(db_complete)
tidy_file<-dt_complete[,lapply(.SD,mean),by="Activity,Subject"]
```
* The write.table function was used to create the .txt file.
```
write.table(tidy_file,file="tidy.txt",sep=",",row.names=FALSE)
```
