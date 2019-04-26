install.packages("plyr")
library(plyr)
library(dplyr)

files <- list.files(recursive = TRUE)

#train folder
xtrain = read.table("train/X_train.txt", header = FALSE)
ytrain = read.table("train/y_train.txt",header = FALSE)
subject_train = read.table("train/subject_train.txt",header = FALSE)

#testfolder
xtest = read.table("test/X_test.txt", header = FALSE)
ytest = read.table("test/y_test.txt",header = FALSE)
subject_test = read.table("test/subject_test.txt",header = FALSE)

#Dataset folder
features = read.table("features.txt", header = FALSE)
activity_labels = read.table("activity_labels.txt",header = FALSE)
features
activity_labels


colnames(xtrain) = features[, 2]
colnames(ytrain) = "activity_Id"
colnames(subject_train) = "subject_Id"

colnames(xtest) = features[,2]
colnames(ytest) = "activity_Id"
colnames(subject_test) = "subject_Id"

colnames(activity_labels) <- c('activity_Id','activity_Type')
activity_labels

#Merges the training and the test sets to create one data set.
train_merged <- cbind(ytrain, subject_train, xtrain)
test_merged <- cbind(ytest, subject_test, xtest)
train_merged
test_merged
both_tables_merged <- rbind(train_merged, test_merged)
dim(both_tables_merged)

#Extracts only the measurements on the mean and standard deviation for each measurement.
col_names <- colnames(both_tables_merged)
col_names
mean_and_std = (grepl("activity_Id" , col_names) | grepl("subject_Id" , col_names) | grepl("mean.." , col_names) | grepl("std.." , col_names))
mean_and_std
mean_and_std_table <- both_tables_merged[, mean_and_std]
mean_and_std_table

#Uses descriptive activity names to name the activities in the data set
activity_names = merge(mean_and_std_table, activity_labels, by='activity_Id', all.x=TRUE)
activity_names

#Appropriately labels the data set with descriptive variable names.
#Alreay done above

#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
Tidy_Set <- aggregate(. ~subject_Id + activity_Id, activity_names, mean)
Tidy_Set <- Tidy_Set[order(Tidy_Set$subject_Id, Tidy_Set$activity_Id),]
Tidy_Set

write.table(Tidy_Set, "Tidy_Set.txt", row.name=FALSE)
