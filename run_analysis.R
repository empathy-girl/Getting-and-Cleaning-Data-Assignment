# Load necessary packages
library(dplyr)

# 1. Load data
# Assuming that the working directory contains the unzipped "UCI HAR Dataset" folder
dataset_path <- "UCI HAR Dataset"

# Load feature and activity labels
features <- read.table(file.path(dataset_path, "features.txt"), col.names = c("index", "feature_name"))
activities <- read.table(file.path(dataset_path, "activity_labels.txt"), col.names = c("activity_id", "activity_name"))

# Load training and test datasets
subject_train <- read.table(file.path(dataset_path, "train", "subject_train.txt"), col.names = "subject")
x_train <- read.table(file.path(dataset_path, "train", "X_train.txt"), col.names = features$feature_name)
y_train <- read.table(file.path(dataset_path, "train", "y_train.txt"), col.names = "activity_id")

subject_test <- read.table(file.path(dataset_path, "test", "subject_test.txt"), col.names = "subject")
x_test <- read.table(file.path(dataset_path, "test", "X_test.txt"), col.names = features$feature_name)
y_test <- read.table(file.path(dataset_path, "test", "y_test.txt"), col.names = "activity_id")

# 2. Merge training and test sets
subject_data <- rbind(subject_train, subject_test)
x_data <- rbind(x_train, x_test)
y_data <- rbind(y_train, y_test)

# Combine all data into one dataset
data_combined <- cbind(subject_data, y_data, x_data)

# 3. Extract only measurements on the mean and standard deviation
mean_std_features <- grepl("mean\(\)|std\(\)", features$feature_name)
x_data_mean_std <- x_data[, mean_std_features]
data_combined_mean_std <- cbind(subject_data, y_data, x_data_mean_std)

# 4. Use descriptive activity names
data_combined_mean_std <- merge(data_combined_mean_std, activities, by.x = "activity_id", by.y = "activity_id")
data_combined_mean_std <- data_combined_mean_std %>% select(-activity_id) %>% rename(activity = activity_name)

# 5. Appropriately label the dataset with descriptive variable names
names(data_combined_mean_std) <- gsub("^t", "Time", names(data_combined_mean_std))
names(data_combined_mean_std) <- gsub("^f", "Frequency", names(data_combined_mean_std))
names(data_combined_mean_std) <- gsub("Acc", "Accelerometer", names(data_combined_mean_std))
names(data_combined_mean_std) <- gsub("Gyro", "Gyroscope", names(data_combined_mean_std))
names(data_combined_mean_std) <- gsub("Mag", "Magnitude", names(data_combined_mean_std))
names(data_combined_mean_std) <- gsub("BodyBody", "Body", names(data_combined_mean_std))

# 6. Create a second, independent tidy dataset with the average of each variable for each activity and each subject
tidy_data <- data_combined_mean_std %>% 
  group_by(subject, activity) %>% 
  summarise_all(mean)

# 7. Write the tidy dataset to a txt file
write.table(tidy_data, file = "tidy_data.txt", row.name = FALSE)

# End of script
