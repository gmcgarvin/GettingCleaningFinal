## README - Getting and Cleaning Data Course Project

Gerald McGarvin
Gerald.McGarvin@hotmail.com

### Project Overview: 

The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

The results of this effort are delivered as follows:
* meanBySubjectActivity.csv - a tidy data set fully described in CodeBook.md.
* run_analysis.R - the script that performs the analysis.
* codeBook.md - a code book that describes the variables, the data, and transformations performed. 

### Verifying and Reproducing the Results:

The information in this file and the script provided can be used to easily verify and reproduce my results.

* Copy the script, run_analysis.R, to a location on your system that can be accessed by RStudio.
* Edit the script and modify the setwd() statement as needed for your RStudio system.
* Note that the script will create the directories ./data/HAR within the current working directory.
* Note that the script will download and unzip the following file in that directory:
*     https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
* Note that it will take several minutes to import the data and that the data imported will consume many gigabytes of memory space.
* Start RStudio.
* In RStudio, use setwd() to access the directory where the run_analysis.R script is located.
* Execute the command to read-in and execute the script: source("./run_analysis.R")
* After several minutes, the script will complete and the RStudio prompt will return.
* Verify that the tidy data set file, meanBySubjectActivity.csv, has been written to you current working directory.
* The script removes R objects that it creates. Comment out the rm() lines if you would like to work with the objects after the script completes.


Details of the data source can be found in the following file:
*  https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
