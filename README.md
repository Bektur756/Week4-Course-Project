1. Unzip dataset from https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip.
2. Set as default working directory "UCI HAR Dataset" folder.
3. These files are used by script, therefore make sure files are not corrupted and exctracted properly.
    features.txt
    activity_labels.txt
    X_train.txt
    subject_train.txt
    y_train.txt
    X_test.txt
    subject_test.txt
    y_test.txt
4. Copy "run_analysis.R" in that directory and run the script in R studio.

Steps executed in the script:
1. reading above listed files
2. merging test and train files separetely with activity and subject columns
3. merging test and train files with each other
4. subseting only measurement of the mean and standard deviation
5. creating new data via aggregate function
6. writing a "txt" file Tidy_Set
