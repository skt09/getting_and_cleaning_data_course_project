The **run_analysis.R** script contains the steps for the analysis as per instruction after downloading the dataset.

# Variables

***
1. **Loading Datasets into R**
***
    * features <- features.txt : 561 rows, 2 columns 
        The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ.
    * activity <- activity_labels.txt : 6 rows, 2 columns 
        List of activities performed when the corresponding measurements were taken and its codes (labels)
    * subject_test <- test/subject_test.txt : 2947 rows, 1 column 
        Contains test data of 9/30 volunteer test subjects being observed
    * x_test <- test/X_test.txt : 2947 rows, 561 columns 
        Contains recorded features test data
    * y_test <- test/y_test.txt : 2947 rows, 1 columns 
        Contains test data of activities’code labels
    * subject_train <- test/subject_train.txt : 7352 rows, 1 column 
        Contains train data of 21/30 volunteer subjects being observed
    * x_train <- test/X_train.txt : 7352 rows, 561 columns 
        Contains recorded features train data
    * y_train <- test/y_train.txt : 7352 rows, 1 columns 
        Contains train data of activities’code labels
        
2. **Merging the Datasets**
    * x (10299 rows, 561 columns) is created by merging x_train and x_test using rbind() function
    * y (10299 rows, 1 column) is created by merging y_train and y_test using rbind() function
    * subjects (10299 rows, 1 column) is created by merging subject_train and subject_test using rbind() function
    * merged_data (10299 rows, 563 column) is created by merging subjects, x and y using cbind() function
    
3. **Extracting only the measurements on the mean and standard deviation for each measurement**
    * TidyData (10299 rows, 88 columns) is created by subsetting Merged_Data, selecting only columns: subject, code and the measurements on the mean and standard deviation (std) for each measurement
    
4. **Using descriptive activity names to name the activities in the data set**
    * Entire numbers in code column of the TidyData replaced with corresponding activity taken from second column of the activity variable
    
5. **Appropriately labeling the data set with descriptive variable names**
    * code column in TidyData renamed into activity
    *  Acc in column’s name replaced by Accelerometer
    * All Gyro in column’s name replaced by Gyroscope
    * All BodyBody in column’s name replaced by Body
    *  Mag in column’s name replaced by Magnitude
    * All start with character f in column’s name replaced by Frequency
    * All start with character t in column’s name replaced by Time
    
6. **From TidyData Dataset, creating a second, independent tidy data set with the average of each variable for each activity and each subject**
    * processed_data(180 rows, 88 columns) is created by sumarizing TidyData taking the means of each variable for each activity and each subject, after groupped by subject and activity.
    * Export processed_data into processed_data.txt file.
***

