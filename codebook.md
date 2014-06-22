# Code Book

## ID fields
* subject( Column 1)
* activity( Column 2)


## Feature Selection 
( full description is available  http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones )

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

note : X, Y and Z are the directions.

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
## data analysis
* mean(tBodyAcc-X)( Column 3)
* mean(tBodyAcc-Y)( Column 4)
* mean(tBodyAcc-Z)( Column 5)
* mean(tGravityAcc-X)( Column 6)
* mean(tGravityAcc-Y)( Column 7)
* mean(tGravityAcc-Z)( Column 8)
* mean(tBodyAccJerk-X)( Column 9)
* mean(tBodyAccJerk-Y)( Column 10)
* mean(tBodyAccJerk-Z)( Column 11)
* mean(tBodyGyro-X)( Column 12)
* mean(tBodyGyro-Y)( Column 13)
* mean(tBodyGyro-Z)( Column 14)
* mean(tBodyGyroJerk-X)( Column 15)
* mean(tBodyGyroJerk-Y)( Column 16)
* mean(tBodyGyroJerk-Z)( Column 17)
* mean(tBodyAccMag)( Column 18)
* mean(tGravityAccMag)( Column 19)
* mean(tBodyAccJerkMag)( Column 20)
* mean(tBodyGyroMag)( Column 21)
* mean(tBodyGyroJerkMag)( Column 22)
* mean(fBodyAcc-X)( Column 23)
* mean(fBodyAcc-Y)( Column 24)
* mean(fBodyAcc-Z)( Column 25)
* mean(fBodyAccJerk-X)( Column 26)
* mean(fBodyAccJerk-Y)( Column 27)
* mean(fBodyAccJerk-Z)( Column 28)
* mean(fBodyGyro-X)( Column 29)
* mean(fBodyGyro-Y)( Column 30)
* mean(fBodyGyro-Z)( Column 31)
* mean(fBodyAccMag)( Column 32)
* mean(fBodyAccJerkMag)( Column 33)
* mean(fBodyGyroMag)( Column 34)
* mean(fBodyGyroJerkMag)( Column 35)
* std(tBodyAcc-X)( Column 36)
* std(tBodyAcc-Y)( Column 37)
* std(tBodyAcc-Z)( Column 38)
* std(tGravityAcc-X)( Column 39)
* std(tGravityAcc-Y)( Column 40)
* std(tGravityAcc-Z)( Column 41)
* std(tBodyAccJerk-X)( Column 42)
* std(tBodyAccJerk-Y)( Column 43)
* std(tBodyAccJerk-Z)( Column 44)
* std(tBodyGyro-X)( Column 45)
* std(tBodyGyro-Y)( Column 46)
* std(tBodyGyro-Z)( Column 47)
* std(tBodyGyroJerk-X)( Column 48)
* std(tBodyGyroJerk-Y)( Column 49)
* std(tBodyGyroJerk-Z)( Column 50)
* std(tBodyAccMag)( Column 51)
* std(tGravityAccMag)( Column 52)
* std(tBodyAccJerkMag)( Column 53)
* std(tBodyGyroMag)( Column 54)
* std(tBodyGyroJerkMag)( Column 55)
* std(fBodyAcc-X)( Column 56)
* std(fBodyAcc-Y)( Column 57)
* std(fBodyAcc-Z)( Column 58)
* std(fBodyAccJerk-X)( Column 59)
* std(fBodyAccJerk-Y)( Column 60)
* std(fBodyAccJerk-Z)( Column 61)
* std(fBodyGyro-X)( Column 62)
* std(fBodyGyro-Y)( Column 63)
* std(fBodyGyro-Z)( Column 64)
* std(fBodyAccMag)( Column 65)
* std(fBodyAccJerkMag)( Column 66)
* std(fBodyGyroMag)( Column 67)
* std(fBodyGyroJerkMag)( Column 68)
