# CodeBook

## Data Description

The dataset used for this project is derived from the "Human Activity Recognition Using Smartphones Dataset" available from the UCI Machine Learning Repository. It contains accelerometer and gyroscope readings collected from 30 participants performing different activities of daily living. The data was collected using a Samsung Galaxy S smartphone's embedded sensors.

## Variables

### Identifiers
- `subject`: An identifier for each subject (ranging from 1 to 30).
- `activity`: The activity performed by the subject. The activities include:
  - `WALKING`
  - `WALKING_UPSTAIRS`
  - `WALKING_DOWNSTAIRS`
  - `SITTING`
  - `STANDING`
  - `LAYING`

### Measurement Variables

The measurements included in the final tidy dataset represent the **average** of various sensor signals for each activity and each subject. Below are some examples of variables included:

- **Time Domain Variables**:
  - `TimeBodyAccelerometerMeanX`: The average value of time-domain body accelerometer signal along the X axis.
  - `TimeBodyAccelerometerMeanY`: The average value of time-domain body accelerometer signal along the Y axis.
  - `TimeBodyAccelerometerMeanZ`: The average value of time-domain body accelerometer signal along the Z axis.
  - `TimeBodyAccelerometerSTD_X`: The standard deviation of time-domain body accelerometer signal along the X axis.

- **Frequency Domain Variables**:
  - `FrequencyBodyAccelerometerMeanX`: The average value of the frequency-domain body accelerometer signal along the X axis.
  - `FrequencyBodyGyroscopeMeanY`: The average value of frequency-domain gyroscope signal along the Y axis.
  - `FrequencyBodyGyroscopeSTD_Z`: The standard deviation of frequency-domain gyroscope signal along the Z axis.

**Note**: Variable names are descriptive to indicate the source of the data:
- `Time` and `Frequency`: Denote if the measurement was captured in the time or frequency domain.
- `Body` and `Gravity`: Indicate if the acceleration was due to body movement or gravity.
- `Accelerometer` and `Gyroscope`: Indicate the type of sensor.
- `Mean` and `STD`: Indicate if the measurement is the mean or standard deviation.

## Transformations

1. **Merge Training and Test Sets**: Combined the training and test datasets to form a single dataset.
2. **Extract Measurements on Mean and Standard Deviation**: Only variables containing mean (`mean()`) or standard deviation (`std()`) were retained.
3. **Use Descriptive Activity Names**: The activity labels were replaced with their respective descriptive names.
4. **Label Variables Appropriately**: Variables were renamed to more descriptive names that make it easier to understand the type of data they represent.
5. **Create Tidy Dataset**: A new dataset was created containing the average of each variable for each activity and each subject.

## Data Source

- **Original Dataset**: The original dataset was obtained from the UCI Machine Learning Repository: [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

## Summary of Tidy Dataset

- The tidy dataset contains **180 rows** and **68 columns**.
  - **180 Rows**: 30 subjects × 6 activities = 180 unique combinations.
  - **68 Columns**: 66 measurement variables + 1 subject column + 1 activity column.
