## Gerald.McGarvin@hotmail.com
## Getting and Cleaning Data Course Project

## modify the setwd statement below as needed for your environment:
## copy this file to the setwd location.
## To run this scriptin RStudio: source("./final_assignment.R")

setwd("C:/Users/F/Documents/Personal/Interests/Training/JHU_Data_Science_Courses/Course_3_Getting_and_Cleaning_Data/assignments")

## Setup needed env:
library(dplyr)
options(digits=8)

## create directories if not present:
if(!file.exists("./data")){dir.create("./data")}
if(!file.exists("./data/HAR")){dir.create("./data/HAR")}

## Download and unzip file:
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/HAR/har.zip")
unzip(zipfile = "./data/HAR/har.zip", exdir = "./data/HAR")

## Import Column Names and Activity Labels into DFs:
columnNames <- read.table("./data/HAR/UCI HAR Dataset/features.txt", sep = " ", stringsAsFactors=FALSE)
activityLabels <- read.table("./data/HAR/UCI HAR Dataset/activity_labels.txt", sep = " ", stringsAsFactors=FALSE, col.names=c("activityid","activitylabel"))

## TEST Data - Import activity ID for each TEST data record into DF:
activityIdTest <- read.table("./data/HAR/UCI HAR Dataset/test/y_test.txt", sep = " ", col.names="activityid")

## TEST Data - Import subject ID for each TEST data record into DF:
subjectIdTest <- read.table("./data/HAR/UCI HAR Dataset/test/subject_test.txt", sep = " ", col.names="subject")

## TEST Data - Add activity label to each activity ID:
activityTest <- mutate(activityIdTest, activitylabel = activityLabels[activityIdTest$activityid,2])

## TEST Data - Combine DF of activity ID and label with the DF of subject ID:
actSubTest <- cbind(subjectIdTest, activityTest)

## TRAIN Data - Import factivity ID for each TRAIN data record into DF:
activityIdTrain <- read.table("./data/HAR/UCI HAR Dataset/train/y_train.txt", sep = " ", col.names="activityid")

## TRAIN Data - Import subject ID for each TRAIN data record into DF:
subjectIdTrain <- read.table("./data/HAR/UCI HAR Dataset/train/subject_train.txt", sep = " ", col.names="subject")

## TRAIN Data - Add activity label to each activity ID:
activityTrain <- mutate(activityIdTrain, activitylabel = activityLabels[activityIdTrain$activityid,2])

## TRAIN Data - Combine DF of activity ID and label with the DF of subject ID:
actSubTrain <- cbind(subjectIdTrain, activityTrain)

## Create vector containing the width of each column in files to be imported:
colWidths <- rep.int(16, 561)

## TEST Data - import TEST data metrics:
TestMeasures <- read.fwf("./data/HAR/UCI HAR Dataset/test/X_test.txt", widths=colWidths, blank.lines.skip=TRUE, colClasses="numeric", col.names=columnNames[,2])

## TEST Data - create a vector of mean and sdt columns and use it to isolated them in the data:
colsMeanStd <- grep(".*[Mm][Ee][Aa][Nn]|[Ss][Tt][Dd].*", columnNames[,2])
TestMeanStd <- TestMeasures[,colsMeanStd]

## TEST Data - Now that the number of columns is far less, add the subject and activity columns:
TestMeanStd2 <- cbind(actSubTest, TestMeanStd)
colnames(TestMeanStd2) <- gsub("[.]","",colnames(TestMeanStd2))

## TRAIN Data - import TRAIN data metrics and combine with subject and activity columns:
TrainMeasures <- read.fwf("./data/HAR/UCI HAR Dataset/train/X_train.txt", widths=colWidths, blank.lines.skip=TRUE, colClasses="numeric", col.names=columnNames[,2])
TrainMeanStd <- TrainMeasures[,colsMeanStd]
TrainMeanStd2 <- cbind(actSubTrain, TrainMeanStd)
colnames(TrainMeanStd2) <- gsub("[.]","",colnames(TrainMeanStd2))

## Combine the TEST and TRAIN data:
AllMeanStd <- rbind(TestMeanStd2, TrainMeanStd2)

## Calculate the mean of each measure:
AllMeanStdBySubAct <- group_by(AllMeanStd, subject, activityid, activitylabel)
meanBySubjectActivity <- summarize_all(AllMeanStdBySubAct, mean, na.rm = TRUE)

## Write the new data to a file:
write.table(meanBySubjectActivity, file="./meanBySubjectActivity.csv", sep=",", row.names = FALSE)

## Remove objects no longer needed and call garbage collection:
rm(list = c("TestMeasures", "TestMeanStd", "TestMeanStd2", "TrainMeasures", "TrainMeanStd", "TrainMeanStd2", "AllMeanStd", "AllMeanStdBySubAct"))
rm(list = c("activityIdTest", "activityIdTrain", "activityLabels", "activityTest", "activityTrain", "actSubTest", "actSubTrain"))
rm(list = c("colsMeanStd", "columnNames", "colWidths", "fileUrl", "meanBySubjectActivity", "subjectIdTest", "subjectIdTrain"))
gc()




