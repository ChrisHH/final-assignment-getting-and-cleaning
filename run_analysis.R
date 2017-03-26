#You should create one R script called run_analysis.R that does the following.
setwd("/Users/cjaehn/Documents/Getting and Cleaning the Data/Final Assignment")


#1. Merges the training and the test sets to create one data set.
 ## read all 6 files and assign to variable

x_test<-read.table("X_test.txt", header=FALSE)
x_train<-read.table("X_train.txt", header=FALSE)
y_test<-read.table("y_test.txt", header=FALSE)
y_train<-read.table("y_train.txt", header=FALSE)
subject_test<-read.table("subject_test.txt", header=FALSE)
subject_train<-read.table("subject_train.txt", header=FALSE)
activity_labels<-read.table("activity_labels.txt", header=FALSE)
features<-read.table("features.txt", header=FALSE)

  ## bring test and train together

x<-rbind(x_test,x_train)
y<-rbind(y_test,y_train)
subject<-rbind(subject_test,subject_train)

  ## rename variables

names(subject)<-c("subject")
names(y)<- c("activity")
names(x)<-features$V2

  ## bind variables together
dataset<-cbind.data.frame(x,subject)
dataset<-cbind.data.frame(dataset,y)

## final dataset ready!

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

## indicator for mean:  "mean()"
## indicator for Std-Dev: "std()"

variablen<-names(dataset)
selection<-grep("mean()",variablen)
dataset_mean<-subset(dataset,select=selection)
selection<-grep("std()",variablen)
dataset_std<-subset(dataset,select=selection)
dataset_2<-cbind(dataset_mean,dataset_std)

#3. Uses descriptive activity names to name the activities in the data set





#4. Appropriately labels the data set with descriptive variable names.
#5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.