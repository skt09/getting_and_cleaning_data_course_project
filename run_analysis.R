library(dplyr)

options(warn = -1)

# Loading the Datasets into R
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("serial_no", "features"))
activity <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$features)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$features)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merging the Datasets
subjects <- rbind(subject_test, subject_train)
x <- rbind(x_test, x_train)
y <- rbind(y_test, y_train)
merged_data <- cbind(subjects, x, y)

#Extracting only the measurements on the mean and standard deviation for each measurement
TidyData <- merged_data %>% select(subject, code, contains("mean"), contains("std"))

# Using descriptive activity names to name the activities in the data set
TidyData$code <- activity[TidyData$code, 2]

# Appropriately labeling the data set with descriptive variable names
names(TidyData)[2] <- "activity"
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("Freq", "Frequency", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))
names(TidyData) <- gsub("mean", "Mean", names(TidyData))
names(TidyData) <- gsub("std", "STD", names(TidyData))

# From TidyData Dataset, creating a second, independent tidy data set 
# with the average of each variable for each activity and each subject
FinalData <- TidyData %>% group_by(subject, activity) %>%
  summarise_all(list(mean = mean))
names(FinalData) <- gsub("_mean", "", names(FinalData))
write.table(FinalData, file = "processed_data.txt", row.names = FALSE)
