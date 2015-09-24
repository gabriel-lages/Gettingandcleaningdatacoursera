## R-Script for Getting and Cleaning Data Course Project - Coursera getdata-032
## Gabriel Lages - gabrielclages@gmail.com

# Seting the Working Directory
##setwd("C:/Gabriel/Github/Gettingandcleaningdatacoursera/Gettingandcleaningdatacoursera")

# Installing Packages
install.packages("data.table")
library(data.table)

install.packages("downloader")
library("downloader")

#Downloading Data

#File URL
fileurl<- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"

#For more information about the data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

#Start the download of the file
download(fileurl, dest="dataset.zip", mode="wb") 

#Unzip the file in working directory
unzip("dataset.zip")

# Importing the Data Set

x_test<-read.table("./UCI HAR Dataset/test/X_test.txt", header = FALSE)
y_test<-read.table("./UCI HAR Dataset/test/y_test.txt", header = FALSE)
Sub_test<-read.table("./UCI HAR Dataset/test/subject_test.txt", header = FALSE)
x_train<-read.table("./UCI HAR Dataset/train/X_train.txt", header = FALSE)
y_train<-read.table("./UCI HAR Dataset/train/y_train.txt", header = FALSE)
Sub_train<-read.table("./UCI HAR Dataset/train/subject_train.txt", header = FALSE)
activities <- read.table("./UCI HAR Dataset/activity_labels.txt",header=FALSE,colClasses="character")
features <- read.table("./UCI HAR Dataset/features.txt",header=FALSE,colClasses="character")

# Creating Labels

# Activity names
y_test$V1 <- factor(y_test$V1,levels=activities$V1,labels=activities$V2)
y_train$V1 <- factor(y_train$V1,levels=activities$V1,labels=activities$V2)

#Column Names
colnames(x_test)<-features$V2
colnames(x_train)<-features$V2
colnames(y_test)<-c("Activity")
colnames(y_train)<-c("Activity")
colnames(Sub_test)<-c("Subject")
colnames(Sub_train)<-c("Subject")


#1 - Merges the training and the test sets to create one data set.

db_test<-cbind(x_test,y_test)
db_test<-cbind(db_test,Sub_test)
db_train<-cbind(x_train,y_train)
db_train<-cbind(db_train,Sub_train)
db_complete<-rbind(db_test,db_train)

head(db_complete, n=10)

#2 - Extracts only the measurements on the mean and standard deviation for each measurement. 

db_complete_mean<-sapply(db_complete,mean,na.rm=TRUE)
db_complete_sd<-sapply(db_complete,sd,na.rm=TRUE)

db_complete_mean
db_complete_sd

#3 - Uses descriptive activity names to name the activities in the data set
#It´s already done

db_complete$Activity

#4 - Appropriately labels the data set with descriptive variable names. 
#It´s already done

names(db_complete)

#5 - From the data set in step 4, creates a second, independent tidy data set 
#    with the average of each variable for each activity and each subject.

#Creating a Data Table with the Data Set
dt_complete <- data.table(db_complete)

tidy_file<-dt_complete[,lapply(.SD,mean),by="Activity,Subject"]

write.table(tidy_file,file="tidy.txt",sep=",",row.names=FALSE)


