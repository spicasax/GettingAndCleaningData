# run_analysis.R

# SET UP:
# One time file download. Make sure you first setwd to where you 
# want to download and unpack the zip file.
fileURL <- 'https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip'
wd <- getwd()
destFile <- paste0(wd,'/Dataset.zip')

if (!file.exists(destFile)) {
    download.file(fileURL,destfile=destFile, method='curl')
    unzip(destFile)
    dateDownloaded <- date()
}

# This R script called run_analysis.R does the following: 

# 1. Merges the training and the test sets to create one data set.

# read top level files
UCIFolder <- 'UCI HAR Dataset'
activityLabels <- read.table(paste0(UCIFolder,'/activity_labels.txt'), header=FALSE)
features <- read.table(paste0(UCIFolder,'/features.txt'), header=FALSE)

# read test files
testFolder <- paste0(UCIFolder,'/test')
xTest <- read.table(paste0(testFolder,'/x_test.txt'), header=FALSE)
yTest <- read.table(paste0(testFolder,'/y_test.txt'), header=FALSE)
subjectTest <- read.table(paste0(testFolder,'/subject_test.txt'), header=FALSE, colClasses=c('factor'))

# read train files
trainFolder <- paste0(UCIFolder,'/train')
xTrain <- read.table(paste0(trainFolder,'/x_train.txt'), header=FALSE)
yTrain <- read.table(paste0(trainFolder,'/y_train.txt'), header=FALSE)
subjectTrain <- read.table(paste0(trainFolder,'/subject_train.txt'), header=FALSE)

# add column names since we had header=FALSE
colnames(activityLabels) <- c('activityID','activityLabel')
colnames(subjectTest) <- c('subjectID')
colnames(xTest) <- features[,2] 
colnames(yTest) <- c('activity')
colnames(subjectTrain) <- c('subjectID')
colnames(xTrain) <- features[,2]
colnames(yTrain) <- c('activity')

# combine yTrain, subjectTrain and xTrain into one table
train <- cbind(yTrain,subjectTrain,xTrain)

# combine yTest, subjectTest and xText into one table
test <- cbind(yTest,subjectTest,xTest)

# combine train and test data into one table
data <- rbind(train, test)

# 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
tidy1 <- data[ , c(1, 2, grep('mean',names(data)), grep('std',names(data) ) ) ]

# 3. Uses descriptive activity names to name the activities in the data set
tidy1$activity <- as.character(tidy1$activity)
tidy1$activity <- activityLabels[ tidy1$activity, 2 ]

# 4. Appropriately labels the data set with descriptive variable names. 
names <- names(tidy1)
names <- gsub('BodyBody', 'Body', names)
names <- gsub('^(t)','time', names)
names <- gsub('^(f)','frequency', names)
names <- gsub('\\(\\)','', names)
names <- gsub('Acc','Accelerometer',names)
names <- gsub('Gyro','Gyroscope', names)
names <- gsub('Mag','Magnitude',names)
names <- gsub('std','StandardDeviation', names)
names <- gsub('mean','MeanValue', names)
names(tidy1) <- names
write.csv(tidy1, "tidy1.csv", row.names=FALSE)

# 5. Creates a second, independent tidy data set with the average of each variable 
# for each activity and each subject. 
tidy2 <- aggregate(tidy1[,-c(1:2)], by=list(activity=tidy1$activity, subject=tidy1$subjectID), FUN='mean', na.rm=TRUE)

# prepend 'MeanOf-' to the column names
colnames(tidy2)[-c(1:2)] <- paste0('MeanOf-',names(tidy2)[-c(1:2)])
write.csv(tidy2, "tidy2.csv", row.names=FALSE)
