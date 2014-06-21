# Original Data

The data for this assignment is data collected from the accelerometers and gyroscopes from the Samsung Galaxy S II smartphone. A complete description of the data is available at the original website: (http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

From the original description of the dataset:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. 


# Variables

The original data contained 561 variables with 10299 total observations (combined training and test sets). For this assignment, we only used the mean and standard deviation of each measurement.

From the ```features_info.txt``` file, we have the following description of the variables:

> The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

> These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

# Transformations
The following transformations of the original data set were performed:

#### 1. Merges the training (```x_train.txt, y_train.txt, subject_train.txt```) and the test (```x_test.txt, y_test.txt, subject_test.txt```) sets to create one data set (```data```).
We used cbind and rbind to preserve the order of the data as much as possible, in case that was needed.
#### 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
These were variables whose names contained either ```mean``` or ```std```. We used ```grep``` to pull only those columns and combine with the first two columns.
#### 3. Uses descriptive activity names to name the activities in the data set. 
The ```y_test.txt``` and ```y_train.txt``` data files used activity IDs, so we substituted the activity labels (```WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING```) from ```activity_labels.txt``` to be more descriptive.
#### 4. Appropriately labels the data set with descriptive variable names. 
This means we made the following changes to the variable names:

| Original | Transformed |
|----|-----|
| t | time |
| f | frequency |
| Acc | Accelerometer |
| Gyro | Gyroscope |
| Mag | Magnitude |
| std | StandardDeviation |
| mean | MeanValue |

This data is then written to the file ```tidy1.csv```.

#### 5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject.
This is written to the file ```tidy2.csv```.

# Transformed Data

## tidy1

| Variables        |
|:-----------------|
| activity | 
| subjectID | 
| timeBodyAccelerometer-MeanValue-X | 
| timeBodyAccelerometer-MeanValue-Y | 
| timeBodyAccelerometer-MeanValue-Z | 
| timeGravityAccelerometer-MeanValue-X | 
| timeGravityAccelerometer-MeanValue-Y | 
| timeGravityAccelerometer-MeanValue-Z | 
| timeBodyAccelerometerJerk-MeanValue-X | 
| timeBodyAccelerometerJerk-MeanValue-Y | 
| timeBodyAccelerometerJerk-MeanValue-Z | 
| timeBodyGyroscope-MeanValue-X | 
| timeBodyGyroscope-MeanValue-Y | 
| timeBodyGyroscope-MeanValue-Z | 
| timeBodyGyroscopeJerk-MeanValue-X | 
| timeBodyGyroscopeJerk-MeanValue-Y | 
| timeBodyGyroscopeJerk-MeanValue-Z | 
| timeBodyAccelerometerMagnitude-MeanValue | 
| timeGravityAccelerometerMagnitude-MeanValue | 
| timeBodyAccelerometerJerkMagnitude-MeanValue | 
| timeBodyGyroscopeMagnitude-MeanValue | 
| timeBodyGyroscopeJerkMagnitude-MeanValue | 
| frequencyBodyAccelerometer-MeanValue-X | 
| frequencyBodyAccelerometer-MeanValue-Y | 
| frequencyBodyAccelerometer-MeanValue-Z | 
| frequencyBodyAccelerometer-MeanValueFreq-X | 
| frequencyBodyAccelerometer-MeanValueFreq-Y | 
| frequencyBodyAccelerometer-MeanValueFreq-Z | 
| frequencyBodyAccelerometerJerk-MeanValue-X | 
| frequencyBodyAccelerometerJerk-MeanValue-Y | 
| frequencyBodyAccelerometerJerk-MeanValue-Z | 
| frequencyBodyAccelerometerJerk-MeanValueFreq-X | 
| frequencyBodyAccelerometerJerk-MeanValueFreq-Y | 
| frequencyBodyAccelerometerJerk-MeanValueFreq-Z | 
| frequencyBodyGyroscope-MeanValue-X | 
| frequencyBodyGyroscope-MeanValue-Y | 
| frequencyBodyGyroscope-MeanValue-Z | 
| frequencyBodyGyroscope-MeanValueFreq-X | 
| frequencyBodyGyroscope-MeanValueFreq-Y | 
| frequencyBodyGyroscope-MeanValueFreq-Z | 
| frequencyBodyAccelerometerMagnitude-MeanValue | 
| frequencyBodyAccelerometerMagnitude-MeanValueFreq | 
| frequencyBodyAccelerometerJerkMagnitude-MeanValue | 
| frequencyBodyAccelerometerJerkMagnitude-MeanValueFreq | 
| frequencyBodyGyroscopeMagnitude-MeanValue | 
| frequencyBodyGyroscopeMagnitude-MeanValueFreq | 
| frequencyBodyGyroscopeJerkMagnitude-MeanValue | 
| frequencyBodyGyroscopeJerkMagnitude-MeanValueFreq | 
| timeBodyAccelerometer-StandardDeviation-X | 
| timeBodyAccelerometer-StandardDeviation-Y | 
| timeBodyAccelerometer-StandardDeviation-Z | 
| timeGravityAccelerometer-StandardDeviation-X | 
| timeGravityAccelerometer-StandardDeviation-Y | 
| timeGravityAccelerometer-StandardDeviation-Z | 
| timeBodyAccelerometerJerk-StandardDeviation-X | 
| timeBodyAccelerometerJerk-StandardDeviation-Y | 
| timeBodyAccelerometerJerk-StandardDeviation-Z | 
| timeBodyGyroscope-StandardDeviation-X | 
| timeBodyGyroscope-StandardDeviation-Y | 
| timeBodyGyroscope-StandardDeviation-Z | 
| timeBodyGyroscopeJerk-StandardDeviation-X | 
| timeBodyGyroscopeJerk-StandardDeviation-Y | 
| timeBodyGyroscopeJerk-StandardDeviation-Z | 
| timeBodyAccelerometerMagnitude-StandardDeviation | 
| timeGravityAccelerometerMagnitude-StandardDeviation | 
| timeBodyAccelerometerJerkMagnitude-StandardDeviation | 
| timeBodyGyroscopeMagnitude-StandardDeviation | 
| timeBodyGyroscopeJerkMagnitude-StandardDeviation | 
| frequencyBodyAccelerometer-StandardDeviation-X | 
| frequencyBodyAccelerometer-StandardDeviation-Y | 
| frequencyBodyAccelerometer-StandardDeviation-Z | 
| frequencyBodyAccelerometerJerk-StandardDeviation-X | 
| frequencyBodyAccelerometerJerk-StandardDeviation-Y | 
| frequencyBodyAccelerometerJerk-StandardDeviation-Z | 
| frequencyBodyGyroscope-StandardDeviation-X | 
| frequencyBodyGyroscope-StandardDeviation-Y | 
| frequencyBodyGyroscope-StandardDeviation-Z | 
| frequencyBodyAccelerometerMagnitude-StandardDeviation | 
| frequencyBodyAccelerometerJerkMagnitude-StandardDeviation | 
| frequencyBodyGyroscopeMagnitude-StandardDeviation | 
| frequencyBodyGyroscopeJerkMagnitude-StandardDeviation |

## tidy2

| Variables        |
|:-----------------|
| activity | 
| subject | 
| MeanOf-timeBodyAccelerometer-MeanValue-X | 
| MeanOf-timeBodyAccelerometer-MeanValue-Y | 
| MeanOf-timeBodyAccelerometer-MeanValue-Z | 
| MeanOf-timeGravityAccelerometer-MeanValue-X | 
| MeanOf-timeGravityAccelerometer-MeanValue-Y | 
| MeanOf-timeGravityAccelerometer-MeanValue-Z | 
| MeanOf-timeBodyAccelerometerJerk-MeanValue-X | 
| MeanOf-timeBodyAccelerometerJerk-MeanValue-Y | 
| MeanOf-timeBodyAccelerometerJerk-MeanValue-Z | 
| MeanOf-timeBodyGyroscope-MeanValue-X | 
| MeanOf-timeBodyGyroscope-MeanValue-Y | 
| MeanOf-timeBodyGyroscope-MeanValue-Z | 
| MeanOf-timeBodyGyroscopeJerk-MeanValue-X | 
| MeanOf-timeBodyGyroscopeJerk-MeanValue-Y | 
| MeanOf-timeBodyGyroscopeJerk-MeanValue-Z | 
| MeanOf-timeBodyAccelerometerMagnitude-MeanValue | 
| MeanOf-timeGravityAccelerometerMagnitude-MeanValue | 
| MeanOf-timeBodyAccelerometerJerkMagnitude-MeanValue | 
| MeanOf-timeBodyGyroscopeMagnitude-MeanValue | 
| MeanOf-timeBodyGyroscopeJerkMagnitude-MeanValue | 
| MeanOf-frequencyBodyAccelerometer-MeanValue-X | 
| MeanOf-frequencyBodyAccelerometer-MeanValue-Y | 
| MeanOf-frequencyBodyAccelerometer-MeanValue-Z | 
| MeanOf-frequencyBodyAccelerometer-MeanValueFreq-X | 
| MeanOf-frequencyBodyAccelerometer-MeanValueFreq-Y | 
| MeanOf-frequencyBodyAccelerometer-MeanValueFreq-Z | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValue-X | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValue-Y | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValue-Z | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValueFreq-X | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValueFreq-Y | 
| MeanOf-frequencyBodyAccelerometerJerk-MeanValueFreq-Z | 
| MeanOf-frequencyBodyGyroscope-MeanValue-X | 
| MeanOf-frequencyBodyGyroscope-MeanValue-Y | 
| MeanOf-frequencyBodyGyroscope-MeanValue-Z | 
| MeanOf-frequencyBodyGyroscope-MeanValueFreq-X | 
| MeanOf-frequencyBodyGyroscope-MeanValueFreq-Y | 
| MeanOf-frequencyBodyGyroscope-MeanValueFreq-Z | 
| MeanOf-frequencyBodyAccelerometerMagnitude-MeanValue | 
| MeanOf-frequencyBodyAccelerometerMagnitude-MeanValueFreq | 
| MeanOf-frequencyBodyAccelerometerJerkMagnitude-MeanValue | 
| MeanOf-frequencyBodyAccelerometerJerkMagnitude-MeanValueFreq | 
| MeanOf-frequencyBodyGyroscopeMagnitude-MeanValue | 
| MeanOf-frequencyBodyGyroscopeMagnitude-MeanValueFreq | 
| MeanOf-frequencyBodyGyroscopeJerkMagnitude-MeanValue | 
| MeanOf-frequencyBodyGyroscopeJerkMagnitude-MeanValueFreq | 
| MeanOf-timeBodyAccelerometer-StandardDeviation-X | 
| MeanOf-timeBodyAccelerometer-StandardDeviation-Y | 
| MeanOf-timeBodyAccelerometer-StandardDeviation-Z | 
| MeanOf-timeGravityAccelerometer-StandardDeviation-X | 
| MeanOf-timeGravityAccelerometer-StandardDeviation-Y | 
| MeanOf-timeGravityAccelerometer-StandardDeviation-Z | 
| MeanOf-timeBodyAccelerometerJerk-StandardDeviation-X | 
| MeanOf-timeBodyAccelerometerJerk-StandardDeviation-Y | 
| MeanOf-timeBodyAccelerometerJerk-StandardDeviation-Z | 
| MeanOf-timeBodyGyroscope-StandardDeviation-X | 
| MeanOf-timeBodyGyroscope-StandardDeviation-Y | 
| MeanOf-timeBodyGyroscope-StandardDeviation-Z | 
| MeanOf-timeBodyGyroscopeJerk-StandardDeviation-X | 
| MeanOf-timeBodyGyroscopeJerk-StandardDeviation-Y | 
| MeanOf-timeBodyGyroscopeJerk-StandardDeviation-Z | 
| MeanOf-timeBodyAccelerometerMagnitude-StandardDeviation | 
| MeanOf-timeGravityAccelerometerMagnitude-StandardDeviation | 
| MeanOf-timeBodyAccelerometerJerkMagnitude-StandardDeviation | 
| MeanOf-timeBodyGyroscopeMagnitude-StandardDeviation | 
| MeanOf-timeBodyGyroscopeJerkMagnitude-StandardDeviation | 
| MeanOf-frequencyBodyAccelerometer-StandardDeviation-X | 
| MeanOf-frequencyBodyAccelerometer-StandardDeviation-Y | 
| MeanOf-frequencyBodyAccelerometer-StandardDeviation-Z | 
| MeanOf-frequencyBodyAccelerometerJerk-StandardDeviation-X | 
| MeanOf-frequencyBodyAccelerometerJerk-StandardDeviation-Y | 
| MeanOf-frequencyBodyAccelerometerJerk-StandardDeviation-Z | 
| MeanOf-frequencyBodyGyroscope-StandardDeviation-X | 
| MeanOf-frequencyBodyGyroscope-StandardDeviation-Y | 
| MeanOf-frequencyBodyGyroscope-StandardDeviation-Z | 
| MeanOf-frequencyBodyAccelerometerMagnitude-StandardDeviation | 
| MeanOf-frequencyBodyAccelerometerJerkMagnitude-StandardDeviation | 
| MeanOf-frequencyBodyGyroscopeMagnitude-StandardDeviation | 
| MeanOf-frequencyBodyGyroscopeJerkMagnitude-StandardDeviation |

