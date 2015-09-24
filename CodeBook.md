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

###Information about the Data:

- ```features_info.txt```: Contains information about the variables used on the feature vector.
- ```features.txt```: Contains a list with all features.
- ```activity_labels.txt```: Contains a list with the labels for each activity.
- ```train/X_train.txt```: Contains the Training Data.
- ```train/y_train.txt```: Contains the Training labels.
- ```test/X_test.txt```: Contains the Test Data.
- ```test/y_test.txt```: Contains the Test labels.
- ```train/subject_train.txt```: Contains a list where each row identifies the subject who performed the activity.

###Information about the Data:
