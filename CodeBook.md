
This code book describes the structure and the variables of the data set "Tidy_Set.txt", resulting from executing the "run_analysis.R" script.

Raw data: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

Full description of the raw data: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

You can easily read the resulting data set using the command read.table: df<-read.table("Tidy_Set.txt", header=TRUE)

dim(Tidy_Set)
str(Tidy_Set)

The resulting data frame is composed of 180 observations (rows) and 82 variables (columns).

Column 1 "subject": is a numeric identifier of the subject who performed the activity

Column 2 "activity_type": identifies the type of activity performed by the subjects. described 6 types of activities: LAYING, SITTING, STANDING, WALKING, WALKING_DOWNSTAIRS, WALKING_UPSTAIRS.

Columns 3 to 82: these are all numeric variables and represent measurements taken using the accelerometer and gyroscope 3-axial when the subject moved. Only the measurements on the mean and standard deviation have been included.
