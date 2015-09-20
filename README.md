# Getting and Cleaning Data Coursera
This is a repo created by Gabriel Lages for the Course "Getting and Cleaning Data" (09/20/2015)

## Introduction

This repository contains the R code for the assignment of the Course "Getting and Cleaning Data" and the purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 

## Data Set

For this assignment we will use the dataset "Human Activity Recognition Using Smartphones" containing the data of a experiment  that have been carried out with a group of 30 volunteers. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

A full description is available at the website where the data was obtained:
[Data Set Website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

##Files and Execution

* **Data Set:** The Data Set used in this project has been stored in ```UCI HAR Dataset/``` Directory

* **Codebook.md:**

* **run_analysis.R:** The file ```run_analysis.R``` contains the script of the project and does the following:
 1. Merges the training and the test sets to create one data set.
 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
 3. Uses descriptive activity names to name the activities in the data set
 4. Appropriately labels the data set with descriptive variable names. 
 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each     activity and each subject.

* **tidy.csv:** The output of the course project has been stored in the file ``` tidy.csv```

