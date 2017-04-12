## Code Book - Getting and Cleaning Data Course Project

Gerald McGarvin
Gerald.McGarvin@hotmail.com

### Data used for this analysis: 

Human Activity Recognition Using Smartphones Dataset Version 1.0

The experiments have been carried out with 30 volunteers. Each wore a Samsung Galaxy S II smartphone on their waste while performing six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

The embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.

See the last paragraph of this document for data capture details.

### The data provided for this analysis included:

* features_info.txt: Explains the source dataset.
* features.txt: A description of each of the 561 measurements in the source dataset.
* activity_labels.txt: Links the six (6) class labels with their activity name.

* train/X_train.txt: Observations captured for subjects in the train group.
* train/y_train.txt: The activity ID for each observation in X_train.txt.
* train/subject_train.txt: The subject ID for each observation in X_train.txt.

* test/X_test.txt: Observations captured for subjects in the test group.
* test/y_test.txt: The activity ID for each observation in X_test.txt.
* test/subject_test.txt: The subject ID for each observation in X_test.txt.

### Analysis Performed:

A merged and fully identified dataset was created using the files provided:

* Imported observations for subjects in test group.
* Imported observations for subjects in train group.
* Add column labels, subject ID, and activity name from files provided.
* Reduced each data set to those variables to those representing mean or standard deviation.
* Merged the reduced data for all subjects into a single dataset.
* Calculated the mean for all variables by subject and activity.
* Exported the results to a CSV file named meanBySubjectActivity.csv.

The results are provided in the file meanBySubjectActivity.csv, which contains the mean by subject and activity of the following 89 variables:

* subject
* activityid
* activitylabel
* tBodyAccmeanX
* tBodyAccmeanY
* tBodyAccmeanZ
* tBodyAccstdX
* tBodyAccstdY
* tBodyAccstdZ
* tGravityAccmeanX
* tGravityAccmeanY
* tGravityAccmeanZ
* tGravityAccstdX
* tGravityAccstdY
* tGravityAccstdZ
* tBodyAccJerkmeanX
* tBodyAccJerkmeanY
* tBodyAccJerkmeanZ
* tBodyAccJerkstdX
* tBodyAccJerkstdY
* tBodyAccJerkstdZ
* tBodyGyromeanX
* tBodyGyromeanY
* tBodyGyromeanZ
* tBodyGyrostdX
* tBodyGyrostdY
* tBodyGyrostdZ
* tBodyGyroJerkmeanX
* tBodyGyroJerkmeanY
* tBodyGyroJerkmeanZ
* tBodyGyroJerkstdX
* tBodyGyroJerkstdY
* tBodyGyroJerkstdZ
* tBodyAccMagmean
* tBodyAccMagstd
* tGravityAccMagmean
* tGravityAccMagstd
* tBodyAccJerkMagmean
* tBodyAccJerkMagstd
* tBodyGyroMagmean
* tBodyGyroMagstd
* tBodyGyroJerkMagmean
* tBodyGyroJerkMagstd
* fBodyAccmeanX
* fBodyAccmeanY
* fBodyAccmeanZ
* fBodyAccstdX
* fBodyAccstdY
* fBodyAccstdZ
* fBodyAccmeanFreqX
* fBodyAccmeanFreqY
* fBodyAccmeanFreqZ
* fBodyAccJerkmeanX
* fBodyAccJerkmeanY
* fBodyAccJerkmeanZ
* fBodyAccJerkstdX
* fBodyAccJerkstdY
* fBodyAccJerkstdZ
* fBodyAccJerkmeanFreqX
* fBodyAccJerkmeanFreqY
* fBodyAccJerkmeanFreqZ
* fBodyGyromeanX
* fBodyGyromeanY
* fBodyGyromeanZ
* fBodyGyrostdX
* fBodyGyrostdY
* fBodyGyrostdZ
* fBodyGyromeanFreqX
* fBodyGyromeanFreqY
* fBodyGyromeanFreqZ
* fBodyAccMagmean
* fBodyAccMagstd
* fBodyAccMagmeanFreq
* fBodyBodyAccJerkMagmean
* fBodyBodyAccJerkMagstd
* fBodyBodyAccJerkMagmeanFreq
* fBodyBodyGyroMagmean
* fBodyBodyGyroMagstd
* fBodyBodyGyroMagmeanFreq
* fBodyBodyGyroJerkMagmean
* fBodyBodyGyroJerkMagstd
* fBodyBodyGyroJerkMagmeanFreq
* angletBodyAccMeangravity
* angletBodyAccJerkMeangravityMean
* angletBodyGyroMeangravityMean
* angletBodyGyroJerkMeangravityMean
* angleXgravityMean
* angleYgravityMean
* angleZgravityMean


## Data Capture Details:

Details of the data source can be found in the following file:
*  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 
